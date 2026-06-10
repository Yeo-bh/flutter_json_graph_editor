// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_view_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplitViewStyle {

/// 분할선 색.
 Color get dividerColor;/// 분할선 너비(px). 드래그 히트 영역 역할도 함.
 double get dividerWidth;/// 좌측 패널 최소 비율 (전체 너비 대비, 0.0~1.0).
 double get minRatio;/// 좌측 패널 최대 비율 (전체 너비 대비, 0.0~1.0).
 double get maxRatio;
/// Create a copy of SplitViewStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitViewStyleCopyWith<SplitViewStyle> get copyWith => _$SplitViewStyleCopyWithImpl<SplitViewStyle>(this as SplitViewStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitViewStyle&&(identical(other.dividerColor, dividerColor) || other.dividerColor == dividerColor)&&(identical(other.dividerWidth, dividerWidth) || other.dividerWidth == dividerWidth)&&(identical(other.minRatio, minRatio) || other.minRatio == minRatio)&&(identical(other.maxRatio, maxRatio) || other.maxRatio == maxRatio));
}


@override
int get hashCode => Object.hash(runtimeType,dividerColor,dividerWidth,minRatio,maxRatio);

@override
String toString() {
  return 'SplitViewStyle(dividerColor: $dividerColor, dividerWidth: $dividerWidth, minRatio: $minRatio, maxRatio: $maxRatio)';
}


}

/// @nodoc
abstract mixin class $SplitViewStyleCopyWith<$Res>  {
  factory $SplitViewStyleCopyWith(SplitViewStyle value, $Res Function(SplitViewStyle) _then) = _$SplitViewStyleCopyWithImpl;
@useResult
$Res call({
 Color dividerColor, double dividerWidth, double minRatio, double maxRatio
});




}
/// @nodoc
class _$SplitViewStyleCopyWithImpl<$Res>
    implements $SplitViewStyleCopyWith<$Res> {
  _$SplitViewStyleCopyWithImpl(this._self, this._then);

  final SplitViewStyle _self;
  final $Res Function(SplitViewStyle) _then;

/// Create a copy of SplitViewStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dividerColor = null,Object? dividerWidth = null,Object? minRatio = null,Object? maxRatio = null,}) {
  return _then(_self.copyWith(
dividerColor: null == dividerColor ? _self.dividerColor : dividerColor // ignore: cast_nullable_to_non_nullable
as Color,dividerWidth: null == dividerWidth ? _self.dividerWidth : dividerWidth // ignore: cast_nullable_to_non_nullable
as double,minRatio: null == minRatio ? _self.minRatio : minRatio // ignore: cast_nullable_to_non_nullable
as double,maxRatio: null == maxRatio ? _self.maxRatio : maxRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SplitViewStyle].
extension SplitViewStylePatterns on SplitViewStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplitViewStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplitViewStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplitViewStyle value)  $default,){
final _that = this;
switch (_that) {
case _SplitViewStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplitViewStyle value)?  $default,){
final _that = this;
switch (_that) {
case _SplitViewStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color dividerColor,  double dividerWidth,  double minRatio,  double maxRatio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplitViewStyle() when $default != null:
return $default(_that.dividerColor,_that.dividerWidth,_that.minRatio,_that.maxRatio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color dividerColor,  double dividerWidth,  double minRatio,  double maxRatio)  $default,) {final _that = this;
switch (_that) {
case _SplitViewStyle():
return $default(_that.dividerColor,_that.dividerWidth,_that.minRatio,_that.maxRatio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color dividerColor,  double dividerWidth,  double minRatio,  double maxRatio)?  $default,) {final _that = this;
switch (_that) {
case _SplitViewStyle() when $default != null:
return $default(_that.dividerColor,_that.dividerWidth,_that.minRatio,_that.maxRatio);case _:
  return null;

}
}

}

/// @nodoc


class _SplitViewStyle implements SplitViewStyle {
  const _SplitViewStyle({this.dividerColor = const Color(0xFFE1E4E8), this.dividerWidth = 4.0, this.minRatio = 0.2, this.maxRatio = 0.7});
  

/// 분할선 색.
@override@JsonKey() final  Color dividerColor;
/// 분할선 너비(px). 드래그 히트 영역 역할도 함.
@override@JsonKey() final  double dividerWidth;
/// 좌측 패널 최소 비율 (전체 너비 대비, 0.0~1.0).
@override@JsonKey() final  double minRatio;
/// 좌측 패널 최대 비율 (전체 너비 대비, 0.0~1.0).
@override@JsonKey() final  double maxRatio;

/// Create a copy of SplitViewStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplitViewStyleCopyWith<_SplitViewStyle> get copyWith => __$SplitViewStyleCopyWithImpl<_SplitViewStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplitViewStyle&&(identical(other.dividerColor, dividerColor) || other.dividerColor == dividerColor)&&(identical(other.dividerWidth, dividerWidth) || other.dividerWidth == dividerWidth)&&(identical(other.minRatio, minRatio) || other.minRatio == minRatio)&&(identical(other.maxRatio, maxRatio) || other.maxRatio == maxRatio));
}


@override
int get hashCode => Object.hash(runtimeType,dividerColor,dividerWidth,minRatio,maxRatio);

@override
String toString() {
  return 'SplitViewStyle(dividerColor: $dividerColor, dividerWidth: $dividerWidth, minRatio: $minRatio, maxRatio: $maxRatio)';
}


}

/// @nodoc
abstract mixin class _$SplitViewStyleCopyWith<$Res> implements $SplitViewStyleCopyWith<$Res> {
  factory _$SplitViewStyleCopyWith(_SplitViewStyle value, $Res Function(_SplitViewStyle) _then) = __$SplitViewStyleCopyWithImpl;
@override @useResult
$Res call({
 Color dividerColor, double dividerWidth, double minRatio, double maxRatio
});




}
/// @nodoc
class __$SplitViewStyleCopyWithImpl<$Res>
    implements _$SplitViewStyleCopyWith<$Res> {
  __$SplitViewStyleCopyWithImpl(this._self, this._then);

  final _SplitViewStyle _self;
  final $Res Function(_SplitViewStyle) _then;

/// Create a copy of SplitViewStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dividerColor = null,Object? dividerWidth = null,Object? minRatio = null,Object? maxRatio = null,}) {
  return _then(_SplitViewStyle(
dividerColor: null == dividerColor ? _self.dividerColor : dividerColor // ignore: cast_nullable_to_non_nullable
as Color,dividerWidth: null == dividerWidth ? _self.dividerWidth : dividerWidth // ignore: cast_nullable_to_non_nullable
as double,minRatio: null == minRatio ? _self.minRatio : minRatio // ignore: cast_nullable_to_non_nullable
as double,maxRatio: null == maxRatio ? _self.maxRatio : maxRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
