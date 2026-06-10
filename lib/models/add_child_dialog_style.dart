import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_child_dialog_style.freezed.dart';

@freezed
abstract class AddChildDialogStyle with _$AddChildDialogStyle {
  const factory AddChildDialogStyle({
    /// 다이얼로그 배경색.
    @Default(Color(0xFFFFFFFF)) Color backgroundColor,

    /// 다이얼로그 모서리 둥글기(px).
    @Default(12.0) double borderRadius,

    /// 다이얼로그 최대 너비(px).
    @Default(360.0) double maxWidth,

    /// 헤더 내부 패딩.
    @Default(EdgeInsets.fromLTRB(16, 14, 12, 14)) EdgeInsets headerPadding,

    /// 헤더~바디 사이 구분선 색.
    @Default(Color(0xFFE1E4E8)) Color dividerColor,

    /// 제목 텍스트 색.
    @Default(Color(0xFF24292E)) Color titleColor,

    /// 제목 폰트 크기(pt).
    @Default(14.0) double titleFontSize,

    /// 제목 폰트 두께.
    @Default(FontWeight.w600) FontWeight titleFontWeight,

    /// 닫기(X) 아이콘 색.
    @Default(Color(0xFF6A737D)) Color closeIconColor,

    /// 닫기(X) 아이콘 크기(px).
    @Default(18.0) double closeIconSize,

    /// 다이얼로그 제목 접미사. 노드 라벨 뒤에 붙는 문자열.
    @Default('에 자식 추가') String titleSuffix,

    /// 바디 영역 내부 패딩.
    @Default(EdgeInsets.all(16)) EdgeInsets bodyPadding,

    /// '키' / '타입' 섹션 라벨 색.
    @Default(Color(0xFF6A737D)) Color sectionLabelColor,

    /// 섹션 라벨 폰트 크기(pt).
    @Default(11.0) double sectionLabelFontSize,

    /// 키 필드 테두리 색 (비포커스 상태).
    @Default(Color(0xFFE1E4E8)) Color keyFieldBorderColor,

    /// 키 필드 테두리 색 (포커스 상태).
    @Default(Color(0xFF0366D6)) Color keyFieldFocusedBorderColor,

    /// 키 필드 입력 텍스트 색.
    @Default(Color(0xFF24292E)) Color keyFieldTextColor,

    /// 키 필드 폰트 크기(pt).
    @Default(12.0) double keyFieldFontSize,

    /// 키 필드 모서리 둥글기(px).
    @Default(6.0) double keyFieldBorderRadius,

    /// 비활성 칩 배경색.
    @Default(Color(0xFFF6F8FA)) Color chipIdleBackgroundColor,

    /// 활성 칩 배경색.
    @Default(Color(0xFFF1F8FF)) Color chipActiveBackgroundColor,

    /// 활성 칩 테두리 색.
    @Default(Color(0xFF0366D6)) Color chipActiveBorderColor,

    /// 비활성 칩 텍스트 색.
    @Default(Color(0xFF6A737D)) Color chipIdleTextColor,

    /// 활성 칩 텍스트 색.
    @Default(Color(0xFF0366D6)) Color chipActiveTextColor,

    /// 칩 폰트 크기(pt).
    @Default(11.0) double chipFontSize,

    /// 칩 모서리 둥글기(px).
    @Default(6.0) double chipBorderRadius,

    /// 칩 내부 패딩.
    @Default(EdgeInsets.symmetric(horizontal: 12, vertical: 6)) EdgeInsets chipPadding,

    /// 푸터 영역 내부 패딩.
    @Default(EdgeInsets.fromLTRB(16, 0, 16, 14)) EdgeInsets footerPadding,

    /// '취소' 버튼 텍스트 색.
    @Default(Color(0xFF6A737D)) Color cancelTextColor,

    /// '추가' 버튼 배경색.
    @Default(Color(0xFF0366D6)) Color confirmBackgroundColor,

    /// '추가' 버튼 텍스트 색.
    @Default(Color(0xFFFFFFFF)) Color confirmTextColor,

    /// '추가' 버튼 모서리 둥글기(px).
    @Default(6.0) double confirmBorderRadius,

    /// 다이얼로그 전체에 적용되는 폰트 패밀리.
    @Default('monospace') String fontFamily,
  }) = _AddChildDialogStyle;
}
