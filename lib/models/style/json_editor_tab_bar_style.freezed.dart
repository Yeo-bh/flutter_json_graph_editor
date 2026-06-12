// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_editor_tab_bar_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JsonEditorTabBarStyle {

/// 탭 바 배경색.
 Color get backgroundColor;/// 활성 탭 배경색.
 Color get activeTabColor;/// 비활성 탭 배경색.
 Color get inactiveTabColor;/// 활성 탭 그림자 색.
 Color get activeTabShadowColor;/// 활성 탭 텍스트 색.
 Color get activeTextColor;/// 비활성 탭 텍스트 색.
 Color get inactiveTextColor;/// 활성 탭 닫기(X) 아이콘 색.
 Color get activeCloseIconColor;/// 비활성 탭 닫기(X) 아이콘 색.
 Color get inactiveCloseIconColor;/// 새 탭(+) 아이콘 색.
 Color get addIconColor;
/// Create a copy of JsonEditorTabBarStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonEditorTabBarStyleCopyWith<JsonEditorTabBarStyle> get copyWith => _$JsonEditorTabBarStyleCopyWithImpl<JsonEditorTabBarStyle>(this as JsonEditorTabBarStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonEditorTabBarStyle&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.activeTabColor, activeTabColor) || other.activeTabColor == activeTabColor)&&(identical(other.inactiveTabColor, inactiveTabColor) || other.inactiveTabColor == inactiveTabColor)&&(identical(other.activeTabShadowColor, activeTabShadowColor) || other.activeTabShadowColor == activeTabShadowColor)&&(identical(other.activeTextColor, activeTextColor) || other.activeTextColor == activeTextColor)&&(identical(other.inactiveTextColor, inactiveTextColor) || other.inactiveTextColor == inactiveTextColor)&&(identical(other.activeCloseIconColor, activeCloseIconColor) || other.activeCloseIconColor == activeCloseIconColor)&&(identical(other.inactiveCloseIconColor, inactiveCloseIconColor) || other.inactiveCloseIconColor == inactiveCloseIconColor)&&(identical(other.addIconColor, addIconColor) || other.addIconColor == addIconColor));
}


@override
int get hashCode => Object.hash(runtimeType,backgroundColor,activeTabColor,inactiveTabColor,activeTabShadowColor,activeTextColor,inactiveTextColor,activeCloseIconColor,inactiveCloseIconColor,addIconColor);

@override
String toString() {
  return 'JsonEditorTabBarStyle(backgroundColor: $backgroundColor, activeTabColor: $activeTabColor, inactiveTabColor: $inactiveTabColor, activeTabShadowColor: $activeTabShadowColor, activeTextColor: $activeTextColor, inactiveTextColor: $inactiveTextColor, activeCloseIconColor: $activeCloseIconColor, inactiveCloseIconColor: $inactiveCloseIconColor, addIconColor: $addIconColor)';
}


}

/// @nodoc
abstract mixin class $JsonEditorTabBarStyleCopyWith<$Res>  {
  factory $JsonEditorTabBarStyleCopyWith(JsonEditorTabBarStyle value, $Res Function(JsonEditorTabBarStyle) _then) = _$JsonEditorTabBarStyleCopyWithImpl;
@useResult
$Res call({
 Color backgroundColor, Color activeTabColor, Color inactiveTabColor, Color activeTabShadowColor, Color activeTextColor, Color inactiveTextColor, Color activeCloseIconColor, Color inactiveCloseIconColor, Color addIconColor
});




}
/// @nodoc
class _$JsonEditorTabBarStyleCopyWithImpl<$Res>
    implements $JsonEditorTabBarStyleCopyWith<$Res> {
  _$JsonEditorTabBarStyleCopyWithImpl(this._self, this._then);

  final JsonEditorTabBarStyle _self;
  final $Res Function(JsonEditorTabBarStyle) _then;

/// Create a copy of JsonEditorTabBarStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backgroundColor = null,Object? activeTabColor = null,Object? inactiveTabColor = null,Object? activeTabShadowColor = null,Object? activeTextColor = null,Object? inactiveTextColor = null,Object? activeCloseIconColor = null,Object? inactiveCloseIconColor = null,Object? addIconColor = null,}) {
  return _then(_self.copyWith(
backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,activeTabColor: null == activeTabColor ? _self.activeTabColor : activeTabColor // ignore: cast_nullable_to_non_nullable
as Color,inactiveTabColor: null == inactiveTabColor ? _self.inactiveTabColor : inactiveTabColor // ignore: cast_nullable_to_non_nullable
as Color,activeTabShadowColor: null == activeTabShadowColor ? _self.activeTabShadowColor : activeTabShadowColor // ignore: cast_nullable_to_non_nullable
as Color,activeTextColor: null == activeTextColor ? _self.activeTextColor : activeTextColor // ignore: cast_nullable_to_non_nullable
as Color,inactiveTextColor: null == inactiveTextColor ? _self.inactiveTextColor : inactiveTextColor // ignore: cast_nullable_to_non_nullable
as Color,activeCloseIconColor: null == activeCloseIconColor ? _self.activeCloseIconColor : activeCloseIconColor // ignore: cast_nullable_to_non_nullable
as Color,inactiveCloseIconColor: null == inactiveCloseIconColor ? _self.inactiveCloseIconColor : inactiveCloseIconColor // ignore: cast_nullable_to_non_nullable
as Color,addIconColor: null == addIconColor ? _self.addIconColor : addIconColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [JsonEditorTabBarStyle].
extension JsonEditorTabBarStylePatterns on JsonEditorTabBarStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JsonEditorTabBarStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JsonEditorTabBarStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JsonEditorTabBarStyle value)  $default,){
final _that = this;
switch (_that) {
case _JsonEditorTabBarStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JsonEditorTabBarStyle value)?  $default,){
final _that = this;
switch (_that) {
case _JsonEditorTabBarStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color backgroundColor,  Color activeTabColor,  Color inactiveTabColor,  Color activeTabShadowColor,  Color activeTextColor,  Color inactiveTextColor,  Color activeCloseIconColor,  Color inactiveCloseIconColor,  Color addIconColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JsonEditorTabBarStyle() when $default != null:
return $default(_that.backgroundColor,_that.activeTabColor,_that.inactiveTabColor,_that.activeTabShadowColor,_that.activeTextColor,_that.inactiveTextColor,_that.activeCloseIconColor,_that.inactiveCloseIconColor,_that.addIconColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color backgroundColor,  Color activeTabColor,  Color inactiveTabColor,  Color activeTabShadowColor,  Color activeTextColor,  Color inactiveTextColor,  Color activeCloseIconColor,  Color inactiveCloseIconColor,  Color addIconColor)  $default,) {final _that = this;
switch (_that) {
case _JsonEditorTabBarStyle():
return $default(_that.backgroundColor,_that.activeTabColor,_that.inactiveTabColor,_that.activeTabShadowColor,_that.activeTextColor,_that.inactiveTextColor,_that.activeCloseIconColor,_that.inactiveCloseIconColor,_that.addIconColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color backgroundColor,  Color activeTabColor,  Color inactiveTabColor,  Color activeTabShadowColor,  Color activeTextColor,  Color inactiveTextColor,  Color activeCloseIconColor,  Color inactiveCloseIconColor,  Color addIconColor)?  $default,) {final _that = this;
switch (_that) {
case _JsonEditorTabBarStyle() when $default != null:
return $default(_that.backgroundColor,_that.activeTabColor,_that.inactiveTabColor,_that.activeTabShadowColor,_that.activeTextColor,_that.inactiveTextColor,_that.activeCloseIconColor,_that.inactiveCloseIconColor,_that.addIconColor);case _:
  return null;

}
}

}

/// @nodoc


class _JsonEditorTabBarStyle implements JsonEditorTabBarStyle {
  const _JsonEditorTabBarStyle({this.backgroundColor = const Color(0xFFF0F0F0), this.activeTabColor = const Color(0xFFFFFFFF), this.inactiveTabColor = const Color(0xFFE0E0E0), this.activeTabShadowColor = const Color(0x14000000), this.activeTextColor = const Color(0xFF1A1A1A), this.inactiveTextColor = const Color(0xFF666666), this.activeCloseIconColor = const Color(0xFF666666), this.inactiveCloseIconColor = const Color(0xFF999999), this.addIconColor = const Color(0xFF666666)});
  

/// 탭 바 배경색.
@override@JsonKey() final  Color backgroundColor;
/// 활성 탭 배경색.
@override@JsonKey() final  Color activeTabColor;
/// 비활성 탭 배경색.
@override@JsonKey() final  Color inactiveTabColor;
/// 활성 탭 그림자 색.
@override@JsonKey() final  Color activeTabShadowColor;
/// 활성 탭 텍스트 색.
@override@JsonKey() final  Color activeTextColor;
/// 비활성 탭 텍스트 색.
@override@JsonKey() final  Color inactiveTextColor;
/// 활성 탭 닫기(X) 아이콘 색.
@override@JsonKey() final  Color activeCloseIconColor;
/// 비활성 탭 닫기(X) 아이콘 색.
@override@JsonKey() final  Color inactiveCloseIconColor;
/// 새 탭(+) 아이콘 색.
@override@JsonKey() final  Color addIconColor;

/// Create a copy of JsonEditorTabBarStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonEditorTabBarStyleCopyWith<_JsonEditorTabBarStyle> get copyWith => __$JsonEditorTabBarStyleCopyWithImpl<_JsonEditorTabBarStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonEditorTabBarStyle&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.activeTabColor, activeTabColor) || other.activeTabColor == activeTabColor)&&(identical(other.inactiveTabColor, inactiveTabColor) || other.inactiveTabColor == inactiveTabColor)&&(identical(other.activeTabShadowColor, activeTabShadowColor) || other.activeTabShadowColor == activeTabShadowColor)&&(identical(other.activeTextColor, activeTextColor) || other.activeTextColor == activeTextColor)&&(identical(other.inactiveTextColor, inactiveTextColor) || other.inactiveTextColor == inactiveTextColor)&&(identical(other.activeCloseIconColor, activeCloseIconColor) || other.activeCloseIconColor == activeCloseIconColor)&&(identical(other.inactiveCloseIconColor, inactiveCloseIconColor) || other.inactiveCloseIconColor == inactiveCloseIconColor)&&(identical(other.addIconColor, addIconColor) || other.addIconColor == addIconColor));
}


@override
int get hashCode => Object.hash(runtimeType,backgroundColor,activeTabColor,inactiveTabColor,activeTabShadowColor,activeTextColor,inactiveTextColor,activeCloseIconColor,inactiveCloseIconColor,addIconColor);

@override
String toString() {
  return 'JsonEditorTabBarStyle(backgroundColor: $backgroundColor, activeTabColor: $activeTabColor, inactiveTabColor: $inactiveTabColor, activeTabShadowColor: $activeTabShadowColor, activeTextColor: $activeTextColor, inactiveTextColor: $inactiveTextColor, activeCloseIconColor: $activeCloseIconColor, inactiveCloseIconColor: $inactiveCloseIconColor, addIconColor: $addIconColor)';
}


}

/// @nodoc
abstract mixin class _$JsonEditorTabBarStyleCopyWith<$Res> implements $JsonEditorTabBarStyleCopyWith<$Res> {
  factory _$JsonEditorTabBarStyleCopyWith(_JsonEditorTabBarStyle value, $Res Function(_JsonEditorTabBarStyle) _then) = __$JsonEditorTabBarStyleCopyWithImpl;
@override @useResult
$Res call({
 Color backgroundColor, Color activeTabColor, Color inactiveTabColor, Color activeTabShadowColor, Color activeTextColor, Color inactiveTextColor, Color activeCloseIconColor, Color inactiveCloseIconColor, Color addIconColor
});




}
/// @nodoc
class __$JsonEditorTabBarStyleCopyWithImpl<$Res>
    implements _$JsonEditorTabBarStyleCopyWith<$Res> {
  __$JsonEditorTabBarStyleCopyWithImpl(this._self, this._then);

  final _JsonEditorTabBarStyle _self;
  final $Res Function(_JsonEditorTabBarStyle) _then;

/// Create a copy of JsonEditorTabBarStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backgroundColor = null,Object? activeTabColor = null,Object? inactiveTabColor = null,Object? activeTabShadowColor = null,Object? activeTextColor = null,Object? inactiveTextColor = null,Object? activeCloseIconColor = null,Object? inactiveCloseIconColor = null,Object? addIconColor = null,}) {
  return _then(_JsonEditorTabBarStyle(
backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,activeTabColor: null == activeTabColor ? _self.activeTabColor : activeTabColor // ignore: cast_nullable_to_non_nullable
as Color,inactiveTabColor: null == inactiveTabColor ? _self.inactiveTabColor : inactiveTabColor // ignore: cast_nullable_to_non_nullable
as Color,activeTabShadowColor: null == activeTabShadowColor ? _self.activeTabShadowColor : activeTabShadowColor // ignore: cast_nullable_to_non_nullable
as Color,activeTextColor: null == activeTextColor ? _self.activeTextColor : activeTextColor // ignore: cast_nullable_to_non_nullable
as Color,inactiveTextColor: null == inactiveTextColor ? _self.inactiveTextColor : inactiveTextColor // ignore: cast_nullable_to_non_nullable
as Color,activeCloseIconColor: null == activeCloseIconColor ? _self.activeCloseIconColor : activeCloseIconColor // ignore: cast_nullable_to_non_nullable
as Color,inactiveCloseIconColor: null == inactiveCloseIconColor ? _self.inactiveCloseIconColor : inactiveCloseIconColor // ignore: cast_nullable_to_non_nullable
as Color,addIconColor: null == addIconColor ? _self.addIconColor : addIconColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
