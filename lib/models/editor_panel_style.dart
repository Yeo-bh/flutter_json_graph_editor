import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:re_editor/re_editor.dart';

part 'editor_panel_style.freezed.dart';

/// 에디터 패널(코드 에디터 영역)의 시각적 옵션.
///
/// [codeTheme]이 null이면 editor_panel.dart에서 기본 atom-one-light 테마 적용.
@freezed
abstract class EditorPanelStyle with _$EditorPanelStyle {
  const factory EditorPanelStyle({
    /// 상단 툴바 배경색.
    @Default(Color(0xFFF6F8FA)) Color toolbarBackgroundColor,

    /// 툴바의 'JSON' 레이블 텍스트 색.
    @Default(Color(0xFF6A737D)) Color toolbarTitleColor,

    /// 툴바 아이콘 색.
    @Default(Color(0xFF6A737D)) Color toolbarIconColor,

    /// 코드 에디터 배경색.
    @Default(Color(0xFFFFFFFF)) Color codeBackgroundColor,

    /// 기본 코드 텍스트 색.
    @Default(Color(0xFF24292E)) Color codeTextColor,

    /// 코드 폰트 크기(pt).
    @Default(13.0) double codeFontSize,

    /// 코드 폰트 패밀리.
    @Default('monospace') String codeFontFamily,

    /// 코드 줄 높이(line height).
    @Default(1.6) double codeFontHeight,

    /// 커서 색.
    @Default(Color(0xFF0366D6)) Color cursorColor,

    /// 텍스트 선택 배경색.
    @Default(Color(0x440366D6)) Color selectionColor,

    /// 현재 커서가 위치한 줄의 하이라이트 색.
    @Default(Color(0x0C000000)) Color cursorLineColor,

    /// 문법 강조 테마. null이면 기본 atom-one-light 적용.
    CodeHighlightTheme? codeTheme,

    /// 라인 번호 영역 배경색.
    @Default(Color(0xFFF6F8FA)) Color lineNumberBackgroundColor,

    /// 비활성 라인 번호 텍스트 색.
    @Default(Color(0xFFBEC4CB)) Color lineNumberTextColor,

    /// 커서가 위치한 줄의 활성 라인 번호 텍스트 색.
    @Default(Color(0xFF6A737D)) Color lineNumberFocusedTextColor,

    /// 라인 번호 영역과 코드 영역 사이 구분선 색.
    @Default(Color(0xFFE1E4E8)) Color separatorColor,

    /// 코드 접기(fold) 화살표 영역 너비(px).
    @Default(20.0) double chunkIndicatorWidth,

    /// 파싱 오류 발생 시 하단에 표시되는 오류 바 배경색.
    @Default(Color(0xFFFFF5F5)) Color errorBarBackgroundColor,

    /// 오류 바에 표시되는 텍스트 색.
    @Default(Color(0xFFCB2431)) Color errorBarTextColor,

    /// 코드 영역 내부 패딩.
    @Default(EdgeInsets.symmetric(horizontal: 16, vertical: 16)) EdgeInsets codePadding,
  }) = _EditorPanelStyle;
}
