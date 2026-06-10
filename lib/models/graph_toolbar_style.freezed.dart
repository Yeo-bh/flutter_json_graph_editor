// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_toolbar_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphToolbarStyle {

/// 툴바 배경색.
 Color get backgroundColor;/// 툴바 그림자 색.
 Color get shadowColor;/// 그림자 번짐(px).
 double get shadowBlurRadius;/// 그림자 오프셋.
 Offset get shadowOffset;/// 버튼 그룹 사이 구분선 색.
 Color get dividerColor;/// 툴바 아이콘 색.
 Color get iconColor;/// 아이콘 크기(px).
 double get iconSize;/// 버튼 내부 패딩(px).
 double get buttonPadding;/// 툴바 컨테이너의 모서리 둥글기(px).
 double get borderRadius;/// 툴바 컨테이너 내부 패딩.
 EdgeInsets get containerPadding;/// 구분선 높이(px).
 double get dividerHeight;/// 구분선 좌우 마진(px).
 double get dividerMarginHorizontal;
/// Create a copy of GraphToolbarStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphToolbarStyleCopyWith<GraphToolbarStyle> get copyWith => _$GraphToolbarStyleCopyWithImpl<GraphToolbarStyle>(this as GraphToolbarStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphToolbarStyle&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.shadowColor, shadowColor) || other.shadowColor == shadowColor)&&(identical(other.shadowBlurRadius, shadowBlurRadius) || other.shadowBlurRadius == shadowBlurRadius)&&(identical(other.shadowOffset, shadowOffset) || other.shadowOffset == shadowOffset)&&(identical(other.dividerColor, dividerColor) || other.dividerColor == dividerColor)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.iconSize, iconSize) || other.iconSize == iconSize)&&(identical(other.buttonPadding, buttonPadding) || other.buttonPadding == buttonPadding)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.containerPadding, containerPadding) || other.containerPadding == containerPadding)&&(identical(other.dividerHeight, dividerHeight) || other.dividerHeight == dividerHeight)&&(identical(other.dividerMarginHorizontal, dividerMarginHorizontal) || other.dividerMarginHorizontal == dividerMarginHorizontal));
}


@override
int get hashCode => Object.hash(runtimeType,backgroundColor,shadowColor,shadowBlurRadius,shadowOffset,dividerColor,iconColor,iconSize,buttonPadding,borderRadius,containerPadding,dividerHeight,dividerMarginHorizontal);

@override
String toString() {
  return 'GraphToolbarStyle(backgroundColor: $backgroundColor, shadowColor: $shadowColor, shadowBlurRadius: $shadowBlurRadius, shadowOffset: $shadowOffset, dividerColor: $dividerColor, iconColor: $iconColor, iconSize: $iconSize, buttonPadding: $buttonPadding, borderRadius: $borderRadius, containerPadding: $containerPadding, dividerHeight: $dividerHeight, dividerMarginHorizontal: $dividerMarginHorizontal)';
}


}

/// @nodoc
abstract mixin class $GraphToolbarStyleCopyWith<$Res>  {
  factory $GraphToolbarStyleCopyWith(GraphToolbarStyle value, $Res Function(GraphToolbarStyle) _then) = _$GraphToolbarStyleCopyWithImpl;
@useResult
$Res call({
 Color backgroundColor, Color shadowColor, double shadowBlurRadius, Offset shadowOffset, Color dividerColor, Color iconColor, double iconSize, double buttonPadding, double borderRadius, EdgeInsets containerPadding, double dividerHeight, double dividerMarginHorizontal
});




}
/// @nodoc
class _$GraphToolbarStyleCopyWithImpl<$Res>
    implements $GraphToolbarStyleCopyWith<$Res> {
  _$GraphToolbarStyleCopyWithImpl(this._self, this._then);

  final GraphToolbarStyle _self;
  final $Res Function(GraphToolbarStyle) _then;

/// Create a copy of GraphToolbarStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backgroundColor = null,Object? shadowColor = null,Object? shadowBlurRadius = null,Object? shadowOffset = null,Object? dividerColor = null,Object? iconColor = null,Object? iconSize = null,Object? buttonPadding = null,Object? borderRadius = null,Object? containerPadding = null,Object? dividerHeight = null,Object? dividerMarginHorizontal = null,}) {
  return _then(_self.copyWith(
backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,shadowColor: null == shadowColor ? _self.shadowColor : shadowColor // ignore: cast_nullable_to_non_nullable
as Color,shadowBlurRadius: null == shadowBlurRadius ? _self.shadowBlurRadius : shadowBlurRadius // ignore: cast_nullable_to_non_nullable
as double,shadowOffset: null == shadowOffset ? _self.shadowOffset : shadowOffset // ignore: cast_nullable_to_non_nullable
as Offset,dividerColor: null == dividerColor ? _self.dividerColor : dividerColor // ignore: cast_nullable_to_non_nullable
as Color,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as Color,iconSize: null == iconSize ? _self.iconSize : iconSize // ignore: cast_nullable_to_non_nullable
as double,buttonPadding: null == buttonPadding ? _self.buttonPadding : buttonPadding // ignore: cast_nullable_to_non_nullable
as double,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,containerPadding: null == containerPadding ? _self.containerPadding : containerPadding // ignore: cast_nullable_to_non_nullable
as EdgeInsets,dividerHeight: null == dividerHeight ? _self.dividerHeight : dividerHeight // ignore: cast_nullable_to_non_nullable
as double,dividerMarginHorizontal: null == dividerMarginHorizontal ? _self.dividerMarginHorizontal : dividerMarginHorizontal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphToolbarStyle].
extension GraphToolbarStylePatterns on GraphToolbarStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphToolbarStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphToolbarStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphToolbarStyle value)  $default,){
final _that = this;
switch (_that) {
case _GraphToolbarStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphToolbarStyle value)?  $default,){
final _that = this;
switch (_that) {
case _GraphToolbarStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color backgroundColor,  Color shadowColor,  double shadowBlurRadius,  Offset shadowOffset,  Color dividerColor,  Color iconColor,  double iconSize,  double buttonPadding,  double borderRadius,  EdgeInsets containerPadding,  double dividerHeight,  double dividerMarginHorizontal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphToolbarStyle() when $default != null:
return $default(_that.backgroundColor,_that.shadowColor,_that.shadowBlurRadius,_that.shadowOffset,_that.dividerColor,_that.iconColor,_that.iconSize,_that.buttonPadding,_that.borderRadius,_that.containerPadding,_that.dividerHeight,_that.dividerMarginHorizontal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color backgroundColor,  Color shadowColor,  double shadowBlurRadius,  Offset shadowOffset,  Color dividerColor,  Color iconColor,  double iconSize,  double buttonPadding,  double borderRadius,  EdgeInsets containerPadding,  double dividerHeight,  double dividerMarginHorizontal)  $default,) {final _that = this;
switch (_that) {
case _GraphToolbarStyle():
return $default(_that.backgroundColor,_that.shadowColor,_that.shadowBlurRadius,_that.shadowOffset,_that.dividerColor,_that.iconColor,_that.iconSize,_that.buttonPadding,_that.borderRadius,_that.containerPadding,_that.dividerHeight,_that.dividerMarginHorizontal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color backgroundColor,  Color shadowColor,  double shadowBlurRadius,  Offset shadowOffset,  Color dividerColor,  Color iconColor,  double iconSize,  double buttonPadding,  double borderRadius,  EdgeInsets containerPadding,  double dividerHeight,  double dividerMarginHorizontal)?  $default,) {final _that = this;
switch (_that) {
case _GraphToolbarStyle() when $default != null:
return $default(_that.backgroundColor,_that.shadowColor,_that.shadowBlurRadius,_that.shadowOffset,_that.dividerColor,_that.iconColor,_that.iconSize,_that.buttonPadding,_that.borderRadius,_that.containerPadding,_that.dividerHeight,_that.dividerMarginHorizontal);case _:
  return null;

}
}

}

/// @nodoc


class _GraphToolbarStyle implements GraphToolbarStyle {
  const _GraphToolbarStyle({this.backgroundColor = Colors.white, this.shadowColor = const Color(0x1F000000), this.shadowBlurRadius = 8.0, this.shadowOffset = const Offset(0, 2), this.dividerColor = const Color(0xFFE1E4E8), this.iconColor = const Color(0xFF57606A), this.iconSize = 18.0, this.buttonPadding = 8.0, this.borderRadius = 24.0, this.containerPadding = const EdgeInsets.symmetric(horizontal: 6, vertical: 4), this.dividerHeight = 18.0, this.dividerMarginHorizontal = 2.0});
  

/// 툴바 배경색.
@override@JsonKey() final  Color backgroundColor;
/// 툴바 그림자 색.
@override@JsonKey() final  Color shadowColor;
/// 그림자 번짐(px).
@override@JsonKey() final  double shadowBlurRadius;
/// 그림자 오프셋.
@override@JsonKey() final  Offset shadowOffset;
/// 버튼 그룹 사이 구분선 색.
@override@JsonKey() final  Color dividerColor;
/// 툴바 아이콘 색.
@override@JsonKey() final  Color iconColor;
/// 아이콘 크기(px).
@override@JsonKey() final  double iconSize;
/// 버튼 내부 패딩(px).
@override@JsonKey() final  double buttonPadding;
/// 툴바 컨테이너의 모서리 둥글기(px).
@override@JsonKey() final  double borderRadius;
/// 툴바 컨테이너 내부 패딩.
@override@JsonKey() final  EdgeInsets containerPadding;
/// 구분선 높이(px).
@override@JsonKey() final  double dividerHeight;
/// 구분선 좌우 마진(px).
@override@JsonKey() final  double dividerMarginHorizontal;

/// Create a copy of GraphToolbarStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphToolbarStyleCopyWith<_GraphToolbarStyle> get copyWith => __$GraphToolbarStyleCopyWithImpl<_GraphToolbarStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphToolbarStyle&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.shadowColor, shadowColor) || other.shadowColor == shadowColor)&&(identical(other.shadowBlurRadius, shadowBlurRadius) || other.shadowBlurRadius == shadowBlurRadius)&&(identical(other.shadowOffset, shadowOffset) || other.shadowOffset == shadowOffset)&&(identical(other.dividerColor, dividerColor) || other.dividerColor == dividerColor)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.iconSize, iconSize) || other.iconSize == iconSize)&&(identical(other.buttonPadding, buttonPadding) || other.buttonPadding == buttonPadding)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.containerPadding, containerPadding) || other.containerPadding == containerPadding)&&(identical(other.dividerHeight, dividerHeight) || other.dividerHeight == dividerHeight)&&(identical(other.dividerMarginHorizontal, dividerMarginHorizontal) || other.dividerMarginHorizontal == dividerMarginHorizontal));
}


@override
int get hashCode => Object.hash(runtimeType,backgroundColor,shadowColor,shadowBlurRadius,shadowOffset,dividerColor,iconColor,iconSize,buttonPadding,borderRadius,containerPadding,dividerHeight,dividerMarginHorizontal);

@override
String toString() {
  return 'GraphToolbarStyle(backgroundColor: $backgroundColor, shadowColor: $shadowColor, shadowBlurRadius: $shadowBlurRadius, shadowOffset: $shadowOffset, dividerColor: $dividerColor, iconColor: $iconColor, iconSize: $iconSize, buttonPadding: $buttonPadding, borderRadius: $borderRadius, containerPadding: $containerPadding, dividerHeight: $dividerHeight, dividerMarginHorizontal: $dividerMarginHorizontal)';
}


}

/// @nodoc
abstract mixin class _$GraphToolbarStyleCopyWith<$Res> implements $GraphToolbarStyleCopyWith<$Res> {
  factory _$GraphToolbarStyleCopyWith(_GraphToolbarStyle value, $Res Function(_GraphToolbarStyle) _then) = __$GraphToolbarStyleCopyWithImpl;
@override @useResult
$Res call({
 Color backgroundColor, Color shadowColor, double shadowBlurRadius, Offset shadowOffset, Color dividerColor, Color iconColor, double iconSize, double buttonPadding, double borderRadius, EdgeInsets containerPadding, double dividerHeight, double dividerMarginHorizontal
});




}
/// @nodoc
class __$GraphToolbarStyleCopyWithImpl<$Res>
    implements _$GraphToolbarStyleCopyWith<$Res> {
  __$GraphToolbarStyleCopyWithImpl(this._self, this._then);

  final _GraphToolbarStyle _self;
  final $Res Function(_GraphToolbarStyle) _then;

/// Create a copy of GraphToolbarStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backgroundColor = null,Object? shadowColor = null,Object? shadowBlurRadius = null,Object? shadowOffset = null,Object? dividerColor = null,Object? iconColor = null,Object? iconSize = null,Object? buttonPadding = null,Object? borderRadius = null,Object? containerPadding = null,Object? dividerHeight = null,Object? dividerMarginHorizontal = null,}) {
  return _then(_GraphToolbarStyle(
backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,shadowColor: null == shadowColor ? _self.shadowColor : shadowColor // ignore: cast_nullable_to_non_nullable
as Color,shadowBlurRadius: null == shadowBlurRadius ? _self.shadowBlurRadius : shadowBlurRadius // ignore: cast_nullable_to_non_nullable
as double,shadowOffset: null == shadowOffset ? _self.shadowOffset : shadowOffset // ignore: cast_nullable_to_non_nullable
as Offset,dividerColor: null == dividerColor ? _self.dividerColor : dividerColor // ignore: cast_nullable_to_non_nullable
as Color,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as Color,iconSize: null == iconSize ? _self.iconSize : iconSize // ignore: cast_nullable_to_non_nullable
as double,buttonPadding: null == buttonPadding ? _self.buttonPadding : buttonPadding // ignore: cast_nullable_to_non_nullable
as double,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,containerPadding: null == containerPadding ? _self.containerPadding : containerPadding // ignore: cast_nullable_to_non_nullable
as EdgeInsets,dividerHeight: null == dividerHeight ? _self.dividerHeight : dividerHeight // ignore: cast_nullable_to_non_nullable
as double,dividerMarginHorizontal: null == dividerMarginHorizontal ? _self.dividerMarginHorizontal : dividerMarginHorizontal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
