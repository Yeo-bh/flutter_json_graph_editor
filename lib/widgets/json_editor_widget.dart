import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/json_editor_style.dart';
import '../state/editor_state.dart';
import 'editor_panel.dart';
import 'graph_panel.dart';
import 'graph_toolbar.dart';
import 'split_view.dart';

/// JSON 에디터 패키지의 최상위 위젯.
/// [style]로 전체 테마를 한 번에 제어하고,
/// [extraActions]로 툴바에 버튼을 추가할 수 있다.
class JsonEditorWidget extends StatefulWidget {
  /// 에디터 전체 시각적 스타일. 기본값은 라이트 테마.
  final JsonEditorStyle style;

  /// 그래프 패널 하단 툴바에 추가할 사용자 정의 버튼 목록.
  final List<GraphToolbarAction> extraActions;

  /// 에디터의 초기 JSON 텍스트. null이면 EditorState 기본값 사용.
  final String? initialJson;

  JsonEditorWidget({
    super.key,
    JsonEditorStyle? style,
    this.extraActions = const [],
    this.initialJson,
  }) : style = style ?? JsonEditorStyle();

  @override
  State<JsonEditorWidget> createState() => _JsonEditorWidgetState();
}

class _JsonEditorWidgetState extends State<JsonEditorWidget> {
  final _splitViewKey = GlobalKey<SplitViewState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditorState(
        initialJson: widget.initialJson,
        collapseChildrenByDefault: widget.style.collapseChildrenByDefault,
        collapseEntriesByDefault: widget.style.collapseEntriesByDefault,
      ),
      child: SplitView(
        key: _splitViewKey,
        style: widget.style.splitView,
        left: EditorPanel(style: widget.style.editorPanel),
        right: GraphPanel(
          style: widget.style.graphPanel,
          toolbarStyle: widget.style.graphToolbar,
          edgeStyle: widget.style.edge,
          nodeCardStyle: widget.style.nodeCard,
          nodeInfoDialogStyle: widget.style.nodeInfoDialog,
          addChildDialogStyle: widget.style.addChildDialog,
          onToggleEditorPanel: () => _splitViewKey.currentState?.toggle(),
          extraActions: widget.extraActions,
        ),
      ),
    );
  }
}
