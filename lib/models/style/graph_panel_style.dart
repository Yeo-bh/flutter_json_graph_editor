import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph_panel_style.freezed.dart';

@freezed
abstract class GraphPanelStyle with _$GraphPanelStyle {
  const factory GraphPanelStyle({
    /// 그래프 캔버스 배경색.
    @Default(Color(0xFFFAFBFC)) Color backgroundColor,

    /// 작은 격자선 색 (minorGridStep 간격으로 반복).
    @Default(Color(0xFFEAEEF2)) Color minorGridColor,

    /// 큰 격자선 색 (majorGridStep 간격으로 반복).
    @Default(Color(0xFFD1D5DB)) Color majorGridColor,

    /// 작은 격자 간격(px).
    @Default(20.0) double minorGridStep,

    /// 큰 격자 간격(px).
    @Default(100.0) double majorGridStep,

    /// 작은 격자선 두께(px).
    @Default(0.6) double minorGridStrokeWidth,

    /// 큰 격자선 두께(px).
    @Default(1.0) double majorGridStrokeWidth,

    /// JSON 없을 때 표시되는 안내 텍스트 색.
    @Default(Color(0xFF8B949E)) Color emptyStateTextColor,

    /// 안내 텍스트 크기(pt).
    @Default(14.0) double emptyStateTextSize,

    /// 파싱 오류 텍스트 색.
    @Default(Color(0xFFCB2431)) Color errorTextColor,
  }) = _GraphPanelStyle;
}
