import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph_toolbar_style.freezed.dart';

@freezed
abstract class GraphToolbarStyle with _$GraphToolbarStyle {
  const factory GraphToolbarStyle({
    /// 툴바 배경색.
    @Default(Colors.white) Color backgroundColor,

    /// 툴바 그림자 색.
    @Default(Color(0x1F000000)) Color shadowColor,

    /// 그림자 번짐(px).
    @Default(8.0) double shadowBlurRadius,

    /// 그림자 오프셋.
    @Default(Offset(0, 2)) Offset shadowOffset,

    /// 버튼 그룹 사이 구분선 색.
    @Default(Color(0xFFE1E4E8)) Color dividerColor,

    /// 툴바 아이콘 색.
    @Default(Color(0xFF57606A)) Color iconColor,

    /// 아이콘 크기(px).
    @Default(18.0) double iconSize,

    /// 버튼 내부 패딩(px).
    @Default(8.0) double buttonPadding,

    /// 툴바 컨테이너의 모서리 둥글기(px).
    @Default(24.0) double borderRadius,

    /// 툴바 컨테이너 내부 패딩.
    @Default(EdgeInsets.symmetric(horizontal: 6, vertical: 4)) EdgeInsets containerPadding,

    /// 구분선 높이(px).
    @Default(18.0) double dividerHeight,

    /// 구분선 좌우 마진(px).
    @Default(2.0) double dividerMarginHorizontal,
  }) = _GraphToolbarStyle;
}
