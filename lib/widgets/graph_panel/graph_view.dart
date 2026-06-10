import 'package:flutter/material.dart';
import '../../models/add_child_dialog_style.dart';
import '../../models/edge_style.dart';
import '../../models/json_node.dart';
import '../../models/node_card_style.dart';
import '../../state/editor_state.dart';
import '../../utils/graph_transform.dart';
import '../edge_painter/edge_painter.dart';
import '../node_card/node_card.dart';
import 'add_node_button.dart';

// 실제 그래프 뷰: 줌/패닝 + 엣지(선) + 노드 카드들
class GraphView extends StatelessWidget {
  final JsonNode root;
  final EditorState state;
  final TransformationController transformController;
  final EdgeStyle edgeStyle;
  final NodeCardStyle nodeCardStyle;
  final AddChildDialogStyle addChildDialogStyle;
  final ValueChanged<JsonNode>? onShowDetail;
  final JsonNode? selectedNode;
  final VoidCallback? onClosePanel;

  const GraphView({
    super.key,
    required this.root,
    required this.state,
    required this.transformController,
    required this.edgeStyle,
    required this.nodeCardStyle,
    required this.addChildDialogStyle,
    this.onShowDetail,
    this.selectedNode,
    this.onClosePanel,
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
            // 빈 캔버스 탭 → 패널 닫기. Stack 맨 아래에 위치해야 노드 카드가
            // 제스처 아레나에서 이김 (노드 카드가 더 위 → 아레나에 먼저 등록됨).
            if (onClosePanel != null)
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onClosePanel,
                ),
              ),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            NodeCard(
              node: node,
              isSelected: selectedNode?.id == node.id,
              onToggleCollapse: () => state.toggleCollapse(node.id),
              onToggleEntriesCollapse: () =>
                  state.toggleEntriesCollapse(node.id),
              onShowDetail: () => onShowDetail?.call(node),
              style: nodeCardStyle,
            ),
            const SizedBox(width: 8),
            AddNodeButton(
              node: node,
              state: state,
              cardStyle: nodeCardStyle,
              dialogStyle: addChildDialogStyle,
            ),
          ],
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
