import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/add_child_dialog_style.dart';
import '../../models/edge_style.dart';
import '../../models/graph_panel_style.dart';
import '../../models/graph_toolbar_style.dart';
import '../../models/json_node.dart';
import '../../models/node_card_style.dart';
import '../../models/node_detail_style.dart';
import '../../state/editor_state.dart';
import '../../utils/graph_transform.dart';
import '../graph_toolbar/graph_toolbar.dart';
import '../node_side_panel/node_side_panel.dart';
import 'graph_view.dart';
import 'grid_painter.dart';

// 화면 우측 패널: 격자 배경 + JSON 시각화 그래프 + 줌 툴바
class GraphPanel extends StatefulWidget {
  final GraphPanelStyle style;
  final GraphToolbarStyle toolbarStyle;
  final EdgeStyle edgeStyle;
  final NodeCardStyle nodeCardStyle;
  final NodeDetailStyle nodeDetailStyle;
  final AddChildDialogStyle addChildDialogStyle;

  /// 에디터 패널 접기/펼치기 콜백. null이면 툴바 버튼 미표시.
  final VoidCallback? onToggleEditorPanel;

  /// 툴바에 추가할 사용자 정의 버튼 목록
  /// 예: save, export, share 등 원하는 기능을 GraphToolbarAction으로 정의해서 전달
  final List<GraphToolbarAction> extraActions;

  const GraphPanel({
    super.key,
    this.style = const GraphPanelStyle(),
    this.toolbarStyle = const GraphToolbarStyle(),
    this.edgeStyle = const EdgeStyle(),
    this.nodeCardStyle = const NodeCardStyle(),
    this.nodeDetailStyle = const NodeDetailStyle(),
    this.addChildDialogStyle = const AddChildDialogStyle(),
    this.onToggleEditorPanel,
    this.extraActions = const [],
  });

  @override
  State<GraphPanel> createState() => _GraphPanelState();
}

class _GraphPanelState extends State<GraphPanel> {
  final _transform = TransformationController();
  JsonNode? _selectedNode; // 사이드 패널에 표시할 노드 (null이면 패널 닫힘)

  void _openPanel(JsonNode node) {
    setState(() => _selectedNode = node);
    context.read<EditorState>().selectNode(node.path);
  }

  void _closePanel() {
    setState(() => _selectedNode = null);
    context.read<EditorState>().selectNode(null);
  }

  @override
  void dispose() {
    _transform.dispose();
    super.dispose();
  }

  // 현재 스케일에 factor 곱하기, 뷰포트 중심 기준으로 줌
  void _scaleBy(double factor, Size viewport) {
    final old = _transform.value;
    final currentScale = old.getMaxScaleOnAxis();
    final newScale = (currentScale * factor).clamp(0.1, 4.0);
    if (newScale == currentScale) return;

    final f = newScale / currentScale;
    final tx = old.entry(0, 3);
    final ty = old.entry(1, 3);
    final cx = viewport.width / 2;
    final cy = viewport.height / 2;

    // 뷰포트 중심이 고정되도록 translation 재계산: newTx = cx - (cx - tx) * f
    _transform.value = buildViewMatrix(
      cx - (cx - tx) * f,
      cy - (cy - ty) * f,
      newScale,
    );
  }

  // 모든 노드가 뷰포트에 꽉 차도록 스케일·위치 재조정
  void _fitToView(Size viewport, JsonNode? root) {
    if (root == null) {
      _transform.value = Matrix4.identity();
      return;
    }
    final bounds = computeBounds(root);
    final canvasW = bounds.right + 80;
    final canvasH = bounds.bottom + 80;
    final scaleX = viewport.width / canvasW;
    final scaleY = viewport.height / canvasH;
    final scale = (scaleX < scaleY ? scaleX : scaleY).clamp(0.1, 4.0);
    final tx = (viewport.width - canvasW * scale) / 2;
    final ty = (viewport.height - canvasH * scale) / 2;

    _transform.value = buildViewMatrix(tx, ty, scale);
  }

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder로 뷰포트 크기를 얻어 줌/fit 계산에 사용
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewport = Size(constraints.maxWidth, constraints.maxHeight);
        return Stack(
          children: [
            // 격자 배경: 전체 영역을 꽉 채우도록 Positioned.fill 사용
            Positioned.fill(
              child: CustomPaint(painter: GridPainter(style: widget.style)),
            ),
            // 그래프: EditorState가 바뀔 때만 이 영역만 리빌드
            Consumer<EditorState>(
              builder: (context, state, _) {
                if (state.rootNode == null) {
                  return Center(
                    child: Text(
                      state.error != null
                          ? '⚠ ${state.error}'
                          : 'JSON을 입력하면 그래프가 표시됩니다',
                      style: TextStyle(
                        color: widget.style.emptyStateTextColor,
                        fontSize: widget.style.emptyStateTextSize,
                      ),
                    ),
                  );
                }
                return GraphView(
                  root: state.rootNode!,
                  state: state,
                  transformController: _transform,
                  edgeStyle: widget.edgeStyle,
                  nodeCardStyle: widget.nodeCardStyle,
                  addChildDialogStyle: widget.addChildDialogStyle,
                  onShowDetail: _openPanel,
                  selectedNode: _selectedNode,
                  onClosePanel: _closePanel,
                );
              },
            ),
            // 우측 슬라이드인 사이드 패널
            AnimatedPositioned(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              right: _selectedNode != null
                  ? 0
                  : -(viewport.width * 0.35),
              top: 0,
              bottom: 0,
              width: viewport.width * 0.35,
              child: _selectedNode != null
                  ? Consumer<EditorState>(
                      builder: (context, state, _) => NodeSidePanel(
                        node: _selectedNode!,
                        state: state,
                        onClose: _closePanel,
                        style: widget.nodeDetailStyle,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            // 하단 중앙 툴바 오버레이
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: GraphToolbar(
                  onZoomIn: () => _scaleBy(1.25, viewport),
                  onZoomOut: () => _scaleBy(0.8, viewport),
                  onFit: () => _fitToView(
                    viewport,
                    context.read<EditorState>().rootNode,
                  ),
                  onToggleEditorPanel: widget.onToggleEditorPanel,
                  extraActions: widget.extraActions,
                  style: widget.toolbarStyle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
