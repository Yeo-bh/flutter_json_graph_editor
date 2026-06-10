import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_card_style.freezed.dart';

@freezed
abstract class NodeCardStyle with _$NodeCardStyle {
  const NodeCardStyle._();

  const factory NodeCardStyle({
    /// 카드 고정 너비(px).
    /// tree_layout의 수평 간격 계산에도 사용되므로 바꾸면 layoutTree 재호출 필요.
    @Default(210.0) double width,

    /// 카드 헤더 영역 높이(px).
    /// nodeHeight 계산에 포함되므로 바꾸면 layoutTree 재호출 필요.
    @Default(40.0) double headerHeight,

    /// key-value 행 하나의 높이(px).
    /// nodeHeight = headerHeight + entries.length × entryHeight + borderWidth×2.
    @Default(28.0) double entryHeight,

    /// 카드 모서리 둥글기 반지름(px). 0이면 직각.
    @Default(8.0) double borderRadius,

    /// 카드 내부 배경색.
    @Default(Color(0xFFFFFFFF)) Color backgroundColor,

    /// 카드 테두리 색.
    @Default(Color(0xFFE1E4E8)) Color borderColor,

    /// 카드 테두리 두께(px).
    @Default(1.0) double borderWidth,

    /// 카드 아래 그림자 색상.
    @Default(Color(0x0D000000)) Color shadowColor,

    /// 그림자 번짐 반경(px).
    @Default(8.0) double shadowBlurRadius,

    /// 그림자 위치 오프셋.
    @Default(Offset(0, 2)) Offset shadowOffset,

    /// 헤더 배경색.
    @Default(Color(0xFFF6F8FA)) Color headerBackgroundColor,

    /// 헤더 내 좌우 내부 패딩(px).
    @Default(10.0) double headerPaddingHorizontal,

    /// 타입 뱃지 배경색.
    @Default(Color(0xFFF1F8FF)) Color typeBadgeBackgroundColor,

    /// 타입 뱃지 텍스트 색.
    @Default(Color(0xFF0366D6)) Color typeBadgeTextColor,

    /// 타입 뱃지 폰트 크기(pt).
    @Default(10.0) double typeBadgeFontSize,

    /// 타입 뱃지 모서리 둥글기 반지름(px).
    @Default(4.0) double typeBadgeBorderRadius,

    /// 타입 뱃지 오른쪽 끝 ~ 라벨 왼쪽 시작 사이 간격(px).
    @Default(8.0) double badgeLabelGap,

    /// 헤더에 표시되는 키 이름 텍스트 색.
    @Default(Color(0xFF24292E)) Color labelColor,

    /// 헤더 키 이름 폰트 크기(pt).
    @Default(12.0) double labelFontSize,

    /// 헤더 키 이름 폰트 두께.
    @Default(FontWeight.w600) FontWeight labelFontWeight,

    /// 접기/펼치기 아이콘 색.
    @Default(Color(0xFF6A737D)) Color collapseIconColor,

    /// 접기/펼치기 아이콘 크기(px).
    @Default(14.0) double collapseIconSize,

    /// 접기/펼치기 버튼 배경색.
    @Default(Color(0xFFF1F8FF)) Color collapseIconBackgroundColor,

    /// 접기/펼치기 버튼 모서리 둥글기(px).
    @Default(4.0) double collapseIconBorderRadius,

    /// entry 행 좌우 내부 패딩(px).
    @Default(12.0) double entryPaddingHorizontal,

    /// 각 entry 행 위에 그려지는 구분선 색.
    @Default(Color(0xFFF0F2F4)) Color entryDividerColor,

    /// entry 행의 key 텍스트 색.
    @Default(Color(0xFF6A737D)) Color entryKeyColor,

    /// entry 행의 key 폰트 크기(pt).
    @Default(11.0) double entryKeyFontSize,

    /// key와 value 사이 ':' 구분자 색.
    @Default(Color(0xFFBEC4CB)) Color entrySeparatorColor,

    /// ':' 구분자 좌우 패딩(px).
    @Default(4.0) double entrySeparatorPadding,

    /// entry 행의 value 폰트 크기(pt).
    @Default(11.0) double entryValueFontSize,

    /// JSON string 값 색.
    @Default(Color(0xFF22863A)) Color stringValueColor,

    /// JSON number 값 색.
    @Default(Color(0xFF005CC5)) Color numberValueColor,

    /// JSON boolean 값 색.
    @Default(Color(0xFF6F42C1)) Color booleanValueColor,

    /// JSON null 값 색.
    @Default(Color(0xFF6A737D)) Color nullValueColor,

    /// 카드 전체에 적용되는 폰트 패밀리.
    @Default('monospace') String fontFamily,

    /// 사이드 패널에서 선택된 노드 카드의 테두리 색.
    @Default(Color(0xFF0366D6)) Color selectedBorderColor,

    /// + 버튼 아이콘 및 테두리 색.
    @Default(Color(0xFF0366D6)) Color addButtonColor,

    /// + 버튼 배경색.
    @Default(Color(0xFFF1F8FF)) Color addButtonBackgroundColor,

    /// + 버튼 크기(px, 지름).
    @Default(26.0) double addButtonSize,

    /// + 버튼 아이콘 크기(px).
    @Default(14.0) double addButtonIconSize,

    /// + 버튼 테두리 두께(px).
    @Default(1.5) double addButtonBorderWidth,
  }) = _NodeCardStyle;

  static const NodeCardStyle defaults = NodeCardStyle();
}
