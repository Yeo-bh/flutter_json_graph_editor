import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/styles/atom-one-light.dart';
import '../models/editor_panel_style.dart';
import '../state/editor_state.dart';
import '../utils/json_parser.dart';

// 화면 좌측 패널: 라인 번호 + 문법 강조 JSON 에디터
class EditorPanel extends StatefulWidget {
  final EditorPanelStyle style;

  EditorPanel({super.key, EditorPanelStyle? style})
    : style = style ?? EditorPanelStyle();

  @override
  State<EditorPanel> createState() => _EditorPanelState();
}

class _EditorPanelState extends State<EditorPanel> {
  late final CodeLineEditingController _controller;
  late final EditorState _editorState;

  @override
  void initState() {
    super.initState();
    _editorState = context.read<EditorState>();
    _controller = CodeLineEditingController.fromText(_editorState.jsonText);
    _editorState.addListener(_syncController);
  }

  void _syncController() {
    if (_controller.text != _editorState.jsonText) {
      _controller.text = _editorState.jsonText;
    }
  }

  @override
  void dispose() {
    _editorState.removeListener(_syncController);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Consumer: EditorState가 notifyListeners() 할 때마다 이 빌더만 리빌드
    return Consumer<EditorState>(
      builder: (context, state, _) {
        // 텍스트가 있는데 파싱 에러가 있을 때만 하단 에러 바 표시
        final hasError = state.error != null && state.jsonText.isNotEmpty;
        return Column(
          children: [
            _Toolbar(
              onClear: () {
                _controller.text = ''; // 에디터 내용 지우기
                state.updateText(''); // 그래프도 초기화
              },
              onFormat: () {
                // JSON 포맷팅 시도, 실패하면 현재 텍스트 그대로 유지
                final formatted = formatJson(_controller.text);
                if (formatted == null) {
                  state.updateText(_controller.text);
                  return;
                }
                _controller.text = formatted; // 에디터 텍스트 교체
                state.updateText(formatted); // 그래프도 업데이트
              },
              toolbarBackgroundColor: widget.style.toolbarBackgroundColor,
              toolbarTitleColor: widget.style.toolbarTitleColor,
              toolbarIconColor: widget.style.toolbarIconColor,
            ),
            Expanded(
              child: Container(
                color: widget.style.codeBackgroundColor,
                child: CodeEditor(
                  controller: _controller,
                  // 텍스트가 바뀔 때마다 EditorState에 전달 → 실시간 그래프 갱신
                  onChanged: (_) => state.updateText(_controller.text),
                  wordWrap: false, // 긴 줄 자동 줄바꿈 비활성화
                  padding: widget.style.codePadding,
                  // { } [ ] 블록 접기 기능 분석기
                  chunkAnalyzer: DefaultCodeChunkAnalyzer(),
                  style: CodeEditorStyle(
                    textColor: widget.style.codeTextColor,
                    fontSize: widget.style.codeFontSize,
                    fontFamily: widget.style.codeFontFamily,
                    fontHeight: widget.style.codeFontHeight,
                    cursorColor: widget.style.cursorColor,
                    selectionColor: widget.style.selectionColor, // 텍스트 선택 배경색
                    cursorLineColor:
                        widget.style.cursorLineColor, // 현재 커서 줄 하이라이트
                    codeTheme: widget.style.codeTheme ?? CodeHighlightTheme(
                    languages: {'json': CodeHighlightThemeMode(mode: langJson)},
                    theme: atomOneLightTheme,
                  ),
                  ),
                  // indicatorBuilder: 에디터 왼쪽에 라인 번호 영역을 커스텀으로 구성
                  indicatorBuilder:
                      (context, editingController, chunkController, notifier) {
                        return Row(
                          children: [
                            // 라인 번호 표시 영역
                            Container(
                              color: widget.style.lineNumberBackgroundColor,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 8,
                              ),
                              child: DefaultCodeLineNumber(
                                controller: editingController,
                                notifier: notifier,
                                // 포커스 없을 때 라인 번호 색상
                                textStyle: TextStyle(
                                  color: widget.style.lineNumberTextColor,
                                  fontSize: 12,
                                  fontFamily: 'monospace',
                                  height: 1.6,
                                ),
                                // 커서가 있는 줄의 라인 번호 색상 (더 밝게)
                                focusedTextStyle: TextStyle(
                                  color:
                                      widget.style.lineNumberFocusedTextColor,
                                  fontSize: 12,
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.w600,
                                  height: 1.6,
                                ),
                              ),
                            ),
                            // { } [ ] 블록 접기 화살표 아이콘 영역
                            DefaultCodeChunkIndicator(
                              width: widget.style.chunkIndicatorWidth,
                              controller: chunkController,
                              notifier: notifier,
                            ),
                          ],
                        );
                      },
                  // 라인 번호 영역과 코드 영역 사이 구분선
                  sperator: Container(
                    width: 1,
                    color: widget.style.separatorColor,
                  ),
                ),
              ),
            ),
            // JSON 파싱 실패 시 하단에 에러 메시지 표시
            if (hasError)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                color: widget.style.errorBarBackgroundColor,
                child: Text(
                  '⚠ ${state.error}',
                  style: TextStyle(
                    color: widget.style.errorBarTextColor,
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

// 상단 툴바: 타이틀 + Format / Clear 버튼
class _Toolbar extends StatelessWidget {
  final VoidCallback onClear;
  final VoidCallback onFormat;
  final Color toolbarBackgroundColor;
  final Color toolbarTitleColor;
  final Color toolbarIconColor;

  const _Toolbar({
    required this.onClear,
    required this.onFormat,
    required this.toolbarBackgroundColor,
    required this.toolbarTitleColor,
    required this.toolbarIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: toolbarBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(Icons.data_object, size: 14, color: toolbarIconColor),
          const SizedBox(width: 8),
          Text(
            'JSON',
            style: TextStyle(
              color: toolbarTitleColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onFormat,
            tooltip: 'Format JSON',
            icon: const Icon(Icons.format_align_left),
            color: toolbarIconColor,
            iconSize: 17,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightFor(width: 32, height: 32),
          ),
          TextButton(
            onPressed: onClear,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Clear',
              style: TextStyle(color: toolbarIconColor, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
