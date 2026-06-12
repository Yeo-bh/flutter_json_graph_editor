import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_editor_tab_bar_style.freezed.dart';

/// [JsonEditorTabView] 상단 탭 바의 시각적 옵션.
@freezed
abstract class JsonEditorTabBarStyle with _$JsonEditorTabBarStyle {
  const factory JsonEditorTabBarStyle({
    /// 탭 바 배경색.
    @Default(Color(0xFFF0F0F0)) Color backgroundColor,

    /// 활성 탭 배경색.
    @Default(Color(0xFFFFFFFF)) Color activeTabColor,

    /// 비활성 탭 배경색.
    @Default(Color(0xFFE0E0E0)) Color inactiveTabColor,

    /// 활성 탭 그림자 색.
    @Default(Color(0x14000000)) Color activeTabShadowColor,

    /// 활성 탭 텍스트 색.
    @Default(Color(0xFF1A1A1A)) Color activeTextColor,

    /// 비활성 탭 텍스트 색.
    @Default(Color(0xFF666666)) Color inactiveTextColor,

    /// 활성 탭 닫기(X) 아이콘 색.
    @Default(Color(0xFF666666)) Color activeCloseIconColor,

    /// 비활성 탭 닫기(X) 아이콘 색.
    @Default(Color(0xFF999999)) Color inactiveCloseIconColor,

    /// 새 탭(+) 아이콘 색.
    @Default(Color(0xFF666666)) Color addIconColor,
  }) = _JsonEditorTabBarStyle;
}
