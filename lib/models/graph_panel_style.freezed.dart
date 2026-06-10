// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_panel_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphPanelStyle {

/// 그래프 캔버스 배경색.
 Color get backgroundColor;/// 작은 격자선 색 (minorGridStep 간격으로 반복).
 Color get minorGridColor;/// 큰 격자선 색 (majorGridStep 간격으로 반복).
 Color get majorGridColor;/// 작은 격자 간격(px).
 double get minorGridStep;/// 큰 격자 간격(px).
 double get majorGridStep;/// 작은 격자선 두께(px).
 double get minorGridStrokeWidth;/// 큰 격자선 두께(px).
 double get majorGridStrokeWidth;/// JSON 없을 때 표시되는 안내 텍스트 색.
 Color get emptyStateTextColor;/// 안내 텍스트 크기(pt).
 double get emptyStateTextSize;/// 파싱 오류 텍스트 색.
 Color get errorTextColor;
/// Create a copy of GraphPanelStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphPanelStyleCopyWith<GraphPanelStyle> get copyWith => _$GraphPanelStyleCopyWithImpl<GraphPanelStyle>(this as GraphPanelStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphPanelStyle&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.minorGridColor, minorGridColor) || other.minorGridColor == minorGridColor)&&(identical(other.majorGridColor, majorGridColor) || other.majorGridColor == majorGridColor)&&(identical(other.minorGridStep, minorGridStep) || other.minorGridStep == minorGridStep)&&(identical(other.majorGridStep, majorGridStep) || other.majorGridStep == majorGridStep)&&(identical(other.minorGridStrokeWidth, minorGridStrokeWidth) || other.minorGridStrokeWidth == minorGridStrokeWidth)&&(identical(other.majorGridStrokeWidth, majorGridStrokeWidth) || other.majorGridStrokeWidth == majorGridStrokeWidth)&&(identical(other.emptyStateTextColor, emptyStateTextColor) || other.emptyStateTextColor == emptyStateTextColor)&&(identical(other.emptyStateTextSize, emptyStateTextSize) || other.emptyStateTextSize == emptyStateTextSize)&&(identical(other.errorTextColor, errorTextColor) || other.errorTextColor == errorTextColor));
}


@override
int get hashCode => Object.hash(runtimeType,backgroundColor,minorGridColor,majorGridColor,minorGridStep,majorGridStep,minorGridStrokeWidth,majorGridStrokeWidth,emptyStateTextColor,emptyStateTextSize,errorTextColor);

@override
String toString() {
  return 'GraphPanelStyle(backgroundColor: $backgroundColor, minorGridColor: $minorGridColor, majorGridColor: $majorGridColor, minorGridStep: $minorGridStep, majorGridStep: $majorGridStep, minorGridStrokeWidth: $minorGridStrokeWidth, majorGridStrokeWidth: $majorGridStrokeWidth, emptyStateTextColor: $emptyStateTextColor, emptyStateTextSize: $emptyStateTextSize, errorTextColor: $errorTextColor)';
}


}

/// @nodoc
abstract mixin class $GraphPanelStyleCopyWith<$Res>  {
  factory $GraphPanelStyleCopyWith(GraphPanelStyle value, $Res Function(GraphPanelStyle) _then) = _$GraphPanelStyleCopyWithImpl;
@useResult
$Res call({
 Color backgroundColor, Color minorGridColor, Color majorGridColor, double minorGridStep, double majorGridStep, double minorGridStrokeWidth, double majorGridStrokeWidth, Color emptyStateTextColor, double emptyStateTextSize, Color errorTextColor
});




}
/// @nodoc
class _$GraphPanelStyleCopyWithImpl<$Res>
    implements $GraphPanelStyleCopyWith<$Res> {
  _$GraphPanelStyleCopyWithImpl(this._self, this._then);

  final GraphPanelStyle _self;
  final $Res Function(GraphPanelStyle) _then;

/// Create a copy of GraphPanelStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backgroundColor = null,Object? minorGridColor = null,Object? majorGridColor = null,Object? minorGridStep = null,Object? majorGridStep = null,Object? minorGridStrokeWidth = null,Object? majorGridStrokeWidth = null,Object? emptyStateTextColor = null,Object? emptyStateTextSize = null,Object? errorTextColor = null,}) {
  return _then(_self.copyWith(
backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,minorGridColor: null == minorGridColor ? _self.minorGridColor : minorGridColor // ignore: cast_nullable_to_non_nullable
as Color,majorGridColor: null == majorGridColor ? _self.majorGridColor : majorGridColor // ignore: cast_nullable_to_non_nullable
as Color,minorGridStep: null == minorGridStep ? _self.minorGridStep : minorGridStep // ignore: cast_nullable_to_non_nullable
as double,majorGridStep: null == majorGridStep ? _self.majorGridStep : majorGridStep // ignore: cast_nullable_to_non_nullable
as double,minorGridStrokeWidth: null == minorGridStrokeWidth ? _self.minorGridStrokeWidth : minorGridStrokeWidth // ignore: cast_nullable_to_non_nullable
as double,majorGridStrokeWidth: null == majorGridStrokeWidth ? _self.majorGridStrokeWidth : majorGridStrokeWidth // ignore: cast_nullable_to_non_nullable
as double,emptyStateTextColor: null == emptyStateTextColor ? _self.emptyStateTextColor : emptyStateTextColor // ignore: cast_nullable_to_non_nullable
as Color,emptyStateTextSize: null == emptyStateTextSize ? _self.emptyStateTextSize : emptyStateTextSize // ignore: cast_nullable_to_non_nullable
as double,errorTextColor: null == errorTextColor ? _self.errorTextColor : errorTextColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphPanelStyle].
extension GraphPanelStylePatterns on GraphPanelStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphPanelStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphPanelStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphPanelStyle value)  $default,){
final _that = this;
switch (_that) {
case _GraphPanelStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphPanelStyle value)?  $default,){
final _that = this;
switch (_that) {
case _GraphPanelStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color backgroundColor,  Color minorGridColor,  Color majorGridColor,  double minorGridStep,  double majorGridStep,  double minorGridStrokeWidth,  double majorGridStrokeWidth,  Color emptyStateTextColor,  double emptyStateTextSize,  Color errorTextColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphPanelStyle() when $default != null:
return $default(_that.backgroundColor,_that.minorGridColor,_that.majorGridColor,_that.minorGridStep,_that.majorGridStep,_that.minorGridStrokeWidth,_that.majorGridStrokeWidth,_that.emptyStateTextColor,_that.emptyStateTextSize,_that.errorTextColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color backgroundColor,  Color minorGridColor,  Color majorGridColor,  double minorGridStep,  double majorGridStep,  double minorGridStrokeWidth,  double majorGridStrokeWidth,  Color emptyStateTextColor,  double emptyStateTextSize,  Color errorTextColor)  $default,) {final _that = this;
switch (_that) {
case _GraphPanelStyle():
return $default(_that.backgroundColor,_that.minorGridColor,_that.majorGridColor,_that.minorGridStep,_that.majorGridStep,_that.minorGridStrokeWidth,_that.majorGridStrokeWidth,_that.emptyStateTextColor,_that.emptyStateTextSize,_that.errorTextColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color backgroundColor,  Color minorGridColor,  Color majorGridColor,  double minorGridStep,  double majorGridStep,  double minorGridStrokeWidth,  double majorGridStrokeWidth,  Color emptyStateTextColor,  double emptyStateTextSize,  Color errorTextColor)?  $default,) {final _that = this;
switch (_that) {
case _GraphPanelStyle() when $default != null:
return $default(_that.backgroundColor,_that.minorGridColor,_that.majorGridColor,_that.minorGridStep,_that.majorGridStep,_that.minorGridStrokeWidth,_that.majorGridStrokeWidth,_that.emptyStateTextColor,_that.emptyStateTextSize,_that.errorTextColor);case _:
  return null;

}
}

}

/// @nodoc


class _GraphPanelStyle implements GraphPanelStyle {
  const _GraphPanelStyle({this.backgroundColor = const Color(0xFFFAFBFC), this.minorGridColor = const Color(0xFFEAEEF2), this.majorGridColor = const Color(0xFFD1D5DB), this.minorGridStep = 20.0, this.majorGridStep = 100.0, this.minorGridStrokeWidth = 0.6, this.majorGridStrokeWidth = 1.0, this.emptyStateTextColor = const Color(0xFF8B949E), this.emptyStateTextSize = 14.0, this.errorTextColor = const Color(0xFFCB2431)});
  

/// 그래프 캔버스 배경색.
@override@JsonKey() final  Color backgroundColor;
/// 작은 격자선 색 (minorGridStep 간격으로 반복).
@override@JsonKey() final  Color minorGridColor;
/// 큰 격자선 색 (majorGridStep 간격으로 반복).
@override@JsonKey() final  Color majorGridColor;
/// 작은 격자 간격(px).
@override@JsonKey() final  double minorGridStep;
/// 큰 격자 간격(px).
@override@JsonKey() final  double majorGridStep;
/// 작은 격자선 두께(px).
@override@JsonKey() final  double minorGridStrokeWidth;
/// 큰 격자선 두께(px).
@override@JsonKey() final  double majorGridStrokeWidth;
/// JSON 없을 때 표시되는 안내 텍스트 색.
@override@JsonKey() final  Color emptyStateTextColor;
/// 안내 텍스트 크기(pt).
@override@JsonKey() final  double emptyStateTextSize;
/// 파싱 오류 텍스트 색.
@override@JsonKey() final  Color errorTextColor;

/// Create a copy of GraphPanelStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphPanelStyleCopyWith<_GraphPanelStyle> get copyWith => __$GraphPanelStyleCopyWithImpl<_GraphPanelStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphPanelStyle&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.minorGridColor, minorGridColor) || other.minorGridColor == minorGridColor)&&(identical(other.majorGridColor, majorGridColor) || other.majorGridColor == majorGridColor)&&(identical(other.minorGridStep, minorGridStep) || other.minorGridStep == minorGridStep)&&(identical(other.majorGridStep, majorGridStep) || other.majorGridStep == majorGridStep)&&(identical(other.minorGridStrokeWidth, minorGridStrokeWidth) || other.minorGridStrokeWidth == minorGridStrokeWidth)&&(identical(other.majorGridStrokeWidth, majorGridStrokeWidth) || other.majorGridStrokeWidth == majorGridStrokeWidth)&&(identical(other.emptyStateTextColor, emptyStateTextColor) || other.emptyStateTextColor == emptyStateTextColor)&&(identical(other.emptyStateTextSize, emptyStateTextSize) || other.emptyStateTextSize == emptyStateTextSize)&&(identical(other.errorTextColor, errorTextColor) || other.errorTextColor == errorTextColor));
}


@override
int get hashCode => Object.hash(runtimeType,backgroundColor,minorGridColor,majorGridColor,minorGridStep,majorGridStep,minorGridStrokeWidth,majorGridStrokeWidth,emptyStateTextColor,emptyStateTextSize,errorTextColor);

@override
String toString() {
  return 'GraphPanelStyle(backgroundColor: $backgroundColor, minorGridColor: $minorGridColor, majorGridColor: $majorGridColor, minorGridStep: $minorGridStep, majorGridStep: $majorGridStep, minorGridStrokeWidth: $minorGridStrokeWidth, majorGridStrokeWidth: $majorGridStrokeWidth, emptyStateTextColor: $emptyStateTextColor, emptyStateTextSize: $emptyStateTextSize, errorTextColor: $errorTextColor)';
}


}

/// @nodoc
abstract mixin class _$GraphPanelStyleCopyWith<$Res> implements $GraphPanelStyleCopyWith<$Res> {
  factory _$GraphPanelStyleCopyWith(_GraphPanelStyle value, $Res Function(_GraphPanelStyle) _then) = __$GraphPanelStyleCopyWithImpl;
@override @useResult
$Res call({
 Color backgroundColor, Color minorGridColor, Color majorGridColor, double minorGridStep, double majorGridStep, double minorGridStrokeWidth, double majorGridStrokeWidth, Color emptyStateTextColor, double emptyStateTextSize, Color errorTextColor
});




}
/// @nodoc
class __$GraphPanelStyleCopyWithImpl<$Res>
    implements _$GraphPanelStyleCopyWith<$Res> {
  __$GraphPanelStyleCopyWithImpl(this._self, this._then);

  final _GraphPanelStyle _self;
  final $Res Function(_GraphPanelStyle) _then;

/// Create a copy of GraphPanelStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backgroundColor = null,Object? minorGridColor = null,Object? majorGridColor = null,Object? minorGridStep = null,Object? majorGridStep = null,Object? minorGridStrokeWidth = null,Object? majorGridStrokeWidth = null,Object? emptyStateTextColor = null,Object? emptyStateTextSize = null,Object? errorTextColor = null,}) {
  return _then(_GraphPanelStyle(
backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,minorGridColor: null == minorGridColor ? _self.minorGridColor : minorGridColor // ignore: cast_nullable_to_non_nullable
as Color,majorGridColor: null == majorGridColor ? _self.majorGridColor : majorGridColor // ignore: cast_nullable_to_non_nullable
as Color,minorGridStep: null == minorGridStep ? _self.minorGridStep : minorGridStep // ignore: cast_nullable_to_non_nullable
as double,majorGridStep: null == majorGridStep ? _self.majorGridStep : majorGridStep // ignore: cast_nullable_to_non_nullable
as double,minorGridStrokeWidth: null == minorGridStrokeWidth ? _self.minorGridStrokeWidth : minorGridStrokeWidth // ignore: cast_nullable_to_non_nullable
as double,majorGridStrokeWidth: null == majorGridStrokeWidth ? _self.majorGridStrokeWidth : majorGridStrokeWidth // ignore: cast_nullable_to_non_nullable
as double,emptyStateTextColor: null == emptyStateTextColor ? _self.emptyStateTextColor : emptyStateTextColor // ignore: cast_nullable_to_non_nullable
as Color,emptyStateTextSize: null == emptyStateTextSize ? _self.emptyStateTextSize : emptyStateTextSize // ignore: cast_nullable_to_non_nullable
as double,errorTextColor: null == errorTextColor ? _self.errorTextColor : errorTextColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
