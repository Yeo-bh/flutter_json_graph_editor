import 'package:flutter/material.dart';
import '../../models/style/graph_panel_style.dart';

// 격자 배경 그리기: 작은 격자(minorGridStep) + 큰 격자(majorGridStep) 두 단계
class GridPainter extends CustomPainter {
  final GraphPanelStyle style;

  const GridPainter({required this.style});

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
  bool shouldRepaint(GridPainter old) =>
      old.style.backgroundColor != style.backgroundColor;
}
