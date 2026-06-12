import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../json_node.dart';

part 'node_detail_style.freezed.dart';

@freezed
abstract class NodeDetailStyle with _$NodeDetailStyle {
  const factory NodeDetailStyle({
    /// 패널 너비(px).
    @Default(300.0) double panelWidth,

    /// 패널 배경색.
    @Default(Color(0xFFFFFFFF)) Color backgroundColor,

    /// 헤더 전체 패딩.
    @Default(EdgeInsets.fromLTRB(16, 14, 12, 14)) EdgeInsets headerPadding,

    /// 헤더 ~ 본문 사이 구분선 색.
    @Default(Color(0xFFE1E4E8)) Color dividerColor,

    /// 타입 뱃지 배경색.
    @Default(Color(0xFFF6F8FA)) Color headerBadgeBackgroundColor,

    /// 타입 뱃지 텍스트 색.
    @Default(Color(0xFF0366D6)) Color headerBadgeTextColor,

    /// 타입 뱃지 폰트 크기(pt).
    @Default(11.0) double headerBadgeFontSize,

    /// 타입 뱃지 모서리 둥글기(px).
    @Default(4.0) double headerBadgeBorderRadius,

    /// 타입 뱃지 내부 패딩.
    @Default(EdgeInsets.symmetric(horizontal: 6, vertical: 3))
    EdgeInsets headerBadgePadding,

    /// 헤더 제목 텍스트 색.
    @Default(Color(0xFF24292E)) Color titleColor,

    /// 헤더 제목 폰트 크기(pt).
    @Default(15.0) double titleFontSize,

    /// 헤더 제목 폰트 두께.
    @Default(FontWeight.w600) FontWeight titleFontWeight,

    /// 닫기(X) 아이콘 색.
    @Default(Colors.red) Color closeIconColor,

    /// 닫기(X) 아이콘 크기(px).
    @Default(18.0) double closeIconSize,

    /// 본문 내부 패딩.
    @Default(EdgeInsets.all(16)) EdgeInsets bodyPadding,

    /// "Properties" 라벨 텍스트 색.
    @Default(Color(0xFF6A737D)) Color propertiesLabelColor,

    /// "Properties" 라벨 폰트 크기(pt).
    @Default(11.0) double propertiesLabelFontSize,

    /// "Properties" 라벨 폰트 두께.
    @Default(FontWeight.w600) FontWeight propertiesLabelFontWeight,

    /// "Properties" 라벨 자간.
    @Default(0.5) double propertiesLabelLetterSpacing,

    /// 각 meta 행 아래 여백(px).
    @Default(6.0) double metaRowBottomPadding,

    /// 라벨 열 고정 너비(px).
    @Default(80.0) double metaLabelWidth,

    /// meta 행 라벨 텍스트 색.
    @Default(Color(0xFF6A737D)) Color metaLabelColor,

    /// meta 행 라벨 폰트 크기(pt).
    @Default(12.0) double metaLabelFontSize,

    /// meta 행 값 텍스트 색.
    @Default(Color(0xFF24292E)) Color metaValueColor,

    /// meta 행 값 폰트 크기(pt).
    @Default(12.0) double metaValueFontSize,

    /// entry 타일 아래 여백(px).
    @Default(4.0) double entryTileBottomMargin,

    /// entry 타일 내부 좌우 패딩(px).
    @Default(10.0) double entryTilePaddingHorizontal,

    /// entry 타일 내부 상하 패딩(px).
    @Default(7.0) double entryTilePaddingVertical,

    /// entry 타일 배경색.
    @Default(Color(0xFFF6F8FA)) Color entryTileBackgroundColor,

    /// entry 타일 모서리 둥글기(px).
    @Default(6.0) double entryTileBorderRadius,

    /// entry 키 텍스트 색.
    @Default(Color(0xFF6A737D)) Color entryKeyColor,

    /// entry 키 폰트 크기(pt).
    @Default(14.0) double entryKeyFontSize,

    /// ':' 구분자 색.
    @Default(Color(0xFFBEC4CB)) Color entrySeparatorColor,

    /// ':' 구분자 좌우 패딩(px).
    @Default(6.0) double entrySeparatorPaddingHorizontal,

    /// entry 값 폰트 크기(pt).
    @Default(12.0) double entryValueFontSize,

    /// JSON string 값 색.
    @Default(Color(0xFF22863A)) Color stringValueColor,

    /// JSON number 값 색.
    @Default(Color(0xFF005CC5)) Color numberValueColor,

    /// JSON boolean 값 색.
    @Default(Color(0xFF6F42C1)) Color booleanValueColor,

    /// JSON null 값 색.
    @Default(Color(0xFF6A737D)) Color nullValueColor,

    /// entry 타입 뱃지 배경색.
    @Default(Color(0xFFF6F8FA)) Color typeBadgeBackgroundColor,

    /// entry 타입 뱃지 텍스트 색.
    @Default(Color(0xFF6A737D)) Color typeBadgeTextColor,

    /// entry 타입 뱃지 폰트 크기(pt).
    @Default(9.0) double typeBadgeFontSize,

    /// entry 타입 뱃지 모서리 둥글기(px).
    @Default(3.0) double typeBadgeBorderRadius,

    /// entry 타입 뱃지 내부 패딩.
    @Default(EdgeInsets.symmetric(horizontal: 5, vertical: 2))
    EdgeInsets typeBadgePadding,

    /// 패널 전체에 적용되는 폰트 패밀리.
    @Default('monospace') String fontFamily,

    /// 패널 왼쪽 외곽 그림자 색.
    @Default(Color(0x14000000)) Color panelShadowColor,

    /// 노드 삭제 아이콘 색.
    @Default(Color(0xFFF44336)) Color deleteIconColor,
  }) = _NodeDetailStyle;
}

extension NodeDetailStyleColor on NodeDetailStyle {
  Color entryValueColor(EntryType type) => switch (type) {
    EntryType.string => stringValueColor,
    EntryType.int64 => numberValueColor,
    EntryType.double_ => numberValueColor,
    EntryType.boolean => booleanValueColor,
    EntryType.timestamp => stringValueColor,
    EntryType.nullValue => nullValueColor,
  };
}
