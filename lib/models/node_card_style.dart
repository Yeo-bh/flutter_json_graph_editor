import 'package:flutter/material.dart';

/// NodeCard의 모든 시각적/크기 옵션을 담는 불변 스타일 모델.
/// const 생성자라 위젯 트리에서 성능 손실 없이 전달 가능.
/// 변경 시 [copyWith]로 특정 값만 교체한 새 인스턴스를 만든다.
class NodeCardStyle {
  // ── 카드 크기 ──────────────────────────────────────────

  /// 카드 고정 너비(px).
  /// tree_layout의 수평 간격 계산에도 사용되므로 바꾸면 layoutTree 재호출 필요.
  final double width;

  /// 카드 헤더 영역 높이(px).
  /// nodeHeight 계산에 포함되므로 바꾸면 layoutTree 재호출 필요.
  final double headerHeight;

  /// key-value 행 하나의 높이(px).
  /// nodeHeight = headerHeight + entries.length × entryHeight + borderWidth×2.
  final double entryHeight;

  // ── 카드 컨테이너 ───────────────────────────────────────

  /// 카드 모서리 둥글기 반지름(px). 0이면 직각.
  final double borderRadius;

  /// 카드 내부 배경색.
  final Color backgroundColor;

  /// 카드 테두리 색.
  final Color borderColor;

  /// 카드 테두리 두께(px).
  /// nodeHeight 보정값(+borderWidth×2)에도 영향을 준다.
  final double borderWidth;

  /// 카드 아래 그림자 색상. 투명도(alpha)로 강도 조절.
  final Color shadowColor;

  /// 그림자 번짐 반경(px). 클수록 퍼지는 그림자.
  final double shadowBlurRadius;

  /// 그림자 위치 오프셋. Offset(가로, 세로), 기본은 아래쪽 2px.
  final Offset shadowOffset;

  // ── 헤더 ───────────────────────────────────────────────

  /// 헤더 배경색 (카드 배경과 구분되는 약간 밝은 색 권장).
  final Color headerBackgroundColor;

  /// 헤더 내 좌우 내부 패딩(px).
  final double headerPaddingHorizontal;

  // ── 타입 뱃지 ({ } / [ ]) ──────────────────────────────

  /// 타입 뱃지 배경색.
  final Color typeBadgeBackgroundColor;

  /// 타입 뱃지 텍스트 색 ({ } 또는 [ ] 글자색).
  final Color typeBadgeTextColor;

  /// 타입 뱃지 폰트 크기(pt).
  final double typeBadgeFontSize;

  /// 타입 뱃지 모서리 둥글기 반지름(px).
  final double typeBadgeBorderRadius;

  /// 타입 뱃지 오른쪽 끝 ~ 라벨 왼쪽 시작 사이 간격(px).
  final double badgeLabelGap;

  // ── 라벨 (키 이름) ─────────────────────────────────────

  /// 헤더에 표시되는 키 이름 텍스트 색.
  final Color labelColor;

  /// 헤더 키 이름 폰트 크기(pt).
  final double labelFontSize;

  /// 헤더 키 이름 폰트 두께.
  final FontWeight labelFontWeight;

  // ── 접기/펼치기 버튼 ────────────────────────────────────

  /// 접기/펼치기 아이콘 색.
  final Color collapseIconColor;

  /// 접기/펼치기 아이콘 크기(px).
  final double collapseIconSize;

  /// 접기/펼치기 버튼 배경색.
  final Color collapseIconBackgroundColor;

  /// 접기/펼치기 버튼 모서리 둥글기(px).
  final double collapseIconBorderRadius;

  // ── Entry 행 ───────────────────────────────────────────

  /// entry 행 좌우 내부 패딩(px).
  final double entryPaddingHorizontal;

  /// 각 entry 행 위에 그려지는 구분선 색.
  final Color entryDividerColor;

  /// entry 행의 key 텍스트 색.
  final Color entryKeyColor;

  /// entry 행의 key 폰트 크기(pt).
  final double entryKeyFontSize;

  /// key와 value 사이 ':' 구분자 색.
  final Color entrySeparatorColor;

  /// ':' 구분자 좌우 패딩(px).
  final double entrySeparatorPadding;

  /// entry 행의 value 폰트 크기(pt).
  final double entryValueFontSize;

  // ── 값 타입별 색상 ─────────────────────────────────────

  /// JSON string 값 색 (따옴표 포함 표시).
  final Color stringValueColor;

  /// JSON number 값 색 (int / double 모두).
  final Color numberValueColor;

  /// JSON boolean 값 색 (true / false).
  final Color booleanValueColor;

  /// JSON null 값 색.
  final Color nullValueColor;

  // ── 공통 폰트 ──────────────────────────────────────────

  /// 카드 전체에 적용되는 폰트 패밀리.
  /// 코드 가독성을 위해 monospace 계열 권장.
  final String fontFamily;

  // ── 선택 상태 ──────────────────────────────────────────

  /// 사이드 패널에서 선택된 노드 카드의 테두리 색.
  final Color selectedBorderColor;

  // ── + 버튼 ──────────────────────────────────────────────

  /// + 버튼 아이콘 및 테두리 색.
  final Color addButtonColor;

  /// + 버튼 배경색.
  final Color addButtonBackgroundColor;

  /// + 버튼 크기(px, 지름).
  final double addButtonSize;

  /// + 버튼 아이콘 크기(px).
  final double addButtonIconSize;

  /// + 버튼 테두리 두께(px).
  final double addButtonBorderWidth;

  const NodeCardStyle({
    this.width = 210.0,
    this.headerHeight = 40.0,
    this.entryHeight = 28.0,
    this.borderRadius = 8.0,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0xFFE1E4E8),
    this.borderWidth = 1.0,
    this.shadowColor = const Color(0x0D000000),
    this.shadowBlurRadius = 8.0,
    this.shadowOffset = const Offset(0, 2),
    this.headerBackgroundColor = const Color(0xFFF6F8FA),
    this.headerPaddingHorizontal = 10.0,
    this.typeBadgeBackgroundColor = const Color(0xFFF1F8FF),
    this.typeBadgeTextColor = const Color(0xFF0366D6),
    this.typeBadgeFontSize = 10.0,
    this.typeBadgeBorderRadius = 4.0,
    this.badgeLabelGap = 8.0,
    this.labelColor = const Color(0xFF24292E),
    this.labelFontSize = 12.0,
    this.labelFontWeight = FontWeight.w600,
    this.collapseIconColor = const Color(0xFF6A737D),
    this.collapseIconSize = 14.0,
    this.collapseIconBackgroundColor = const Color(0xFFF1F8FF),
    this.collapseIconBorderRadius = 4.0,
    this.entryPaddingHorizontal = 12.0,
    this.entryDividerColor = const Color(0xFFF0F2F4),
    this.entryKeyColor = const Color(0xFF6A737D),
    this.entryKeyFontSize = 11.0,
    this.entrySeparatorColor = const Color(0xFFBEC4CB),
    this.entrySeparatorPadding = 4.0,
    this.entryValueFontSize = 11.0,
    this.stringValueColor = const Color(0xFF22863A),
    this.numberValueColor = const Color(0xFF005CC5),
    this.booleanValueColor = const Color(0xFF6F42C1),
    this.nullValueColor = const Color(0xFF6A737D),
    this.fontFamily = 'monospace',
    this.selectedBorderColor = const Color(0xFF0366D6),
    this.addButtonColor = const Color(0xFF0366D6),
    this.addButtonBackgroundColor = const Color(0xFFF1F8FF),
    this.addButtonSize = 26.0,
    this.addButtonIconSize = 14.0,
    this.addButtonBorderWidth = 1.5,
  });

  /// 기본 라이트 테마 스타일
  static const NodeCardStyle defaults = NodeCardStyle();

  /// 특정 값만 바꾼 새 스타일 반환 (나머지는 현재 값 유지)
  NodeCardStyle copyWith({
    double? width,
    double? headerHeight,
    double? entryHeight,
    double? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    Color? shadowColor,
    double? shadowBlurRadius,
    Offset? shadowOffset,
    Color? headerBackgroundColor,
    double? headerPaddingHorizontal,
    Color? typeBadgeBackgroundColor,
    Color? typeBadgeTextColor,
    double? typeBadgeFontSize,
    double? typeBadgeBorderRadius,
    double? badgeLabelGap,
    Color? labelColor,
    double? labelFontSize,
    FontWeight? labelFontWeight,
    Color? collapseIconColor,
    double? collapseIconSize,
    Color? collapseIconBackgroundColor,
    double? collapseIconBorderRadius,
    double? entryPaddingHorizontal,
    Color? entryDividerColor,
    Color? entryKeyColor,
    double? entryKeyFontSize,
    Color? entrySeparatorColor,
    double? entrySeparatorPadding,
    double? entryValueFontSize,
    Color? stringValueColor,
    Color? numberValueColor,
    Color? booleanValueColor,
    Color? nullValueColor,
    String? fontFamily,
    Color? addButtonColor,
    Color? addButtonBackgroundColor,
    double? addButtonSize,
    double? addButtonIconSize,
    double? addButtonBorderWidth,
  }) {
    return NodeCardStyle(
      width: width ?? this.width,
      headerHeight: headerHeight ?? this.headerHeight,
      entryHeight: entryHeight ?? this.entryHeight,
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      headerPaddingHorizontal:
          headerPaddingHorizontal ?? this.headerPaddingHorizontal,
      typeBadgeBackgroundColor:
          typeBadgeBackgroundColor ?? this.typeBadgeBackgroundColor,
      typeBadgeTextColor: typeBadgeTextColor ?? this.typeBadgeTextColor,
      typeBadgeFontSize: typeBadgeFontSize ?? this.typeBadgeFontSize,
      typeBadgeBorderRadius:
          typeBadgeBorderRadius ?? this.typeBadgeBorderRadius,
      badgeLabelGap: badgeLabelGap ?? this.badgeLabelGap,
      labelColor: labelColor ?? this.labelColor,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      labelFontWeight: labelFontWeight ?? this.labelFontWeight,
      collapseIconColor: collapseIconColor ?? this.collapseIconColor,
      collapseIconSize: collapseIconSize ?? this.collapseIconSize,
      collapseIconBackgroundColor:
          collapseIconBackgroundColor ?? this.collapseIconBackgroundColor,
      collapseIconBorderRadius:
          collapseIconBorderRadius ?? this.collapseIconBorderRadius,
      entryPaddingHorizontal:
          entryPaddingHorizontal ?? this.entryPaddingHorizontal,
      entryDividerColor: entryDividerColor ?? this.entryDividerColor,
      entryKeyColor: entryKeyColor ?? this.entryKeyColor,
      entryKeyFontSize: entryKeyFontSize ?? this.entryKeyFontSize,
      entrySeparatorColor: entrySeparatorColor ?? this.entrySeparatorColor,
      entrySeparatorPadding:
          entrySeparatorPadding ?? this.entrySeparatorPadding,
      entryValueFontSize: entryValueFontSize ?? this.entryValueFontSize,
      stringValueColor: stringValueColor ?? this.stringValueColor,
      numberValueColor: numberValueColor ?? this.numberValueColor,
      booleanValueColor: booleanValueColor ?? this.booleanValueColor,
      nullValueColor: nullValueColor ?? this.nullValueColor,
      fontFamily: fontFamily ?? this.fontFamily,
      addButtonColor: addButtonColor ?? this.addButtonColor,
      addButtonBackgroundColor:
          addButtonBackgroundColor ?? this.addButtonBackgroundColor,
      addButtonSize: addButtonSize ?? this.addButtonSize,
      addButtonIconSize: addButtonIconSize ?? this.addButtonIconSize,
      addButtonBorderWidth: addButtonBorderWidth ?? this.addButtonBorderWidth,
    );
  }
}
