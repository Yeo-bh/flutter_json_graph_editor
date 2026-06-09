import 'package:flutter/material.dart';

/// 노드 카드 사이 연결선(엣지)의 시각적 옵션.
class EdgeStyle {
  /// 연결선 색상.
  final Color lineColor;

  /// 연결선 두께(px).
  final double lineWidth;

  const EdgeStyle({
    this.lineColor = const Color(0xFFD1D5DB),
    this.lineWidth = 1.5,
  });

  EdgeStyle copyWith({Color? lineColor, double? lineWidth}) {
    return EdgeStyle(
      lineColor: lineColor ?? this.lineColor,
      lineWidth: lineWidth ?? this.lineWidth,
    );
  }
}
