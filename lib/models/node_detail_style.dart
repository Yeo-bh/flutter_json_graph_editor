import 'package:flutter/material.dart';

/// 노드 상세 사이드 패널([NodeSidePanel])의 모든 시각적 옵션.
/// [JsonEditorStyle.nodeDetail]에서 접근한다.
class NodeDetailStyle {
  // ── 패널 컨테이너 ─────────────────────────────────────

  /// 패널 너비(px).
  final double panelWidth;

  /// 패널 배경색.
  final Color backgroundColor;

  // ── 헤더 영역 ─────────────────────────────────────────

  /// 헤더 전체 패딩.
  final EdgeInsets headerPadding;

  /// 헤더 ~ 본문 사이 구분선 색.
  final Color dividerColor;

  // 타입 뱃지 ({ } / [ ])
  /// 타입 뱃지 배경색.
  final Color headerBadgeBackgroundColor;

  /// 타입 뱃지 텍스트 색.
  final Color headerBadgeTextColor;

  /// 타입 뱃지 폰트 크기(pt).
  final double headerBadgeFontSize;

  /// 타입 뱃지 모서리 둥글기(px).
  final double headerBadgeBorderRadius;

  /// 타입 뱃지 내부 패딩.
  final EdgeInsets headerBadgePadding;

  /// 헤더 제목 텍스트 색.
  final Color titleColor;

  /// 헤더 제목 폰트 크기(pt).
  final double titleFontSize;

  /// 헤더 제목 폰트 두께.
  final FontWeight titleFontWeight;

  /// 닫기(X) 아이콘 색.
  final Color closeIconColor;

  /// 닫기(X) 아이콘 크기(px).
  final double closeIconSize;

  // ── 본문 스크롤 영역 ───────────────────────────────────

  /// 본문 내부 패딩.
  final EdgeInsets bodyPadding;

  // ── Properties 섹션 헤더 ───────────────────────────────

  /// "Properties" 라벨 텍스트 색.
  final Color propertiesLabelColor;

  /// "Properties" 라벨 폰트 크기(pt).
  final double propertiesLabelFontSize;

  /// "Properties" 라벨 폰트 두께.
  final FontWeight propertiesLabelFontWeight;

  /// "Properties" 라벨 자간.
  final double propertiesLabelLetterSpacing;

  // ── Meta 행 (Type / Key / Children) ───────────────────

  /// 각 meta 행 아래 여백(px).
  final double metaRowBottomPadding;

  /// 라벨 열 고정 너비(px).
  final double metaLabelWidth;

  /// meta 행 라벨 텍스트 색.
  final Color metaLabelColor;

  /// meta 행 라벨 폰트 크기(pt).
  final double metaLabelFontSize;

  /// meta 행 값 텍스트 색.
  final Color metaValueColor;

  /// meta 행 값 폰트 크기(pt).
  final double metaValueFontSize;

  // ── Entry 타일 (key : value + 타입 뱃지) ──────────────

  /// entry 타일 아래 여백(px).
  final double entryTileBottomMargin;

  /// entry 타일 내부 좌우 패딩(px).
  final double entryTilePaddingHorizontal;

  /// entry 타일 내부 상하 패딩(px).
  final double entryTilePaddingVertical;

  /// entry 타일 배경색.
  final Color entryTileBackgroundColor;

  /// entry 타일 모서리 둥글기(px).
  final double entryTileBorderRadius;

  /// entry 키 텍스트 색.
  final Color entryKeyColor;

  /// entry 키 폰트 크기(pt).
  final double entryKeyFontSize;

  /// ':' 구분자 색.
  final Color entrySeparatorColor;

  /// ':' 구분자 좌우 패딩(px).
  final double entrySeparatorPaddingHorizontal;

  /// entry 값 폰트 크기(pt).
  final double entryValueFontSize;

  // ── 값 타입별 색상 ─────────────────────────────────────

  /// JSON string 값 색.
  final Color stringValueColor;

  /// JSON number 값 색.
  final Color numberValueColor;

  /// JSON boolean 값 색.
  final Color booleanValueColor;

  /// JSON null 값 색.
  final Color nullValueColor;

  // ── 타입 뱃지 (entry 타일 우측) ───────────────────────

  /// entry 타입 뱃지 배경색.
  final Color typeBadgeBackgroundColor;

  /// entry 타입 뱃지 텍스트 색.
  final Color typeBadgeTextColor;

  /// entry 타입 뱃지 폰트 크기(pt).
  final double typeBadgeFontSize;

  /// entry 타입 뱃지 모서리 둥글기(px).
  final double typeBadgeBorderRadius;

  /// entry 타입 뱃지 내부 패딩.
  final EdgeInsets typeBadgePadding;

  // ── 공통 폰트 ──────────────────────────────────────────

  /// 패널 전체에 적용되는 폰트 패밀리.
  final String fontFamily;

  const NodeDetailStyle({
    this.panelWidth = 280.0,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.headerPadding = const EdgeInsets.fromLTRB(16, 14, 12, 14),
    this.dividerColor = const Color(0xFFE1E4E8),
    this.headerBadgeBackgroundColor = const Color(0xFFF6F8FA),
    this.headerBadgeTextColor = const Color(0xFF0366D6),
    this.headerBadgeFontSize = 11.0,
    this.headerBadgeBorderRadius = 4.0,
    this.headerBadgePadding =
        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    this.titleColor = const Color(0xFF24292E),
    this.titleFontSize = 15.0,
    this.titleFontWeight = FontWeight.w600,
    this.closeIconColor = const Color(0xFF6A737D),
    this.closeIconSize = 18.0,
    this.bodyPadding = const EdgeInsets.all(16),
    this.propertiesLabelColor = const Color(0xFF6A737D),
    this.propertiesLabelFontSize = 11.0,
    this.propertiesLabelFontWeight = FontWeight.w600,
    this.propertiesLabelLetterSpacing = 0.5,
    this.metaRowBottomPadding = 6.0,
    this.metaLabelWidth = 80.0,
    this.metaLabelColor = const Color(0xFF6A737D),
    this.metaLabelFontSize = 12.0,
    this.metaValueColor = const Color(0xFF24292E),
    this.metaValueFontSize = 12.0,
    this.entryTileBottomMargin = 4.0,
    this.entryTilePaddingHorizontal = 10.0,
    this.entryTilePaddingVertical = 7.0,
    this.entryTileBackgroundColor = const Color(0xFFF6F8FA),
    this.entryTileBorderRadius = 6.0,
    this.entryKeyColor = const Color(0xFF6A737D),
    this.entryKeyFontSize = 12.0,
    this.entrySeparatorColor = const Color(0xFFBEC4CB),
    this.entrySeparatorPaddingHorizontal = 6.0,
    this.entryValueFontSize = 12.0,
    this.stringValueColor = const Color(0xFF22863A),
    this.numberValueColor = const Color(0xFF005CC5),
    this.booleanValueColor = const Color(0xFF6F42C1),
    this.nullValueColor = const Color(0xFF6A737D),
    this.typeBadgeBackgroundColor = const Color(0xFFF6F8FA),
    this.typeBadgeTextColor = const Color(0xFF6A737D),
    this.typeBadgeFontSize = 9.0,
    this.typeBadgeBorderRadius = 3.0,
    this.typeBadgePadding =
        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    this.fontFamily = 'monospace',
  });

  NodeDetailStyle copyWith({
    double? panelWidth,
    Color? backgroundColor,
    EdgeInsets? headerPadding,
    Color? dividerColor,
    Color? headerBadgeBackgroundColor,
    Color? headerBadgeTextColor,
    double? headerBadgeFontSize,
    double? headerBadgeBorderRadius,
    EdgeInsets? headerBadgePadding,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    Color? closeIconColor,
    double? closeIconSize,
    EdgeInsets? bodyPadding,
    Color? propertiesLabelColor,
    double? propertiesLabelFontSize,
    FontWeight? propertiesLabelFontWeight,
    double? propertiesLabelLetterSpacing,
    double? metaRowBottomPadding,
    double? metaLabelWidth,
    Color? metaLabelColor,
    double? metaLabelFontSize,
    Color? metaValueColor,
    double? metaValueFontSize,
    double? entryTileBottomMargin,
    double? entryTilePaddingHorizontal,
    double? entryTilePaddingVertical,
    Color? entryTileBackgroundColor,
    double? entryTileBorderRadius,
    Color? entryKeyColor,
    double? entryKeyFontSize,
    Color? entrySeparatorColor,
    double? entrySeparatorPaddingHorizontal,
    double? entryValueFontSize,
    Color? stringValueColor,
    Color? numberValueColor,
    Color? booleanValueColor,
    Color? nullValueColor,
    Color? typeBadgeBackgroundColor,
    Color? typeBadgeTextColor,
    double? typeBadgeFontSize,
    double? typeBadgeBorderRadius,
    EdgeInsets? typeBadgePadding,
    String? fontFamily,
  }) {
    return NodeDetailStyle(
      panelWidth: panelWidth ?? this.panelWidth,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headerPadding: headerPadding ?? this.headerPadding,
      dividerColor: dividerColor ?? this.dividerColor,
      headerBadgeBackgroundColor:
          headerBadgeBackgroundColor ?? this.headerBadgeBackgroundColor,
      headerBadgeTextColor: headerBadgeTextColor ?? this.headerBadgeTextColor,
      headerBadgeFontSize: headerBadgeFontSize ?? this.headerBadgeFontSize,
      headerBadgeBorderRadius:
          headerBadgeBorderRadius ?? this.headerBadgeBorderRadius,
      headerBadgePadding: headerBadgePadding ?? this.headerBadgePadding,
      titleColor: titleColor ?? this.titleColor,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      closeIconSize: closeIconSize ?? this.closeIconSize,
      bodyPadding: bodyPadding ?? this.bodyPadding,
      propertiesLabelColor: propertiesLabelColor ?? this.propertiesLabelColor,
      propertiesLabelFontSize:
          propertiesLabelFontSize ?? this.propertiesLabelFontSize,
      propertiesLabelFontWeight:
          propertiesLabelFontWeight ?? this.propertiesLabelFontWeight,
      propertiesLabelLetterSpacing:
          propertiesLabelLetterSpacing ?? this.propertiesLabelLetterSpacing,
      metaRowBottomPadding: metaRowBottomPadding ?? this.metaRowBottomPadding,
      metaLabelWidth: metaLabelWidth ?? this.metaLabelWidth,
      metaLabelColor: metaLabelColor ?? this.metaLabelColor,
      metaLabelFontSize: metaLabelFontSize ?? this.metaLabelFontSize,
      metaValueColor: metaValueColor ?? this.metaValueColor,
      metaValueFontSize: metaValueFontSize ?? this.metaValueFontSize,
      entryTileBottomMargin:
          entryTileBottomMargin ?? this.entryTileBottomMargin,
      entryTilePaddingHorizontal:
          entryTilePaddingHorizontal ?? this.entryTilePaddingHorizontal,
      entryTilePaddingVertical:
          entryTilePaddingVertical ?? this.entryTilePaddingVertical,
      entryTileBackgroundColor:
          entryTileBackgroundColor ?? this.entryTileBackgroundColor,
      entryTileBorderRadius:
          entryTileBorderRadius ?? this.entryTileBorderRadius,
      entryKeyColor: entryKeyColor ?? this.entryKeyColor,
      entryKeyFontSize: entryKeyFontSize ?? this.entryKeyFontSize,
      entrySeparatorColor: entrySeparatorColor ?? this.entrySeparatorColor,
      entrySeparatorPaddingHorizontal: entrySeparatorPaddingHorizontal ??
          this.entrySeparatorPaddingHorizontal,
      entryValueFontSize: entryValueFontSize ?? this.entryValueFontSize,
      stringValueColor: stringValueColor ?? this.stringValueColor,
      numberValueColor: numberValueColor ?? this.numberValueColor,
      booleanValueColor: booleanValueColor ?? this.booleanValueColor,
      nullValueColor: nullValueColor ?? this.nullValueColor,
      typeBadgeBackgroundColor:
          typeBadgeBackgroundColor ?? this.typeBadgeBackgroundColor,
      typeBadgeTextColor: typeBadgeTextColor ?? this.typeBadgeTextColor,
      typeBadgeFontSize: typeBadgeFontSize ?? this.typeBadgeFontSize,
      typeBadgeBorderRadius:
          typeBadgeBorderRadius ?? this.typeBadgeBorderRadius,
      typeBadgePadding: typeBadgePadding ?? this.typeBadgePadding,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
