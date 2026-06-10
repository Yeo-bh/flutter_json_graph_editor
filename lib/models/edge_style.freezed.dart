// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edge_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EdgeStyle {

/// 연결선 색상.
 Color get lineColor;/// 연결선 두께(px).
 double get lineWidth;
/// Create a copy of EdgeStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EdgeStyleCopyWith<EdgeStyle> get copyWith => _$EdgeStyleCopyWithImpl<EdgeStyle>(this as EdgeStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EdgeStyle&&(identical(other.lineColor, lineColor) || other.lineColor == lineColor)&&(identical(other.lineWidth, lineWidth) || other.lineWidth == lineWidth));
}


@override
int get hashCode => Object.hash(runtimeType,lineColor,lineWidth);

@override
String toString() {
  return 'EdgeStyle(lineColor: $lineColor, lineWidth: $lineWidth)';
}


}

/// @nodoc
abstract mixin class $EdgeStyleCopyWith<$Res>  {
  factory $EdgeStyleCopyWith(EdgeStyle value, $Res Function(EdgeStyle) _then) = _$EdgeStyleCopyWithImpl;
@useResult
$Res call({
 Color lineColor, double lineWidth
});




}
/// @nodoc
class _$EdgeStyleCopyWithImpl<$Res>
    implements $EdgeStyleCopyWith<$Res> {
  _$EdgeStyleCopyWithImpl(this._self, this._then);

  final EdgeStyle _self;
  final $Res Function(EdgeStyle) _then;

/// Create a copy of EdgeStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lineColor = null,Object? lineWidth = null,}) {
  return _then(_self.copyWith(
lineColor: null == lineColor ? _self.lineColor : lineColor // ignore: cast_nullable_to_non_nullable
as Color,lineWidth: null == lineWidth ? _self.lineWidth : lineWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [EdgeStyle].
extension EdgeStylePatterns on EdgeStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EdgeStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EdgeStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EdgeStyle value)  $default,){
final _that = this;
switch (_that) {
case _EdgeStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EdgeStyle value)?  $default,){
final _that = this;
switch (_that) {
case _EdgeStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color lineColor,  double lineWidth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EdgeStyle() when $default != null:
return $default(_that.lineColor,_that.lineWidth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color lineColor,  double lineWidth)  $default,) {final _that = this;
switch (_that) {
case _EdgeStyle():
return $default(_that.lineColor,_that.lineWidth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color lineColor,  double lineWidth)?  $default,) {final _that = this;
switch (_that) {
case _EdgeStyle() when $default != null:
return $default(_that.lineColor,_that.lineWidth);case _:
  return null;

}
}

}

/// @nodoc


class _EdgeStyle implements EdgeStyle {
  const _EdgeStyle({this.lineColor = const Color(0xFFD1D5DB), this.lineWidth = 1.5});
  

/// 연결선 색상.
@override@JsonKey() final  Color lineColor;
/// 연결선 두께(px).
@override@JsonKey() final  double lineWidth;

/// Create a copy of EdgeStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EdgeStyleCopyWith<_EdgeStyle> get copyWith => __$EdgeStyleCopyWithImpl<_EdgeStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EdgeStyle&&(identical(other.lineColor, lineColor) || other.lineColor == lineColor)&&(identical(other.lineWidth, lineWidth) || other.lineWidth == lineWidth));
}


@override
int get hashCode => Object.hash(runtimeType,lineColor,lineWidth);

@override
String toString() {
  return 'EdgeStyle(lineColor: $lineColor, lineWidth: $lineWidth)';
}


}

/// @nodoc
abstract mixin class _$EdgeStyleCopyWith<$Res> implements $EdgeStyleCopyWith<$Res> {
  factory _$EdgeStyleCopyWith(_EdgeStyle value, $Res Function(_EdgeStyle) _then) = __$EdgeStyleCopyWithImpl;
@override @useResult
$Res call({
 Color lineColor, double lineWidth
});




}
/// @nodoc
class __$EdgeStyleCopyWithImpl<$Res>
    implements _$EdgeStyleCopyWith<$Res> {
  __$EdgeStyleCopyWithImpl(this._self, this._then);

  final _EdgeStyle _self;
  final $Res Function(_EdgeStyle) _then;

/// Create a copy of EdgeStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lineColor = null,Object? lineWidth = null,}) {
  return _then(_EdgeStyle(
lineColor: null == lineColor ? _self.lineColor : lineColor // ignore: cast_nullable_to_non_nullable
as Color,lineWidth: null == lineWidth ? _self.lineWidth : lineWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
