import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/styles/atom-one-light.dart';

/// 에디터 패널(코드 에디터 영역)의 시각적 옵션.
///
/// [codeTheme]이 [CodeHighlightTheme]을 사용하므로 const 생성자를 지원하지 않음.
class EditorPanelStyle {
  /// 상단 툴바 배경색.
  final Color toolbarBackgroundColor;

  /// 툴바의 'JSON' 레이블 텍스트 색.
  final Color toolbarTitleColor;

  /// 툴바 아이콘 색.
  final Color toolbarIconColor;

  /// 코드 에디터 배경색.
  final Color codeBackgroundColor;

  /// 기본 코드 텍스트 색.
  final Color codeTextColor;

  /// 코드 폰트 크기(pt).
  final double codeFontSize;

  /// 코드 폰트 패밀리.
  final String codeFontFamily;

  /// 코드 줄 높이(line height). 1.0이 기본 줄 높이.
  final double codeFontHeight;

  /// 커서 색.
  final Color cursorColor;

  /// 텍스트 선택 배경색.
  final Color selectionColor;

  /// 현재 커서가 위치한 줄의 하이라이트 색.
  final Color cursorLineColor;

  /// 문법 강조 테마. 언어별 모드와 색상 테마를 포함함.
  final CodeHighlightTheme codeTheme;

  /// 라인 번호 영역 배경색.
  final Color lineNumberBackgroundColor;

  /// 비활성 라인 번호 텍스트 색.
  final Color lineNumberTextColor;

  /// 커서가 위치한 줄의 활성 라인 번호 텍스트 색.
  final Color lineNumberFocusedTextColor;

  /// 라인 번호 영역과 코드 영역 사이 구분선 색.
  final Color separatorColor;

  /// 코드 접기(fold) 화살표 영역 너비(px).
  final double chunkIndicatorWidth;

  /// 파싱 오류 발생 시 하단에 표시되는 오류 바 배경색.
  final Color errorBarBackgroundColor;

  /// 오류 바에 표시되는 텍스트 색.
  final Color errorBarTextColor;

  /// 코드 영역 내부 패딩.
  final EdgeInsets codePadding;

  EditorPanelStyle({
    this.toolbarBackgroundColor = const Color(0xFFF6F8FA),
    this.toolbarTitleColor = const Color(0xFF6A737D),
    this.toolbarIconColor = const Color(0xFF6A737D),
    this.codeBackgroundColor = const Color(0xFFFFFFFF),
    this.codeTextColor = const Color(0xFF24292E),
    this.codeFontSize = 13.0,
    this.codeFontFamily = 'monospace',
    this.codeFontHeight = 1.6,
    this.cursorColor = const Color(0xFF0366D6),
    this.selectionColor = const Color(0x440366D6),
    this.cursorLineColor = const Color(0x0C000000),
    CodeHighlightTheme? codeTheme,
    this.lineNumberBackgroundColor = const Color(0xFFF6F8FA),
    this.lineNumberTextColor = const Color(0xFFBEC4CB),
    this.lineNumberFocusedTextColor = const Color(0xFF6A737D),
    this.separatorColor = const Color(0xFFE1E4E8),
    this.chunkIndicatorWidth = 20.0,
    this.errorBarBackgroundColor = const Color(0xFFFFF5F5),
    this.errorBarTextColor = const Color(0xFFCB2431),
    this.codePadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  }) : codeTheme = codeTheme ??
            CodeHighlightTheme(
              languages: {'json': CodeHighlightThemeMode(mode: langJson)},
              theme: atomOneLightTheme,
            );

  EditorPanelStyle copyWith({
    Color? toolbarBackgroundColor,
    Color? toolbarTitleColor,
    Color? toolbarIconColor,
    Color? codeBackgroundColor,
    Color? codeTextColor,
    double? codeFontSize,
    String? codeFontFamily,
    double? codeFontHeight,
    Color? cursorColor,
    Color? selectionColor,
    Color? cursorLineColor,
    CodeHighlightTheme? codeTheme,
    Color? lineNumberBackgroundColor,
    Color? lineNumberTextColor,
    Color? lineNumberFocusedTextColor,
    Color? separatorColor,
    double? chunkIndicatorWidth,
    Color? errorBarBackgroundColor,
    Color? errorBarTextColor,
    EdgeInsets? codePadding,
  }) {
    return EditorPanelStyle(
      toolbarBackgroundColor: toolbarBackgroundColor ?? this.toolbarBackgroundColor,
      toolbarTitleColor: toolbarTitleColor ?? this.toolbarTitleColor,
      toolbarIconColor: toolbarIconColor ?? this.toolbarIconColor,
      codeBackgroundColor: codeBackgroundColor ?? this.codeBackgroundColor,
      codeTextColor: codeTextColor ?? this.codeTextColor,
      codeFontSize: codeFontSize ?? this.codeFontSize,
      codeFontFamily: codeFontFamily ?? this.codeFontFamily,
      codeFontHeight: codeFontHeight ?? this.codeFontHeight,
      cursorColor: cursorColor ?? this.cursorColor,
      selectionColor: selectionColor ?? this.selectionColor,
      cursorLineColor: cursorLineColor ?? this.cursorLineColor,
      codeTheme: codeTheme ?? this.codeTheme,
      lineNumberBackgroundColor: lineNumberBackgroundColor ?? this.lineNumberBackgroundColor,
      lineNumberTextColor: lineNumberTextColor ?? this.lineNumberTextColor,
      lineNumberFocusedTextColor: lineNumberFocusedTextColor ?? this.lineNumberFocusedTextColor,
      separatorColor: separatorColor ?? this.separatorColor,
      chunkIndicatorWidth: chunkIndicatorWidth ?? this.chunkIndicatorWidth,
      errorBarBackgroundColor: errorBarBackgroundColor ?? this.errorBarBackgroundColor,
      errorBarTextColor: errorBarTextColor ?? this.errorBarTextColor,
      codePadding: codePadding ?? this.codePadding,
    );
  }
}
