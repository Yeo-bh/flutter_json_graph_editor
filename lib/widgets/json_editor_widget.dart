import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/json_editor_style.dart';
import '../state/editor_state.dart';
import 'editor_panel/editor_panel.dart';
import 'graph_panel/graph_panel.dart';
import 'graph_toolbar/graph_toolbar.dart';
import 'split_view/split_view.dart';

/// JSON 에디터 패키지의 최상위 위젯.
/// [style]로 전체 테마를 한 번에 제어하고,
/// [extraActions]로 툴바에 버튼을 추가할 수 있다.
/// [externalState]를 제공하면 내부 EditorState 대신 외부 인스턴스를 사용한다.
/// [onChanged]는 JSON이 유효하게 수정될 때마다 파싱된 dynamic 값을 전달한다.
class JsonEditorWidget extends StatefulWidget {
  /// 에디터 전체 시각적 스타일. 기본값은 라이트 테마.
  final JsonEditorStyle style;

  /// 그래프 패널 하단 툴바에 추가할 사용자 정의 버튼 목록.
  final List<GraphToolbarAction> extraActions;

  /// 에디터의 초기 JSON 텍스트. null이면 EditorState 기본값 사용.
  /// [externalState]가 제공되면 무시된다.
  final String? initialJson;

  /// 외부에서 생성한 EditorState. 제공 시 위젯이 직접 state를 소유하지 않는다.
  final EditorState? externalState;

  /// JSON이 유효하게 변경될 때마다 호출. Map 또는 List 형태의 dynamic 값을 전달.
  final ValueChanged<dynamic>? onChanged;

  JsonEditorWidget({
    super.key,
    JsonEditorStyle? style,
    this.extraActions = const [],
    this.initialJson,
    this.externalState,
    this.onChanged,
  }) : style = style ?? JsonEditorStyle();

  @override
  State<JsonEditorWidget> createState() => _JsonEditorWidgetState();
}

class _JsonEditorWidgetState extends State<JsonEditorWidget> {
  final _splitViewKey = GlobalKey<SplitViewState>();
  EditorState? _ownedState;

  EditorState get _activeState => widget.externalState ?? _ownedState!;

  @override
  void initState() {
    super.initState();
    if (widget.externalState == null) {
      _ownedState = EditorState(
        initialJson: widget.initialJson,
        collapseChildrenByDefault: widget.style.collapseChildrenByDefault,
        collapseEntriesByDefault: widget.style.collapseEntriesByDefault,
      );
    }
    if (widget.onChanged != null) {
      _activeState.addListener(_onStateChanged);
    }
  }

  @override
  void didUpdateWidget(JsonEditorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.onChanged != widget.onChanged) {
      _activeState.removeListener(_onStateChanged);
      if (widget.onChanged != null) {
        _activeState.addListener(_onStateChanged);
      }
    }
  }

  void _onStateChanged() {
    final state = _activeState;
    if (state.error != null || widget.onChanged == null) return;
    try {
      final parsed = jsonDecode(state.jsonText);
      widget.onChanged!(parsed);
    } catch (_) {}
  }

  @override
  void dispose() {
    _activeState.removeListener(_onStateChanged);
    _ownedState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.externalState ?? _ownedState!;
    return ChangeNotifierProvider.value(
      value: state,
      child: SplitView(
        key: _splitViewKey,
        style: widget.style.splitView,
        left: EditorPanel(style: widget.style.editorPanel),
        right: GraphPanel(
          style: widget.style.graphPanel,
          toolbarStyle: widget.style.graphToolbar,
          edgeStyle: widget.style.edge,
          nodeCardStyle: widget.style.nodeCard,
          nodeDetailStyle: widget.style.nodeDetail,
          addChildDialogStyle: widget.style.addChildDialog,
          onToggleEditorPanel: () => _splitViewKey.currentState?.toggle(),
          extraActions: widget.extraActions,
        ),
      ),
    );
  }
}
