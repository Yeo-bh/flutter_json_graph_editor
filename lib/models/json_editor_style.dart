import 'edge_style.dart';
import 'editor_panel_style.dart';
import 'graph_panel_style.dart';
import 'graph_toolbar_style.dart';
import 'node_card_style.dart';
import 'node_info_dialog_style.dart';
import 'split_view_style.dart';

/// JSON 에디터 전체의 시각적 옵션을 한곳에서 관리하는 번들 스타일.
/// [JsonEditorWidget]에 이 하나만 전달하면 모든 하위 위젯의 테마가 바뀜.
class JsonEditorStyle {
  /// 노드 카드 스타일.
  final NodeCardStyle nodeCard;

  /// 노드 상세 다이얼로그 스타일.
  final NodeInfoDialogStyle nodeInfoDialog;

  /// 노드 연결선(엣지) 스타일.
  final EdgeStyle edge;

  /// 그래프 패널(캔버스 영역) 스타일.
  final GraphPanelStyle graphPanel;

  /// 그래프 패널 하단 툴바 스타일.
  final GraphToolbarStyle graphToolbar;

  /// 좌우 분할 뷰 스타일.
  final SplitViewStyle splitView;

  /// 좌측 JSON 코드 에디터 패널 스타일.
  final EditorPanelStyle editorPanel;

  JsonEditorStyle({
    NodeCardStyle? nodeCard,
    NodeInfoDialogStyle? nodeInfoDialog,
    EdgeStyle? edge,
    GraphPanelStyle? graphPanel,
    GraphToolbarStyle? graphToolbar,
    SplitViewStyle? splitView,
    EditorPanelStyle? editorPanel,
  })  : nodeCard = nodeCard ?? const NodeCardStyle(),
        nodeInfoDialog = nodeInfoDialog ?? const NodeInfoDialogStyle(),
        edge = edge ?? const EdgeStyle(),
        graphPanel = graphPanel ?? const GraphPanelStyle(),
        graphToolbar = graphToolbar ?? const GraphToolbarStyle(),
        splitView = splitView ?? const SplitViewStyle(),
        editorPanel = editorPanel ?? EditorPanelStyle();

  JsonEditorStyle copyWith({
    NodeCardStyle? nodeCard,
    NodeInfoDialogStyle? nodeInfoDialog,
    EdgeStyle? edge,
    GraphPanelStyle? graphPanel,
    GraphToolbarStyle? graphToolbar,
    SplitViewStyle? splitView,
    EditorPanelStyle? editorPanel,
  }) {
    return JsonEditorStyle(
      nodeCard: nodeCard ?? this.nodeCard,
      nodeInfoDialog: nodeInfoDialog ?? this.nodeInfoDialog,
      edge: edge ?? this.edge,
      graphPanel: graphPanel ?? this.graphPanel,
      graphToolbar: graphToolbar ?? this.graphToolbar,
      splitView: splitView ?? this.splitView,
      editorPanel: editorPanel ?? this.editorPanel,
    );
  }
}
