import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/edge_style.dart';
import '../../utils/tree_layout.dart';

// 노드 카드 사이의 연결선을 그리는 CustomPainter
// Stack 위에 올려서 노드 카드들 뒤에 그려짐
class EdgePainter extends CustomPainter {
  final JsonNode root;
  final EdgeStyle style;

  EdgePainter(this.root, {this.style = const EdgeStyle()});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = style.lineColor
      ..strokeWidth = style.lineWidth
      ..style = PaintingStyle.stroke; // 선만 그림 (채우기 없음)

    _drawEdges(canvas, root, paint);
  }

  // 재귀적으로 부모→자식 연결선을 모두 그림
  void _drawEdges(Canvas canvas, JsonNode node, Paint paint) {
    if (node.isCollapsed) return; // 접힌 노드는 자식 연결선 생략

    for (final child in node.children) {
      // 부모 카드의 오른쪽 중앙에서 출발
      final startX = node.position.dx + kNodeWidth;
      final startY = node.position.dy + node.size.height / 2;
      // 자식 카드의 왼쪽 중앙으로 도착
      final endX = child.position.dx;
      final endY = child.position.dy + child.size.height / 2;

      // 베지어 곡선 제어점: 수평 간격의 55% 지점에서 꺾임 → 부드러운 S자 곡선
      final cp1x = startX + kHGap * 0.55;
      final cp2x = endX - kHGap * 0.55;

      canvas.drawPath(
        Path()
          ..moveTo(startX, startY)
          ..cubicTo(cp1x, startY, cp2x, endY, endX, endY),
        paint,
      );

      _drawEdges(canvas, child, paint); // 자식의 자식도 재귀 처리
    }
  }

  @override
  bool shouldRepaint(EdgePainter oldDelegate) => true; // 항상 재그리기 (상태 비교 생략)
}
