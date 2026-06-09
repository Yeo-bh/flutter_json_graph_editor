import 'package:flutter/material.dart';

/// 자식 노드 추가 다이얼로그([AddChildDialog])의 모든 시각적 옵션.
/// [JsonEditorStyle.addChildDialog]에서 접근한다.
class AddChildDialogStyle {
  // ── 다이얼로그 컨테이너 ────────────────────────────────

  /// 다이얼로그 배경색.
  final Color backgroundColor;

  /// 다이얼로그 모서리 둥글기(px).
  final double borderRadius;

  /// 다이얼로그 최대 너비(px).
  final double maxWidth;

  // ── 헤더 ─────────────────────────────────────────────

  /// 헤더 내부 패딩.
  final EdgeInsets headerPadding;

  /// 헤더~바디 사이 구분선 색.
  final Color dividerColor;

  /// 제목 텍스트 색.
  final Color titleColor;

  /// 제목 폰트 크기(pt).
  final double titleFontSize;

  /// 제목 폰트 두께.
  final FontWeight titleFontWeight;

  /// 닫기(X) 아이콘 색.
  final Color closeIconColor;

  /// 닫기(X) 아이콘 크기(px).
  final double closeIconSize;

  /// 다이얼로그 제목 접미사. 노드 라벨 뒤에 붙는 문자열.
  /// 예: '"fruits" 에 자식 추가' → titleSuffix = '에 자식 추가'
  final String titleSuffix;

  // ── 바디 ─────────────────────────────────────────────

  /// 바디 영역 내부 패딩.
  final EdgeInsets bodyPadding;

  /// '키' / '타입' 섹션 라벨 색.
  final Color sectionLabelColor;

  /// 섹션 라벨 폰트 크기(pt).
  final double sectionLabelFontSize;

  // ── 키 입력 필드 ──────────────────────────────────────

  /// 키 필드 테두리 색 (비포커스 상태).
  final Color keyFieldBorderColor;

  /// 키 필드 테두리 색 (포커스 상태).
  final Color keyFieldFocusedBorderColor;

  /// 키 필드 입력 텍스트 색.
  final Color keyFieldTextColor;

  /// 키 필드 폰트 크기(pt).
  final double keyFieldFontSize;

  /// 키 필드 모서리 둥글기(px).
  final double keyFieldBorderRadius;

  // ── 타입 선택 칩 (Object / Array 2개) ─────────────────
  // 비활성(idle) = 선택되지 않은 칩, 활성(active) = 선택된 칩.
  // 비활성 칩의 테두리는 dividerColor를 재사용한다.

  /// 비활성 칩 배경색.
  final Color chipIdleBackgroundColor;

  /// 활성 칩 배경색.
  final Color chipActiveBackgroundColor;

  /// 활성 칩 테두리 색. 비활성 칩 테두리는 [dividerColor] 사용.
  final Color chipActiveBorderColor;

  /// 비활성 칩 텍스트 색.
  final Color chipIdleTextColor;

  /// 활성 칩 텍스트 색.
  final Color chipActiveTextColor;

  /// 칩 폰트 크기(pt).
  final double chipFontSize;

  /// 칩 모서리 둥글기(px).
  final double chipBorderRadius;

  /// 칩 내부 패딩.
  final EdgeInsets chipPadding;

  // ── 푸터 버튼 ─────────────────────────────────────────

  /// 푸터 영역 내부 패딩.
  final EdgeInsets footerPadding;

  /// '취소' 버튼 텍스트 색.
  final Color cancelTextColor;

  /// '추가' 버튼 배경색.
  final Color confirmBackgroundColor;

  /// '추가' 버튼 텍스트 색.
  final Color confirmTextColor;

  /// '추가' 버튼 모서리 둥글기(px).
  final double confirmBorderRadius;

  // ── 공통 폰트 ─────────────────────────────────────────

  /// 다이얼로그 전체에 적용되는 폰트 패밀리.
  final String fontFamily;

  const AddChildDialogStyle({
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.borderRadius = 12.0,
    this.maxWidth = 360.0,
    this.headerPadding = const EdgeInsets.fromLTRB(16, 14, 12, 14),
    this.dividerColor = const Color(0xFFE1E4E8),
    this.titleColor = const Color(0xFF24292E),
    this.titleFontSize = 14.0,
    this.titleFontWeight = FontWeight.w600,
    this.closeIconColor = const Color(0xFF6A737D),
    this.closeIconSize = 18.0,
    this.titleSuffix = '에 자식 추가',
    this.bodyPadding = const EdgeInsets.all(16),
    this.sectionLabelColor = const Color(0xFF6A737D),
    this.sectionLabelFontSize = 11.0,
    this.keyFieldBorderColor = const Color(0xFFE1E4E8),
    this.keyFieldFocusedBorderColor = const Color(0xFF0366D6),
    this.keyFieldTextColor = const Color(0xFF24292E),
    this.keyFieldFontSize = 12.0,
    this.keyFieldBorderRadius = 6.0,
    this.chipIdleBackgroundColor = const Color(0xFFF6F8FA),
    this.chipActiveBackgroundColor = const Color(0xFFF1F8FF),
    this.chipActiveBorderColor = const Color(0xFF0366D6),
    this.chipIdleTextColor = const Color(0xFF6A737D),
    this.chipActiveTextColor = const Color(0xFF0366D6),
    this.chipFontSize = 11.0,
    this.chipBorderRadius = 6.0,
    this.chipPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.footerPadding = const EdgeInsets.fromLTRB(16, 0, 16, 14),
    this.cancelTextColor = const Color(0xFF6A737D),
    this.confirmBackgroundColor = const Color(0xFF0366D6),
    this.confirmTextColor = const Color(0xFFFFFFFF),
    this.confirmBorderRadius = 6.0,
    this.fontFamily = 'monospace',
  });

  AddChildDialogStyle copyWith({
    Color? backgroundColor,
    double? borderRadius,
    double? maxWidth,
    EdgeInsets? headerPadding,
    Color? dividerColor,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    Color? closeIconColor,
    double? closeIconSize,
    String? titleSuffix,
    EdgeInsets? bodyPadding,
    Color? sectionLabelColor,
    double? sectionLabelFontSize,
    Color? keyFieldBorderColor,
    Color? keyFieldFocusedBorderColor,
    Color? keyFieldTextColor,
    double? keyFieldFontSize,
    double? keyFieldBorderRadius,
    Color? chipIdleBackgroundColor,
    Color? chipActiveBackgroundColor,
    Color? chipActiveBorderColor,
    Color? chipIdleTextColor,
    Color? chipActiveTextColor,
    double? chipFontSize,
    double? chipBorderRadius,
    EdgeInsets? chipPadding,
    EdgeInsets? footerPadding,
    Color? cancelTextColor,
    Color? confirmBackgroundColor,
    Color? confirmTextColor,
    double? confirmBorderRadius,
    String? fontFamily,
  }) {
    return AddChildDialogStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      maxWidth: maxWidth ?? this.maxWidth,
      headerPadding: headerPadding ?? this.headerPadding,
      dividerColor: dividerColor ?? this.dividerColor,
      titleColor: titleColor ?? this.titleColor,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      closeIconSize: closeIconSize ?? this.closeIconSize,
      titleSuffix: titleSuffix ?? this.titleSuffix,
      bodyPadding: bodyPadding ?? this.bodyPadding,
      sectionLabelColor: sectionLabelColor ?? this.sectionLabelColor,
      sectionLabelFontSize: sectionLabelFontSize ?? this.sectionLabelFontSize,
      keyFieldBorderColor: keyFieldBorderColor ?? this.keyFieldBorderColor,
      keyFieldFocusedBorderColor:
          keyFieldFocusedBorderColor ?? this.keyFieldFocusedBorderColor,
      keyFieldTextColor: keyFieldTextColor ?? this.keyFieldTextColor,
      keyFieldFontSize: keyFieldFontSize ?? this.keyFieldFontSize,
      keyFieldBorderRadius: keyFieldBorderRadius ?? this.keyFieldBorderRadius,
      chipIdleBackgroundColor:
          chipIdleBackgroundColor ?? this.chipIdleBackgroundColor,
      chipActiveBackgroundColor:
          chipActiveBackgroundColor ?? this.chipActiveBackgroundColor,
      chipActiveBorderColor:
          chipActiveBorderColor ?? this.chipActiveBorderColor,
      chipIdleTextColor: chipIdleTextColor ?? this.chipIdleTextColor,
      chipActiveTextColor: chipActiveTextColor ?? this.chipActiveTextColor,
      chipFontSize: chipFontSize ?? this.chipFontSize,
      chipBorderRadius: chipBorderRadius ?? this.chipBorderRadius,
      chipPadding: chipPadding ?? this.chipPadding,
      footerPadding: footerPadding ?? this.footerPadding,
      cancelTextColor: cancelTextColor ?? this.cancelTextColor,
      confirmBackgroundColor:
          confirmBackgroundColor ?? this.confirmBackgroundColor,
      confirmTextColor: confirmTextColor ?? this.confirmTextColor,
      confirmBorderRadius: confirmBorderRadius ?? this.confirmBorderRadius,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
