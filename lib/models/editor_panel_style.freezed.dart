// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_panel_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditorPanelStyle {

/// 상단 툴바 배경색.
 Color get toolbarBackgroundColor;/// 툴바의 'JSON' 레이블 텍스트 색.
 Color get toolbarTitleColor;/// 툴바 아이콘 색.
 Color get toolbarIconColor;/// 코드 에디터 배경색.
 Color get codeBackgroundColor;/// 기본 코드 텍스트 색.
 Color get codeTextColor;/// 코드 폰트 크기(pt).
 double get codeFontSize;/// 코드 폰트 패밀리.
 String get codeFontFamily;/// 코드 줄 높이(line height).
 double get codeFontHeight;/// 커서 색.
 Color get cursorColor;/// 텍스트 선택 배경색.
 Color get selectionColor;/// 현재 커서가 위치한 줄의 하이라이트 색.
 Color get cursorLineColor;/// 문법 강조 테마. null이면 기본 atom-one-light 적용.
 CodeHighlightTheme? get codeTheme;/// 라인 번호 영역 배경색.
 Color get lineNumberBackgroundColor;/// 비활성 라인 번호 텍스트 색.
 Color get lineNumberTextColor;/// 커서가 위치한 줄의 활성 라인 번호 텍스트 색.
 Color get lineNumberFocusedTextColor;/// 라인 번호 영역과 코드 영역 사이 구분선 색.
 Color get separatorColor;/// 코드 접기(fold) 화살표 영역 너비(px).
 double get chunkIndicatorWidth;/// 파싱 오류 발생 시 하단에 표시되는 오류 바 배경색.
 Color get errorBarBackgroundColor;/// 오류 바에 표시되는 텍스트 색.
 Color get errorBarTextColor;/// 코드 영역 내부 패딩.
 EdgeInsets get codePadding;
/// Create a copy of EditorPanelStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditorPanelStyleCopyWith<EditorPanelStyle> get copyWith => _$EditorPanelStyleCopyWithImpl<EditorPanelStyle>(this as EditorPanelStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditorPanelStyle&&(identical(other.toolbarBackgroundColor, toolbarBackgroundColor) || other.toolbarBackgroundColor == toolbarBackgroundColor)&&(identical(other.toolbarTitleColor, toolbarTitleColor) || other.toolbarTitleColor == toolbarTitleColor)&&(identical(other.toolbarIconColor, toolbarIconColor) || other.toolbarIconColor == toolbarIconColor)&&(identical(other.codeBackgroundColor, codeBackgroundColor) || other.codeBackgroundColor == codeBackgroundColor)&&(identical(other.codeTextColor, codeTextColor) || other.codeTextColor == codeTextColor)&&(identical(other.codeFontSize, codeFontSize) || other.codeFontSize == codeFontSize)&&(identical(other.codeFontFamily, codeFontFamily) || other.codeFontFamily == codeFontFamily)&&(identical(other.codeFontHeight, codeFontHeight) || other.codeFontHeight == codeFontHeight)&&(identical(other.cursorColor, cursorColor) || other.cursorColor == cursorColor)&&(identical(other.selectionColor, selectionColor) || other.selectionColor == selectionColor)&&(identical(other.cursorLineColor, cursorLineColor) || other.cursorLineColor == cursorLineColor)&&(identical(other.codeTheme, codeTheme) || other.codeTheme == codeTheme)&&(identical(other.lineNumberBackgroundColor, lineNumberBackgroundColor) || other.lineNumberBackgroundColor == lineNumberBackgroundColor)&&(identical(other.lineNumberTextColor, lineNumberTextColor) || other.lineNumberTextColor == lineNumberTextColor)&&(identical(other.lineNumberFocusedTextColor, lineNumberFocusedTextColor) || other.lineNumberFocusedTextColor == lineNumberFocusedTextColor)&&(identical(other.separatorColor, separatorColor) || other.separatorColor == separatorColor)&&(identical(other.chunkIndicatorWidth, chunkIndicatorWidth) || other.chunkIndicatorWidth == chunkIndicatorWidth)&&(identical(other.errorBarBackgroundColor, errorBarBackgroundColor) || other.errorBarBackgroundColor == errorBarBackgroundColor)&&(identical(other.errorBarTextColor, errorBarTextColor) || other.errorBarTextColor == errorBarTextColor)&&(identical(other.codePadding, codePadding) || other.codePadding == codePadding));
}


@override
int get hashCode => Object.hashAll([runtimeType,toolbarBackgroundColor,toolbarTitleColor,toolbarIconColor,codeBackgroundColor,codeTextColor,codeFontSize,codeFontFamily,codeFontHeight,cursorColor,selectionColor,cursorLineColor,codeTheme,lineNumberBackgroundColor,lineNumberTextColor,lineNumberFocusedTextColor,separatorColor,chunkIndicatorWidth,errorBarBackgroundColor,errorBarTextColor,codePadding]);

@override
String toString() {
  return 'EditorPanelStyle(toolbarBackgroundColor: $toolbarBackgroundColor, toolbarTitleColor: $toolbarTitleColor, toolbarIconColor: $toolbarIconColor, codeBackgroundColor: $codeBackgroundColor, codeTextColor: $codeTextColor, codeFontSize: $codeFontSize, codeFontFamily: $codeFontFamily, codeFontHeight: $codeFontHeight, cursorColor: $cursorColor, selectionColor: $selectionColor, cursorLineColor: $cursorLineColor, codeTheme: $codeTheme, lineNumberBackgroundColor: $lineNumberBackgroundColor, lineNumberTextColor: $lineNumberTextColor, lineNumberFocusedTextColor: $lineNumberFocusedTextColor, separatorColor: $separatorColor, chunkIndicatorWidth: $chunkIndicatorWidth, errorBarBackgroundColor: $errorBarBackgroundColor, errorBarTextColor: $errorBarTextColor, codePadding: $codePadding)';
}


}

/// @nodoc
abstract mixin class $EditorPanelStyleCopyWith<$Res>  {
  factory $EditorPanelStyleCopyWith(EditorPanelStyle value, $Res Function(EditorPanelStyle) _then) = _$EditorPanelStyleCopyWithImpl;
@useResult
$Res call({
 Color toolbarBackgroundColor, Color toolbarTitleColor, Color toolbarIconColor, Color codeBackgroundColor, Color codeTextColor, double codeFontSize, String codeFontFamily, double codeFontHeight, Color cursorColor, Color selectionColor, Color cursorLineColor, CodeHighlightTheme? codeTheme, Color lineNumberBackgroundColor, Color lineNumberTextColor, Color lineNumberFocusedTextColor, Color separatorColor, double chunkIndicatorWidth, Color errorBarBackgroundColor, Color errorBarTextColor, EdgeInsets codePadding
});




}
/// @nodoc
class _$EditorPanelStyleCopyWithImpl<$Res>
    implements $EditorPanelStyleCopyWith<$Res> {
  _$EditorPanelStyleCopyWithImpl(this._self, this._then);

  final EditorPanelStyle _self;
  final $Res Function(EditorPanelStyle) _then;

/// Create a copy of EditorPanelStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? toolbarBackgroundColor = null,Object? toolbarTitleColor = null,Object? toolbarIconColor = null,Object? codeBackgroundColor = null,Object? codeTextColor = null,Object? codeFontSize = null,Object? codeFontFamily = null,Object? codeFontHeight = null,Object? cursorColor = null,Object? selectionColor = null,Object? cursorLineColor = null,Object? codeTheme = freezed,Object? lineNumberBackgroundColor = null,Object? lineNumberTextColor = null,Object? lineNumberFocusedTextColor = null,Object? separatorColor = null,Object? chunkIndicatorWidth = null,Object? errorBarBackgroundColor = null,Object? errorBarTextColor = null,Object? codePadding = null,}) {
  return _then(_self.copyWith(
toolbarBackgroundColor: null == toolbarBackgroundColor ? _self.toolbarBackgroundColor : toolbarBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,toolbarTitleColor: null == toolbarTitleColor ? _self.toolbarTitleColor : toolbarTitleColor // ignore: cast_nullable_to_non_nullable
as Color,toolbarIconColor: null == toolbarIconColor ? _self.toolbarIconColor : toolbarIconColor // ignore: cast_nullable_to_non_nullable
as Color,codeBackgroundColor: null == codeBackgroundColor ? _self.codeBackgroundColor : codeBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,codeTextColor: null == codeTextColor ? _self.codeTextColor : codeTextColor // ignore: cast_nullable_to_non_nullable
as Color,codeFontSize: null == codeFontSize ? _self.codeFontSize : codeFontSize // ignore: cast_nullable_to_non_nullable
as double,codeFontFamily: null == codeFontFamily ? _self.codeFontFamily : codeFontFamily // ignore: cast_nullable_to_non_nullable
as String,codeFontHeight: null == codeFontHeight ? _self.codeFontHeight : codeFontHeight // ignore: cast_nullable_to_non_nullable
as double,cursorColor: null == cursorColor ? _self.cursorColor : cursorColor // ignore: cast_nullable_to_non_nullable
as Color,selectionColor: null == selectionColor ? _self.selectionColor : selectionColor // ignore: cast_nullable_to_non_nullable
as Color,cursorLineColor: null == cursorLineColor ? _self.cursorLineColor : cursorLineColor // ignore: cast_nullable_to_non_nullable
as Color,codeTheme: freezed == codeTheme ? _self.codeTheme : codeTheme // ignore: cast_nullable_to_non_nullable
as CodeHighlightTheme?,lineNumberBackgroundColor: null == lineNumberBackgroundColor ? _self.lineNumberBackgroundColor : lineNumberBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,lineNumberTextColor: null == lineNumberTextColor ? _self.lineNumberTextColor : lineNumberTextColor // ignore: cast_nullable_to_non_nullable
as Color,lineNumberFocusedTextColor: null == lineNumberFocusedTextColor ? _self.lineNumberFocusedTextColor : lineNumberFocusedTextColor // ignore: cast_nullable_to_non_nullable
as Color,separatorColor: null == separatorColor ? _self.separatorColor : separatorColor // ignore: cast_nullable_to_non_nullable
as Color,chunkIndicatorWidth: null == chunkIndicatorWidth ? _self.chunkIndicatorWidth : chunkIndicatorWidth // ignore: cast_nullable_to_non_nullable
as double,errorBarBackgroundColor: null == errorBarBackgroundColor ? _self.errorBarBackgroundColor : errorBarBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,errorBarTextColor: null == errorBarTextColor ? _self.errorBarTextColor : errorBarTextColor // ignore: cast_nullable_to_non_nullable
as Color,codePadding: null == codePadding ? _self.codePadding : codePadding // ignore: cast_nullable_to_non_nullable
as EdgeInsets,
  ));
}

}


/// Adds pattern-matching-related methods to [EditorPanelStyle].
extension EditorPanelStylePatterns on EditorPanelStyle {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditorPanelStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditorPanelStyle() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditorPanelStyle value)  $default,){
final _that = this;
switch (_that) {
case _EditorPanelStyle():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditorPanelStyle value)?  $default,){
final _that = this;
switch (_that) {
case _EditorPanelStyle() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color toolbarBackgroundColor,  Color toolbarTitleColor,  Color toolbarIconColor,  Color codeBackgroundColor,  Color codeTextColor,  double codeFontSize,  String codeFontFamily,  double codeFontHeight,  Color cursorColor,  Color selectionColor,  Color cursorLineColor,  CodeHighlightTheme? codeTheme,  Color lineNumberBackgroundColor,  Color lineNumberTextColor,  Color lineNumberFocusedTextColor,  Color separatorColor,  double chunkIndicatorWidth,  Color errorBarBackgroundColor,  Color errorBarTextColor,  EdgeInsets codePadding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditorPanelStyle() when $default != null:
return $default(_that.toolbarBackgroundColor,_that.toolbarTitleColor,_that.toolbarIconColor,_that.codeBackgroundColor,_that.codeTextColor,_that.codeFontSize,_that.codeFontFamily,_that.codeFontHeight,_that.cursorColor,_that.selectionColor,_that.cursorLineColor,_that.codeTheme,_that.lineNumberBackgroundColor,_that.lineNumberTextColor,_that.lineNumberFocusedTextColor,_that.separatorColor,_that.chunkIndicatorWidth,_that.errorBarBackgroundColor,_that.errorBarTextColor,_that.codePadding);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color toolbarBackgroundColor,  Color toolbarTitleColor,  Color toolbarIconColor,  Color codeBackgroundColor,  Color codeTextColor,  double codeFontSize,  String codeFontFamily,  double codeFontHeight,  Color cursorColor,  Color selectionColor,  Color cursorLineColor,  CodeHighlightTheme? codeTheme,  Color lineNumberBackgroundColor,  Color lineNumberTextColor,  Color lineNumberFocusedTextColor,  Color separatorColor,  double chunkIndicatorWidth,  Color errorBarBackgroundColor,  Color errorBarTextColor,  EdgeInsets codePadding)  $default,) {final _that = this;
switch (_that) {
case _EditorPanelStyle():
return $default(_that.toolbarBackgroundColor,_that.toolbarTitleColor,_that.toolbarIconColor,_that.codeBackgroundColor,_that.codeTextColor,_that.codeFontSize,_that.codeFontFamily,_that.codeFontHeight,_that.cursorColor,_that.selectionColor,_that.cursorLineColor,_that.codeTheme,_that.lineNumberBackgroundColor,_that.lineNumberTextColor,_that.lineNumberFocusedTextColor,_that.separatorColor,_that.chunkIndicatorWidth,_that.errorBarBackgroundColor,_that.errorBarTextColor,_that.codePadding);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color toolbarBackgroundColor,  Color toolbarTitleColor,  Color toolbarIconColor,  Color codeBackgroundColor,  Color codeTextColor,  double codeFontSize,  String codeFontFamily,  double codeFontHeight,  Color cursorColor,  Color selectionColor,  Color cursorLineColor,  CodeHighlightTheme? codeTheme,  Color lineNumberBackgroundColor,  Color lineNumberTextColor,  Color lineNumberFocusedTextColor,  Color separatorColor,  double chunkIndicatorWidth,  Color errorBarBackgroundColor,  Color errorBarTextColor,  EdgeInsets codePadding)?  $default,) {final _that = this;
switch (_that) {
case _EditorPanelStyle() when $default != null:
return $default(_that.toolbarBackgroundColor,_that.toolbarTitleColor,_that.toolbarIconColor,_that.codeBackgroundColor,_that.codeTextColor,_that.codeFontSize,_that.codeFontFamily,_that.codeFontHeight,_that.cursorColor,_that.selectionColor,_that.cursorLineColor,_that.codeTheme,_that.lineNumberBackgroundColor,_that.lineNumberTextColor,_that.lineNumberFocusedTextColor,_that.separatorColor,_that.chunkIndicatorWidth,_that.errorBarBackgroundColor,_that.errorBarTextColor,_that.codePadding);case _:
  return null;

}
}

}

/// @nodoc


class _EditorPanelStyle implements EditorPanelStyle {
  const _EditorPanelStyle({this.toolbarBackgroundColor = const Color(0xFFF6F8FA), this.toolbarTitleColor = const Color(0xFF6A737D), this.toolbarIconColor = const Color(0xFF6A737D), this.codeBackgroundColor = const Color(0xFFFFFFFF), this.codeTextColor = const Color(0xFF24292E), this.codeFontSize = 13.0, this.codeFontFamily = 'monospace', this.codeFontHeight = 1.6, this.cursorColor = const Color(0xFF0366D6), this.selectionColor = const Color(0x440366D6), this.cursorLineColor = const Color(0x0C000000), this.codeTheme, this.lineNumberBackgroundColor = const Color(0xFFF6F8FA), this.lineNumberTextColor = const Color(0xFFBEC4CB), this.lineNumberFocusedTextColor = const Color(0xFF6A737D), this.separatorColor = const Color(0xFFE1E4E8), this.chunkIndicatorWidth = 20.0, this.errorBarBackgroundColor = const Color(0xFFFFF5F5), this.errorBarTextColor = const Color(0xFFCB2431), this.codePadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16)});
  

/// 상단 툴바 배경색.
@override@JsonKey() final  Color toolbarBackgroundColor;
/// 툴바의 'JSON' 레이블 텍스트 색.
@override@JsonKey() final  Color toolbarTitleColor;
/// 툴바 아이콘 색.
@override@JsonKey() final  Color toolbarIconColor;
/// 코드 에디터 배경색.
@override@JsonKey() final  Color codeBackgroundColor;
/// 기본 코드 텍스트 색.
@override@JsonKey() final  Color codeTextColor;
/// 코드 폰트 크기(pt).
@override@JsonKey() final  double codeFontSize;
/// 코드 폰트 패밀리.
@override@JsonKey() final  String codeFontFamily;
/// 코드 줄 높이(line height).
@override@JsonKey() final  double codeFontHeight;
/// 커서 색.
@override@JsonKey() final  Color cursorColor;
/// 텍스트 선택 배경색.
@override@JsonKey() final  Color selectionColor;
/// 현재 커서가 위치한 줄의 하이라이트 색.
@override@JsonKey() final  Color cursorLineColor;
/// 문법 강조 테마. null이면 기본 atom-one-light 적용.
@override final  CodeHighlightTheme? codeTheme;
/// 라인 번호 영역 배경색.
@override@JsonKey() final  Color lineNumberBackgroundColor;
/// 비활성 라인 번호 텍스트 색.
@override@JsonKey() final  Color lineNumberTextColor;
/// 커서가 위치한 줄의 활성 라인 번호 텍스트 색.
@override@JsonKey() final  Color lineNumberFocusedTextColor;
/// 라인 번호 영역과 코드 영역 사이 구분선 색.
@override@JsonKey() final  Color separatorColor;
/// 코드 접기(fold) 화살표 영역 너비(px).
@override@JsonKey() final  double chunkIndicatorWidth;
/// 파싱 오류 발생 시 하단에 표시되는 오류 바 배경색.
@override@JsonKey() final  Color errorBarBackgroundColor;
/// 오류 바에 표시되는 텍스트 색.
@override@JsonKey() final  Color errorBarTextColor;
/// 코드 영역 내부 패딩.
@override@JsonKey() final  EdgeInsets codePadding;

/// Create a copy of EditorPanelStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditorPanelStyleCopyWith<_EditorPanelStyle> get copyWith => __$EditorPanelStyleCopyWithImpl<_EditorPanelStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditorPanelStyle&&(identical(other.toolbarBackgroundColor, toolbarBackgroundColor) || other.toolbarBackgroundColor == toolbarBackgroundColor)&&(identical(other.toolbarTitleColor, toolbarTitleColor) || other.toolbarTitleColor == toolbarTitleColor)&&(identical(other.toolbarIconColor, toolbarIconColor) || other.toolbarIconColor == toolbarIconColor)&&(identical(other.codeBackgroundColor, codeBackgroundColor) || other.codeBackgroundColor == codeBackgroundColor)&&(identical(other.codeTextColor, codeTextColor) || other.codeTextColor == codeTextColor)&&(identical(other.codeFontSize, codeFontSize) || other.codeFontSize == codeFontSize)&&(identical(other.codeFontFamily, codeFontFamily) || other.codeFontFamily == codeFontFamily)&&(identical(other.codeFontHeight, codeFontHeight) || other.codeFontHeight == codeFontHeight)&&(identical(other.cursorColor, cursorColor) || other.cursorColor == cursorColor)&&(identical(other.selectionColor, selectionColor) || other.selectionColor == selectionColor)&&(identical(other.cursorLineColor, cursorLineColor) || other.cursorLineColor == cursorLineColor)&&(identical(other.codeTheme, codeTheme) || other.codeTheme == codeTheme)&&(identical(other.lineNumberBackgroundColor, lineNumberBackgroundColor) || other.lineNumberBackgroundColor == lineNumberBackgroundColor)&&(identical(other.lineNumberTextColor, lineNumberTextColor) || other.lineNumberTextColor == lineNumberTextColor)&&(identical(other.lineNumberFocusedTextColor, lineNumberFocusedTextColor) || other.lineNumberFocusedTextColor == lineNumberFocusedTextColor)&&(identical(other.separatorColor, separatorColor) || other.separatorColor == separatorColor)&&(identical(other.chunkIndicatorWidth, chunkIndicatorWidth) || other.chunkIndicatorWidth == chunkIndicatorWidth)&&(identical(other.errorBarBackgroundColor, errorBarBackgroundColor) || other.errorBarBackgroundColor == errorBarBackgroundColor)&&(identical(other.errorBarTextColor, errorBarTextColor) || other.errorBarTextColor == errorBarTextColor)&&(identical(other.codePadding, codePadding) || other.codePadding == codePadding));
}


@override
int get hashCode => Object.hashAll([runtimeType,toolbarBackgroundColor,toolbarTitleColor,toolbarIconColor,codeBackgroundColor,codeTextColor,codeFontSize,codeFontFamily,codeFontHeight,cursorColor,selectionColor,cursorLineColor,codeTheme,lineNumberBackgroundColor,lineNumberTextColor,lineNumberFocusedTextColor,separatorColor,chunkIndicatorWidth,errorBarBackgroundColor,errorBarTextColor,codePadding]);

@override
String toString() {
  return 'EditorPanelStyle(toolbarBackgroundColor: $toolbarBackgroundColor, toolbarTitleColor: $toolbarTitleColor, toolbarIconColor: $toolbarIconColor, codeBackgroundColor: $codeBackgroundColor, codeTextColor: $codeTextColor, codeFontSize: $codeFontSize, codeFontFamily: $codeFontFamily, codeFontHeight: $codeFontHeight, cursorColor: $cursorColor, selectionColor: $selectionColor, cursorLineColor: $cursorLineColor, codeTheme: $codeTheme, lineNumberBackgroundColor: $lineNumberBackgroundColor, lineNumberTextColor: $lineNumberTextColor, lineNumberFocusedTextColor: $lineNumberFocusedTextColor, separatorColor: $separatorColor, chunkIndicatorWidth: $chunkIndicatorWidth, errorBarBackgroundColor: $errorBarBackgroundColor, errorBarTextColor: $errorBarTextColor, codePadding: $codePadding)';
}


}

/// @nodoc
abstract mixin class _$EditorPanelStyleCopyWith<$Res> implements $EditorPanelStyleCopyWith<$Res> {
  factory _$EditorPanelStyleCopyWith(_EditorPanelStyle value, $Res Function(_EditorPanelStyle) _then) = __$EditorPanelStyleCopyWithImpl;
@override @useResult
$Res call({
 Color toolbarBackgroundColor, Color toolbarTitleColor, Color toolbarIconColor, Color codeBackgroundColor, Color codeTextColor, double codeFontSize, String codeFontFamily, double codeFontHeight, Color cursorColor, Color selectionColor, Color cursorLineColor, CodeHighlightTheme? codeTheme, Color lineNumberBackgroundColor, Color lineNumberTextColor, Color lineNumberFocusedTextColor, Color separatorColor, double chunkIndicatorWidth, Color errorBarBackgroundColor, Color errorBarTextColor, EdgeInsets codePadding
});




}
/// @nodoc
class __$EditorPanelStyleCopyWithImpl<$Res>
    implements _$EditorPanelStyleCopyWith<$Res> {
  __$EditorPanelStyleCopyWithImpl(this._self, this._then);

  final _EditorPanelStyle _self;
  final $Res Function(_EditorPanelStyle) _then;

/// Create a copy of EditorPanelStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? toolbarBackgroundColor = null,Object? toolbarTitleColor = null,Object? toolbarIconColor = null,Object? codeBackgroundColor = null,Object? codeTextColor = null,Object? codeFontSize = null,Object? codeFontFamily = null,Object? codeFontHeight = null,Object? cursorColor = null,Object? selectionColor = null,Object? cursorLineColor = null,Object? codeTheme = freezed,Object? lineNumberBackgroundColor = null,Object? lineNumberTextColor = null,Object? lineNumberFocusedTextColor = null,Object? separatorColor = null,Object? chunkIndicatorWidth = null,Object? errorBarBackgroundColor = null,Object? errorBarTextColor = null,Object? codePadding = null,}) {
  return _then(_EditorPanelStyle(
toolbarBackgroundColor: null == toolbarBackgroundColor ? _self.toolbarBackgroundColor : toolbarBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,toolbarTitleColor: null == toolbarTitleColor ? _self.toolbarTitleColor : toolbarTitleColor // ignore: cast_nullable_to_non_nullable
as Color,toolbarIconColor: null == toolbarIconColor ? _self.toolbarIconColor : toolbarIconColor // ignore: cast_nullable_to_non_nullable
as Color,codeBackgroundColor: null == codeBackgroundColor ? _self.codeBackgroundColor : codeBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,codeTextColor: null == codeTextColor ? _self.codeTextColor : codeTextColor // ignore: cast_nullable_to_non_nullable
as Color,codeFontSize: null == codeFontSize ? _self.codeFontSize : codeFontSize // ignore: cast_nullable_to_non_nullable
as double,codeFontFamily: null == codeFontFamily ? _self.codeFontFamily : codeFontFamily // ignore: cast_nullable_to_non_nullable
as String,codeFontHeight: null == codeFontHeight ? _self.codeFontHeight : codeFontHeight // ignore: cast_nullable_to_non_nullable
as double,cursorColor: null == cursorColor ? _self.cursorColor : cursorColor // ignore: cast_nullable_to_non_nullable
as Color,selectionColor: null == selectionColor ? _self.selectionColor : selectionColor // ignore: cast_nullable_to_non_nullable
as Color,cursorLineColor: null == cursorLineColor ? _self.cursorLineColor : cursorLineColor // ignore: cast_nullable_to_non_nullable
as Color,codeTheme: freezed == codeTheme ? _self.codeTheme : codeTheme // ignore: cast_nullable_to_non_nullable
as CodeHighlightTheme?,lineNumberBackgroundColor: null == lineNumberBackgroundColor ? _self.lineNumberBackgroundColor : lineNumberBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,lineNumberTextColor: null == lineNumberTextColor ? _self.lineNumberTextColor : lineNumberTextColor // ignore: cast_nullable_to_non_nullable
as Color,lineNumberFocusedTextColor: null == lineNumberFocusedTextColor ? _self.lineNumberFocusedTextColor : lineNumberFocusedTextColor // ignore: cast_nullable_to_non_nullable
as Color,separatorColor: null == separatorColor ? _self.separatorColor : separatorColor // ignore: cast_nullable_to_non_nullable
as Color,chunkIndicatorWidth: null == chunkIndicatorWidth ? _self.chunkIndicatorWidth : chunkIndicatorWidth // ignore: cast_nullable_to_non_nullable
as double,errorBarBackgroundColor: null == errorBarBackgroundColor ? _self.errorBarBackgroundColor : errorBarBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,errorBarTextColor: null == errorBarTextColor ? _self.errorBarTextColor : errorBarTextColor // ignore: cast_nullable_to_non_nullable
as Color,codePadding: null == codePadding ? _self.codePadding : codePadding // ignore: cast_nullable_to_non_nullable
as EdgeInsets,
  ));
}


}

// dart format on
