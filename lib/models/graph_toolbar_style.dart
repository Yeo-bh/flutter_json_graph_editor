import 'package:flutter/material.dart';

/// 그래프 뷰 상단 플로팅 툴바의 시각적 옵션.
class GraphToolbarStyle {
  /// 툴바 배경색.
  final Color backgroundColor;

  /// 툴바 그림자 색.
  final Color shadowColor;

  /// 그림자 번짐(px).
  final double shadowBlurRadius;

  /// 그림자 오프셋.
  final Offset shadowOffset;

  /// 버튼 그룹 사이 구분선 색.
  final Color dividerColor;

  /// 툴바 아이콘 색.
  final Color iconColor;

  /// 아이콘 크기(px).
  final double iconSize;

  /// 버튼 내부 패딩(px). 버튼 사방에 동일하게 적용됨.
  final double buttonPadding;

  /// 툴바 컨테이너의 모서리 둥글기(px).
  final double borderRadius;

  /// 툴바 컨테이너 내부 패딩.
  final EdgeInsets containerPadding;

  /// 구분선 높이(px).
  final double dividerHeight;

  /// 구분선 좌우 마진(px).
  final double dividerMarginHorizontal;

  const GraphToolbarStyle({
    this.backgroundColor = Colors.white,
    this.shadowColor = const Color(0x1F000000),
    this.shadowBlurRadius = 8.0,
    this.shadowOffset = const Offset(0, 2),
    this.dividerColor = const Color(0xFFE1E4E8),
    this.iconColor = const Color(0xFF57606A),
    this.iconSize = 18.0,
    this.buttonPadding = 8.0,
    this.borderRadius = 24.0,
    this.containerPadding = const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    this.dividerHeight = 18.0,
    this.dividerMarginHorizontal = 2.0,
  });

  GraphToolbarStyle copyWith({
    Color? backgroundColor,
    Color? shadowColor,
    double? shadowBlurRadius,
    Offset? shadowOffset,
    Color? dividerColor,
    Color? iconColor,
    double? iconSize,
    double? buttonPadding,
    double? borderRadius,
    EdgeInsets? containerPadding,
    double? dividerHeight,
    double? dividerMarginHorizontal,
  }) {
    return GraphToolbarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      dividerColor: dividerColor ?? this.dividerColor,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      borderRadius: borderRadius ?? this.borderRadius,
      containerPadding: containerPadding ?? this.containerPadding,
      dividerHeight: dividerHeight ?? this.dividerHeight,
      dividerMarginHorizontal: dividerMarginHorizontal ?? this.dividerMarginHorizontal,
    );
  }
}
