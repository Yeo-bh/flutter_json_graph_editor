import 'package:flutter/material.dart';
import '../../models/json_node.dart';

// 트리 전체의 bounding rect 계산 (SizedBox 크기 및 fit 계산에 공유)
Rect computeBounds(JsonNode node) {
  var r = node.position.dx + node.size.width;
  var b = node.position.dy + node.size.height;
  if (!node.isCollapsed) {
    for (final c in node.children) {
      final cb = computeBounds(c);
      if (cb.right > r) r = cb.right;
      if (cb.bottom > b) b = cb.bottom;
    }
  }
  return Rect.fromLTRB(0, 0, r, b);
}

// translate(tx, ty) + uniform scale 행렬 생성 (deprecated Matrix4 cascade API 우회)
Matrix4 buildViewMatrix(double tx, double ty, double scale) {
  final m = Matrix4.identity();
  m.setEntry(0, 0, scale);
  m.setEntry(1, 1, scale);
  m.setEntry(0, 3, tx);
  m.setEntry(1, 3, ty);
  return m;
}
