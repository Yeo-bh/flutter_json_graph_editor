import 'package:flutter/material.dart';

/// 에디터 패널과 그래프 패널을 나누는 분할 뷰의 시각적 옵션.
class SplitViewStyle {
  /// 분할선 색.
  final Color dividerColor;

  /// 분할선 너비(px). 드래그 히트 영역 역할도 함.
  final double dividerWidth;

  /// 좌측 패널 최소 비율 (전체 너비 대비, 0.0~1.0).
  final double minRatio;

  /// 좌측 패널 최대 비율 (전체 너비 대비, 0.0~1.0).
  final double maxRatio;

  const SplitViewStyle({
    this.dividerColor = const Color(0xFFE1E4E8),
    this.dividerWidth = 4.0,
    this.minRatio = 0.2,
    this.maxRatio = 0.7,
  });

  SplitViewStyle copyWith({
    Color? dividerColor,
    double? dividerWidth,
    double? minRatio,
    double? maxRatio,
  }) {
    return SplitViewStyle(
      dividerColor: dividerColor ?? this.dividerColor,
      dividerWidth: dividerWidth ?? this.dividerWidth,
      minRatio: minRatio ?? this.minRatio,
      maxRatio: maxRatio ?? this.maxRatio,
    );
  }
}
