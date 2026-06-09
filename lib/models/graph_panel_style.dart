import 'package:flutter/material.dart';

/// 그래프 뷰 캔버스 영역의 시각적 옵션.
class GraphPanelStyle {
  /// 그래프 캔버스 배경색.
  final Color backgroundColor;

  /// 작은 격자선 색 (minorGridStep 간격으로 반복).
  final Color minorGridColor;

  /// 큰 격자선 색 (majorGridStep 간격으로 반복).
  final Color majorGridColor;

  /// 작은 격자 간격(px).
  final double minorGridStep;

  /// 큰 격자 간격(px).
  final double majorGridStep;

  /// 작은 격자선 두께(px).
  final double minorGridStrokeWidth;

  /// 큰 격자선 두께(px).
  final double majorGridStrokeWidth;

  /// JSON 없을 때 표시되는 안내 텍스트 색.
  final Color emptyStateTextColor;

  /// 안내 텍스트 크기(pt).
  final double emptyStateTextSize;

  /// 파싱 오류 텍스트 색.
  final Color errorTextColor;

  const GraphPanelStyle({
    this.backgroundColor = const Color(0xFFFAFBFC),
    this.minorGridColor = const Color(0xFFEAEEF2),
    this.majorGridColor = const Color(0xFFD1D5DB),
    this.minorGridStep = 20.0,
    this.majorGridStep = 100.0,
    this.minorGridStrokeWidth = 0.6,
    this.majorGridStrokeWidth = 1.0,
    this.emptyStateTextColor = const Color(0xFF8B949E),
    this.emptyStateTextSize = 14.0,
    this.errorTextColor = const Color(0xFFCB2431),
  });

  GraphPanelStyle copyWith({
    Color? backgroundColor,
    Color? minorGridColor,
    Color? majorGridColor,
    double? minorGridStep,
    double? majorGridStep,
    double? minorGridStrokeWidth,
    double? majorGridStrokeWidth,
    Color? emptyStateTextColor,
    double? emptyStateTextSize,
    Color? errorTextColor,
  }) {
    return GraphPanelStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      minorGridColor: minorGridColor ?? this.minorGridColor,
      majorGridColor: majorGridColor ?? this.majorGridColor,
      minorGridStep: minorGridStep ?? this.minorGridStep,
      majorGridStep: majorGridStep ?? this.majorGridStep,
      minorGridStrokeWidth: minorGridStrokeWidth ?? this.minorGridStrokeWidth,
      majorGridStrokeWidth: majorGridStrokeWidth ?? this.majorGridStrokeWidth,
      emptyStateTextColor: emptyStateTextColor ?? this.emptyStateTextColor,
      emptyStateTextSize: emptyStateTextSize ?? this.emptyStateTextSize,
      errorTextColor: errorTextColor ?? this.errorTextColor,
    );
  }
}
