import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/edge_style.dart';
import '../models/graph_panel_style.dart';
import '../models/graph_toolbar_style.dart';
import '../models/json_node.dart';
import '../models/node_card_style.dart';
import '../models/node_info_dialog_style.dart';
import '../state/editor_state.dart';
import '../utils/graph_transform.dart';
import 'edge_painter.dart';
import 'graph_toolbar.dart';
import 'node_card.dart';

// 화면 우측 패널: 격자 배경 + JSON 시각화 그래프 + 줌 툴바
class GraphPanel extends StatefulWidget {
  final GraphPanelStyle style;
  final GraphToolbarStyle toolbarStyle;
  final EdgeStyle edgeStyle;
  final NodeCardStyle nodeCardStyle;
  final NodeInfoDialogStyle nodeInfoDialogStyle;

  /// 툴바에 추가할 사용자 정의 버튼 목록
  /// 예: save, export, share 등 원하는 기능을 GraphToolbarAction으로 정의해서 전달
  final List<GraphToolbarAction> extraActions;

  const GraphPanel({
    super.key,
    this.style = const GraphPanelStyle(),
    this.toolbarStyle = const GraphToolbarStyle(),
    this.edgeStyle = const EdgeStyle(),
    this.nodeCardStyle = const NodeCardStyle(),
    this.nodeInfoDialogStyle = const NodeInfoDialogStyle(),
    this.extraActions = const [],
  });

  @override
  State<GraphPanel> createState() => _GraphPanelState();
}

class _GraphPanelState extends State<GraphPanel> {
  // InteractiveViewer 줌/패닝 상태를 프로그래밍으로 제어하는 컨트롤러
  final _transform = TransformationController();

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
              child: CustomPaint(painter: _GridPainter(style: widget.style)),
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
                return _GraphView(
                  root: state.rootNode!,
                  state: state,
                  transformController: _transform,
                  edgeStyle: widget.edgeStyle,
                  nodeCardStyle: widget.nodeCardStyle,
                  nodeInfoDialogStyle: widget.nodeInfoDialogStyle,
                );
              },
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

// 격자 배경 그리기: 작은 격자(minorGridStep) + 큰 격자(majorGridStep) 두 단계
class _GridPainter extends CustomPainter {
  final GraphPanelStyle style;

  const _GridPainter({required this.style});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = style.backgroundColor);
    _drawGrid(
      canvas,
      size,
      step: style.minorGridStep,
      color: style.minorGridColor,
      strokeWidth: style.minorGridStrokeWidth,
    );
    _drawGrid(
      canvas,
      size,
      step: style.majorGridStep,
      color: style.majorGridColor,
      strokeWidth: style.majorGridStrokeWidth,
    );
  }

  void _drawGrid(
    Canvas canvas,
    Size size, {
    required double step,
    required Color color,
    required double strokeWidth,
  }) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;
    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) =>
      old.style.backgroundColor != style.backgroundColor;
}

// 실제 그래프 뷰: 줌/패닝 + 엣지(선) + 노드 카드들
class _GraphView extends StatelessWidget {
  final JsonNode root;
  final EditorState state;
  final TransformationController transformController;
  final EdgeStyle edgeStyle;
  final NodeCardStyle nodeCardStyle;
  final NodeInfoDialogStyle nodeInfoDialogStyle;

  const _GraphView({
    required this.root,
    required this.state,
    required this.transformController,
    required this.edgeStyle,
    required this.nodeCardStyle,
    required this.nodeInfoDialogStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bounds = computeBounds(root);
    final w = bounds.right + 80;
    final h = bounds.bottom + 80;

    return InteractiveViewer(
      transformationController: transformController,
      boundaryMargin: const EdgeInsets.all(double.infinity),
      constrained: false,
      minScale: 0.1,
      maxScale: 4.0,
      child: SizedBox(
        width: w,
        height: h,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: EdgePainter(root, style: edgeStyle)),
            ),
            ..._nodeWidgets(root),
          ],
        ),
      ),
    );
  }

  List<Widget> _nodeWidgets(JsonNode node) {
    final result = <Widget>[];
    _collect(node, result);
    return result;
  }

  // DFS로 트리 순회하며 모든 노드 카드를 Positioned 위젯으로 수집
  void _collect(JsonNode node, List<Widget> result) {
    result.add(
      Positioned(
        left: node.position.dx,
        top: node.position.dy,
        child: NodeCard(
          node: node,
          onToggleCollapse: () => state.toggleCollapse(node.id),
          style: nodeCardStyle,
          infoDialogStyle: nodeInfoDialogStyle,
        ),
      ),
    );
    if (!node.isCollapsed) {
      for (final child in node.children) {
        _collect(child, result);
      }
    }
  }
}
