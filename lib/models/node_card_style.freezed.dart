// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_card_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodeCardStyle {

/// 카드 고정 너비(px).
/// tree_layout의 수평 간격 계산에도 사용되므로 바꾸면 layoutTree 재호출 필요.
 double get width;/// 카드 헤더 영역 높이(px).
/// nodeHeight 계산에 포함되므로 바꾸면 layoutTree 재호출 필요.
 double get headerHeight;/// key-value 행 하나의 높이(px).
/// nodeHeight = headerHeight + entries.length × entryHeight + borderWidth×2.
 double get entryHeight;/// 카드 모서리 둥글기 반지름(px). 0이면 직각.
 double get borderRadius;/// 카드 내부 배경색.
 Color get backgroundColor;/// 카드 테두리 색.
 Color get borderColor;/// 카드 테두리 두께(px).
 double get borderWidth;/// 카드 아래 그림자 색상.
 Color get shadowColor;/// 그림자 번짐 반경(px).
 double get shadowBlurRadius;/// 그림자 위치 오프셋.
 Offset get shadowOffset;/// 헤더 배경색.
 Color get headerBackgroundColor;/// 헤더 내 좌우 내부 패딩(px).
 double get headerPaddingHorizontal;/// 타입 뱃지 배경색.
 Color get typeBadgeBackgroundColor;/// 타입 뱃지 텍스트 색.
 Color get typeBadgeTextColor;/// 타입 뱃지 폰트 크기(pt).
 double get typeBadgeFontSize;/// 타입 뱃지 모서리 둥글기 반지름(px).
 double get typeBadgeBorderRadius;/// 타입 뱃지 오른쪽 끝 ~ 라벨 왼쪽 시작 사이 간격(px).
 double get badgeLabelGap;/// 헤더에 표시되는 키 이름 텍스트 색.
 Color get labelColor;/// 헤더 키 이름 폰트 크기(pt).
 double get labelFontSize;/// 헤더 키 이름 폰트 두께.
 FontWeight get labelFontWeight;/// 접기/펼치기 아이콘 색.
 Color get collapseIconColor;/// 접기/펼치기 아이콘 크기(px).
 double get collapseIconSize;/// 접기/펼치기 버튼 배경색.
 Color get collapseIconBackgroundColor;/// 접기/펼치기 버튼 모서리 둥글기(px).
 double get collapseIconBorderRadius;/// entry 행 좌우 내부 패딩(px).
 double get entryPaddingHorizontal;/// 각 entry 행 위에 그려지는 구분선 색.
 Color get entryDividerColor;/// entry 행의 key 텍스트 색.
 Color get entryKeyColor;/// entry 행의 key 폰트 크기(pt).
 double get entryKeyFontSize;/// key와 value 사이 ':' 구분자 색.
 Color get entrySeparatorColor;/// ':' 구분자 좌우 패딩(px).
 double get entrySeparatorPadding;/// entry 행의 value 폰트 크기(pt).
 double get entryValueFontSize;/// JSON string 값 색.
 Color get stringValueColor;/// JSON number 값 색.
 Color get numberValueColor;/// JSON boolean 값 색.
 Color get booleanValueColor;/// JSON null 값 색.
 Color get nullValueColor;/// 카드 전체에 적용되는 폰트 패밀리.
 String get fontFamily;/// 사이드 패널에서 선택된 노드 카드의 테두리 색.
 Color get selectedBorderColor;/// + 버튼 아이콘 및 테두리 색.
 Color get addButtonColor;/// + 버튼 배경색.
 Color get addButtonBackgroundColor;/// + 버튼 크기(px, 지름).
 double get addButtonSize;/// + 버튼 아이콘 크기(px).
 double get addButtonIconSize;/// + 버튼 테두리 두께(px).
 double get addButtonBorderWidth;
/// Create a copy of NodeCardStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeCardStyleCopyWith<NodeCardStyle> get copyWith => _$NodeCardStyleCopyWithImpl<NodeCardStyle>(this as NodeCardStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeCardStyle&&(identical(other.width, width) || other.width == width)&&(identical(other.headerHeight, headerHeight) || other.headerHeight == headerHeight)&&(identical(other.entryHeight, entryHeight) || other.entryHeight == entryHeight)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.borderColor, borderColor) || other.borderColor == borderColor)&&(identical(other.borderWidth, borderWidth) || other.borderWidth == borderWidth)&&(identical(other.shadowColor, shadowColor) || other.shadowColor == shadowColor)&&(identical(other.shadowBlurRadius, shadowBlurRadius) || other.shadowBlurRadius == shadowBlurRadius)&&(identical(other.shadowOffset, shadowOffset) || other.shadowOffset == shadowOffset)&&(identical(other.headerBackgroundColor, headerBackgroundColor) || other.headerBackgroundColor == headerBackgroundColor)&&(identical(other.headerPaddingHorizontal, headerPaddingHorizontal) || other.headerPaddingHorizontal == headerPaddingHorizontal)&&(identical(other.typeBadgeBackgroundColor, typeBadgeBackgroundColor) || other.typeBadgeBackgroundColor == typeBadgeBackgroundColor)&&(identical(other.typeBadgeTextColor, typeBadgeTextColor) || other.typeBadgeTextColor == typeBadgeTextColor)&&(identical(other.typeBadgeFontSize, typeBadgeFontSize) || other.typeBadgeFontSize == typeBadgeFontSize)&&(identical(other.typeBadgeBorderRadius, typeBadgeBorderRadius) || other.typeBadgeBorderRadius == typeBadgeBorderRadius)&&(identical(other.badgeLabelGap, badgeLabelGap) || other.badgeLabelGap == badgeLabelGap)&&(identical(other.labelColor, labelColor) || other.labelColor == labelColor)&&(identical(other.labelFontSize, labelFontSize) || other.labelFontSize == labelFontSize)&&(identical(other.labelFontWeight, labelFontWeight) || other.labelFontWeight == labelFontWeight)&&(identical(other.collapseIconColor, collapseIconColor) || other.collapseIconColor == collapseIconColor)&&(identical(other.collapseIconSize, collapseIconSize) || other.collapseIconSize == collapseIconSize)&&(identical(other.collapseIconBackgroundColor, collapseIconBackgroundColor) || other.collapseIconBackgroundColor == collapseIconBackgroundColor)&&(identical(other.collapseIconBorderRadius, collapseIconBorderRadius) || other.collapseIconBorderRadius == collapseIconBorderRadius)&&(identical(other.entryPaddingHorizontal, entryPaddingHorizontal) || other.entryPaddingHorizontal == entryPaddingHorizontal)&&(identical(other.entryDividerColor, entryDividerColor) || other.entryDividerColor == entryDividerColor)&&(identical(other.entryKeyColor, entryKeyColor) || other.entryKeyColor == entryKeyColor)&&(identical(other.entryKeyFontSize, entryKeyFontSize) || other.entryKeyFontSize == entryKeyFontSize)&&(identical(other.entrySeparatorColor, entrySeparatorColor) || other.entrySeparatorColor == entrySeparatorColor)&&(identical(other.entrySeparatorPadding, entrySeparatorPadding) || other.entrySeparatorPadding == entrySeparatorPadding)&&(identical(other.entryValueFontSize, entryValueFontSize) || other.entryValueFontSize == entryValueFontSize)&&(identical(other.stringValueColor, stringValueColor) || other.stringValueColor == stringValueColor)&&(identical(other.numberValueColor, numberValueColor) || other.numberValueColor == numberValueColor)&&(identical(other.booleanValueColor, booleanValueColor) || other.booleanValueColor == booleanValueColor)&&(identical(other.nullValueColor, nullValueColor) || other.nullValueColor == nullValueColor)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.selectedBorderColor, selectedBorderColor) || other.selectedBorderColor == selectedBorderColor)&&(identical(other.addButtonColor, addButtonColor) || other.addButtonColor == addButtonColor)&&(identical(other.addButtonBackgroundColor, addButtonBackgroundColor) || other.addButtonBackgroundColor == addButtonBackgroundColor)&&(identical(other.addButtonSize, addButtonSize) || other.addButtonSize == addButtonSize)&&(identical(other.addButtonIconSize, addButtonIconSize) || other.addButtonIconSize == addButtonIconSize)&&(identical(other.addButtonBorderWidth, addButtonBorderWidth) || other.addButtonBorderWidth == addButtonBorderWidth));
}


@override
int get hashCode => Object.hashAll([runtimeType,width,headerHeight,entryHeight,borderRadius,backgroundColor,borderColor,borderWidth,shadowColor,shadowBlurRadius,shadowOffset,headerBackgroundColor,headerPaddingHorizontal,typeBadgeBackgroundColor,typeBadgeTextColor,typeBadgeFontSize,typeBadgeBorderRadius,badgeLabelGap,labelColor,labelFontSize,labelFontWeight,collapseIconColor,collapseIconSize,collapseIconBackgroundColor,collapseIconBorderRadius,entryPaddingHorizontal,entryDividerColor,entryKeyColor,entryKeyFontSize,entrySeparatorColor,entrySeparatorPadding,entryValueFontSize,stringValueColor,numberValueColor,booleanValueColor,nullValueColor,fontFamily,selectedBorderColor,addButtonColor,addButtonBackgroundColor,addButtonSize,addButtonIconSize,addButtonBorderWidth]);

@override
String toString() {
  return 'NodeCardStyle(width: $width, headerHeight: $headerHeight, entryHeight: $entryHeight, borderRadius: $borderRadius, backgroundColor: $backgroundColor, borderColor: $borderColor, borderWidth: $borderWidth, shadowColor: $shadowColor, shadowBlurRadius: $shadowBlurRadius, shadowOffset: $shadowOffset, headerBackgroundColor: $headerBackgroundColor, headerPaddingHorizontal: $headerPaddingHorizontal, typeBadgeBackgroundColor: $typeBadgeBackgroundColor, typeBadgeTextColor: $typeBadgeTextColor, typeBadgeFontSize: $typeBadgeFontSize, typeBadgeBorderRadius: $typeBadgeBorderRadius, badgeLabelGap: $badgeLabelGap, labelColor: $labelColor, labelFontSize: $labelFontSize, labelFontWeight: $labelFontWeight, collapseIconColor: $collapseIconColor, collapseIconSize: $collapseIconSize, collapseIconBackgroundColor: $collapseIconBackgroundColor, collapseIconBorderRadius: $collapseIconBorderRadius, entryPaddingHorizontal: $entryPaddingHorizontal, entryDividerColor: $entryDividerColor, entryKeyColor: $entryKeyColor, entryKeyFontSize: $entryKeyFontSize, entrySeparatorColor: $entrySeparatorColor, entrySeparatorPadding: $entrySeparatorPadding, entryValueFontSize: $entryValueFontSize, stringValueColor: $stringValueColor, numberValueColor: $numberValueColor, booleanValueColor: $booleanValueColor, nullValueColor: $nullValueColor, fontFamily: $fontFamily, selectedBorderColor: $selectedBorderColor, addButtonColor: $addButtonColor, addButtonBackgroundColor: $addButtonBackgroundColor, addButtonSize: $addButtonSize, addButtonIconSize: $addButtonIconSize, addButtonBorderWidth: $addButtonBorderWidth)';
}


}

/// @nodoc
abstract mixin class $NodeCardStyleCopyWith<$Res>  {
  factory $NodeCardStyleCopyWith(NodeCardStyle value, $Res Function(NodeCardStyle) _then) = _$NodeCardStyleCopyWithImpl;
@useResult
$Res call({
 double width, double headerHeight, double entryHeight, double borderRadius, Color backgroundColor, Color borderColor, double borderWidth, Color shadowColor, double shadowBlurRadius, Offset shadowOffset, Color headerBackgroundColor, double headerPaddingHorizontal, Color typeBadgeBackgroundColor, Color typeBadgeTextColor, double typeBadgeFontSize, double typeBadgeBorderRadius, double badgeLabelGap, Color labelColor, double labelFontSize, FontWeight labelFontWeight, Color collapseIconColor, double collapseIconSize, Color collapseIconBackgroundColor, double collapseIconBorderRadius, double entryPaddingHorizontal, Color entryDividerColor, Color entryKeyColor, double entryKeyFontSize, Color entrySeparatorColor, double entrySeparatorPadding, double entryValueFontSize, Color stringValueColor, Color numberValueColor, Color booleanValueColor, Color nullValueColor, String fontFamily, Color selectedBorderColor, Color addButtonColor, Color addButtonBackgroundColor, double addButtonSize, double addButtonIconSize, double addButtonBorderWidth
});




}
/// @nodoc
class _$NodeCardStyleCopyWithImpl<$Res>
    implements $NodeCardStyleCopyWith<$Res> {
  _$NodeCardStyleCopyWithImpl(this._self, this._then);

  final NodeCardStyle _self;
  final $Res Function(NodeCardStyle) _then;

/// Create a copy of NodeCardStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = null,Object? headerHeight = null,Object? entryHeight = null,Object? borderRadius = null,Object? backgroundColor = null,Object? borderColor = null,Object? borderWidth = null,Object? shadowColor = null,Object? shadowBlurRadius = null,Object? shadowOffset = null,Object? headerBackgroundColor = null,Object? headerPaddingHorizontal = null,Object? typeBadgeBackgroundColor = null,Object? typeBadgeTextColor = null,Object? typeBadgeFontSize = null,Object? typeBadgeBorderRadius = null,Object? badgeLabelGap = null,Object? labelColor = null,Object? labelFontSize = null,Object? labelFontWeight = null,Object? collapseIconColor = null,Object? collapseIconSize = null,Object? collapseIconBackgroundColor = null,Object? collapseIconBorderRadius = null,Object? entryPaddingHorizontal = null,Object? entryDividerColor = null,Object? entryKeyColor = null,Object? entryKeyFontSize = null,Object? entrySeparatorColor = null,Object? entrySeparatorPadding = null,Object? entryValueFontSize = null,Object? stringValueColor = null,Object? numberValueColor = null,Object? booleanValueColor = null,Object? nullValueColor = null,Object? fontFamily = null,Object? selectedBorderColor = null,Object? addButtonColor = null,Object? addButtonBackgroundColor = null,Object? addButtonSize = null,Object? addButtonIconSize = null,Object? addButtonBorderWidth = null,}) {
  return _then(_self.copyWith(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,headerHeight: null == headerHeight ? _self.headerHeight : headerHeight // ignore: cast_nullable_to_non_nullable
as double,entryHeight: null == entryHeight ? _self.entryHeight : entryHeight // ignore: cast_nullable_to_non_nullable
as double,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,borderColor: null == borderColor ? _self.borderColor : borderColor // ignore: cast_nullable_to_non_nullable
as Color,borderWidth: null == borderWidth ? _self.borderWidth : borderWidth // ignore: cast_nullable_to_non_nullable
as double,shadowColor: null == shadowColor ? _self.shadowColor : shadowColor // ignore: cast_nullable_to_non_nullable
as Color,shadowBlurRadius: null == shadowBlurRadius ? _self.shadowBlurRadius : shadowBlurRadius // ignore: cast_nullable_to_non_nullable
as double,shadowOffset: null == shadowOffset ? _self.shadowOffset : shadowOffset // ignore: cast_nullable_to_non_nullable
as Offset,headerBackgroundColor: null == headerBackgroundColor ? _self.headerBackgroundColor : headerBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,headerPaddingHorizontal: null == headerPaddingHorizontal ? _self.headerPaddingHorizontal : headerPaddingHorizontal // ignore: cast_nullable_to_non_nullable
as double,typeBadgeBackgroundColor: null == typeBadgeBackgroundColor ? _self.typeBadgeBackgroundColor : typeBadgeBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,typeBadgeTextColor: null == typeBadgeTextColor ? _self.typeBadgeTextColor : typeBadgeTextColor // ignore: cast_nullable_to_non_nullable
as Color,typeBadgeFontSize: null == typeBadgeFontSize ? _self.typeBadgeFontSize : typeBadgeFontSize // ignore: cast_nullable_to_non_nullable
as double,typeBadgeBorderRadius: null == typeBadgeBorderRadius ? _self.typeBadgeBorderRadius : typeBadgeBorderRadius // ignore: cast_nullable_to_non_nullable
as double,badgeLabelGap: null == badgeLabelGap ? _self.badgeLabelGap : badgeLabelGap // ignore: cast_nullable_to_non_nullable
as double,labelColor: null == labelColor ? _self.labelColor : labelColor // ignore: cast_nullable_to_non_nullable
as Color,labelFontSize: null == labelFontSize ? _self.labelFontSize : labelFontSize // ignore: cast_nullable_to_non_nullable
as double,labelFontWeight: null == labelFontWeight ? _self.labelFontWeight : labelFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight,collapseIconColor: null == collapseIconColor ? _self.collapseIconColor : collapseIconColor // ignore: cast_nullable_to_non_nullable
as Color,collapseIconSize: null == collapseIconSize ? _self.collapseIconSize : collapseIconSize // ignore: cast_nullable_to_non_nullable
as double,collapseIconBackgroundColor: null == collapseIconBackgroundColor ? _self.collapseIconBackgroundColor : collapseIconBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,collapseIconBorderRadius: null == collapseIconBorderRadius ? _self.collapseIconBorderRadius : collapseIconBorderRadius // ignore: cast_nullable_to_non_nullable
as double,entryPaddingHorizontal: null == entryPaddingHorizontal ? _self.entryPaddingHorizontal : entryPaddingHorizontal // ignore: cast_nullable_to_non_nullable
as double,entryDividerColor: null == entryDividerColor ? _self.entryDividerColor : entryDividerColor // ignore: cast_nullable_to_non_nullable
as Color,entryKeyColor: null == entryKeyColor ? _self.entryKeyColor : entryKeyColor // ignore: cast_nullable_to_non_nullable
as Color,entryKeyFontSize: null == entryKeyFontSize ? _self.entryKeyFontSize : entryKeyFontSize // ignore: cast_nullable_to_non_nullable
as double,entrySeparatorColor: null == entrySeparatorColor ? _self.entrySeparatorColor : entrySeparatorColor // ignore: cast_nullable_to_non_nullable
as Color,entrySeparatorPadding: null == entrySeparatorPadding ? _self.entrySeparatorPadding : entrySeparatorPadding // ignore: cast_nullable_to_non_nullable
as double,entryValueFontSize: null == entryValueFontSize ? _self.entryValueFontSize : entryValueFontSize // ignore: cast_nullable_to_non_nullable
as double,stringValueColor: null == stringValueColor ? _self.stringValueColor : stringValueColor // ignore: cast_nullable_to_non_nullable
as Color,numberValueColor: null == numberValueColor ? _self.numberValueColor : numberValueColor // ignore: cast_nullable_to_non_nullable
as Color,booleanValueColor: null == booleanValueColor ? _self.booleanValueColor : booleanValueColor // ignore: cast_nullable_to_non_nullable
as Color,nullValueColor: null == nullValueColor ? _self.nullValueColor : nullValueColor // ignore: cast_nullable_to_non_nullable
as Color,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,selectedBorderColor: null == selectedBorderColor ? _self.selectedBorderColor : selectedBorderColor // ignore: cast_nullable_to_non_nullable
as Color,addButtonColor: null == addButtonColor ? _self.addButtonColor : addButtonColor // ignore: cast_nullable_to_non_nullable
as Color,addButtonBackgroundColor: null == addButtonBackgroundColor ? _self.addButtonBackgroundColor : addButtonBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,addButtonSize: null == addButtonSize ? _self.addButtonSize : addButtonSize // ignore: cast_nullable_to_non_nullable
as double,addButtonIconSize: null == addButtonIconSize ? _self.addButtonIconSize : addButtonIconSize // ignore: cast_nullable_to_non_nullable
as double,addButtonBorderWidth: null == addButtonBorderWidth ? _self.addButtonBorderWidth : addButtonBorderWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NodeCardStyle].
extension NodeCardStylePatterns on NodeCardStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NodeCardStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NodeCardStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NodeCardStyle value)  $default,){
final _that = this;
switch (_that) {
case _NodeCardStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NodeCardStyle value)?  $default,){
final _that = this;
switch (_that) {
case _NodeCardStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double width,  double headerHeight,  double entryHeight,  double borderRadius,  Color backgroundColor,  Color borderColor,  double borderWidth,  Color shadowColor,  double shadowBlurRadius,  Offset shadowOffset,  Color headerBackgroundColor,  double headerPaddingHorizontal,  Color typeBadgeBackgroundColor,  Color typeBadgeTextColor,  double typeBadgeFontSize,  double typeBadgeBorderRadius,  double badgeLabelGap,  Color labelColor,  double labelFontSize,  FontWeight labelFontWeight,  Color collapseIconColor,  double collapseIconSize,  Color collapseIconBackgroundColor,  double collapseIconBorderRadius,  double entryPaddingHorizontal,  Color entryDividerColor,  Color entryKeyColor,  double entryKeyFontSize,  Color entrySeparatorColor,  double entrySeparatorPadding,  double entryValueFontSize,  Color stringValueColor,  Color numberValueColor,  Color booleanValueColor,  Color nullValueColor,  String fontFamily,  Color selectedBorderColor,  Color addButtonColor,  Color addButtonBackgroundColor,  double addButtonSize,  double addButtonIconSize,  double addButtonBorderWidth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NodeCardStyle() when $default != null:
return $default(_that.width,_that.headerHeight,_that.entryHeight,_that.borderRadius,_that.backgroundColor,_that.borderColor,_that.borderWidth,_that.shadowColor,_that.shadowBlurRadius,_that.shadowOffset,_that.headerBackgroundColor,_that.headerPaddingHorizontal,_that.typeBadgeBackgroundColor,_that.typeBadgeTextColor,_that.typeBadgeFontSize,_that.typeBadgeBorderRadius,_that.badgeLabelGap,_that.labelColor,_that.labelFontSize,_that.labelFontWeight,_that.collapseIconColor,_that.collapseIconSize,_that.collapseIconBackgroundColor,_that.collapseIconBorderRadius,_that.entryPaddingHorizontal,_that.entryDividerColor,_that.entryKeyColor,_that.entryKeyFontSize,_that.entrySeparatorColor,_that.entrySeparatorPadding,_that.entryValueFontSize,_that.stringValueColor,_that.numberValueColor,_that.booleanValueColor,_that.nullValueColor,_that.fontFamily,_that.selectedBorderColor,_that.addButtonColor,_that.addButtonBackgroundColor,_that.addButtonSize,_that.addButtonIconSize,_that.addButtonBorderWidth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double width,  double headerHeight,  double entryHeight,  double borderRadius,  Color backgroundColor,  Color borderColor,  double borderWidth,  Color shadowColor,  double shadowBlurRadius,  Offset shadowOffset,  Color headerBackgroundColor,  double headerPaddingHorizontal,  Color typeBadgeBackgroundColor,  Color typeBadgeTextColor,  double typeBadgeFontSize,  double typeBadgeBorderRadius,  double badgeLabelGap,  Color labelColor,  double labelFontSize,  FontWeight labelFontWeight,  Color collapseIconColor,  double collapseIconSize,  Color collapseIconBackgroundColor,  double collapseIconBorderRadius,  double entryPaddingHorizontal,  Color entryDividerColor,  Color entryKeyColor,  double entryKeyFontSize,  Color entrySeparatorColor,  double entrySeparatorPadding,  double entryValueFontSize,  Color stringValueColor,  Color numberValueColor,  Color booleanValueColor,  Color nullValueColor,  String fontFamily,  Color selectedBorderColor,  Color addButtonColor,  Color addButtonBackgroundColor,  double addButtonSize,  double addButtonIconSize,  double addButtonBorderWidth)  $default,) {final _that = this;
switch (_that) {
case _NodeCardStyle():
return $default(_that.width,_that.headerHeight,_that.entryHeight,_that.borderRadius,_that.backgroundColor,_that.borderColor,_that.borderWidth,_that.shadowColor,_that.shadowBlurRadius,_that.shadowOffset,_that.headerBackgroundColor,_that.headerPaddingHorizontal,_that.typeBadgeBackgroundColor,_that.typeBadgeTextColor,_that.typeBadgeFontSize,_that.typeBadgeBorderRadius,_that.badgeLabelGap,_that.labelColor,_that.labelFontSize,_that.labelFontWeight,_that.collapseIconColor,_that.collapseIconSize,_that.collapseIconBackgroundColor,_that.collapseIconBorderRadius,_that.entryPaddingHorizontal,_that.entryDividerColor,_that.entryKeyColor,_that.entryKeyFontSize,_that.entrySeparatorColor,_that.entrySeparatorPadding,_that.entryValueFontSize,_that.stringValueColor,_that.numberValueColor,_that.booleanValueColor,_that.nullValueColor,_that.fontFamily,_that.selectedBorderColor,_that.addButtonColor,_that.addButtonBackgroundColor,_that.addButtonSize,_that.addButtonIconSize,_that.addButtonBorderWidth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double width,  double headerHeight,  double entryHeight,  double borderRadius,  Color backgroundColor,  Color borderColor,  double borderWidth,  Color shadowColor,  double shadowBlurRadius,  Offset shadowOffset,  Color headerBackgroundColor,  double headerPaddingHorizontal,  Color typeBadgeBackgroundColor,  Color typeBadgeTextColor,  double typeBadgeFontSize,  double typeBadgeBorderRadius,  double badgeLabelGap,  Color labelColor,  double labelFontSize,  FontWeight labelFontWeight,  Color collapseIconColor,  double collapseIconSize,  Color collapseIconBackgroundColor,  double collapseIconBorderRadius,  double entryPaddingHorizontal,  Color entryDividerColor,  Color entryKeyColor,  double entryKeyFontSize,  Color entrySeparatorColor,  double entrySeparatorPadding,  double entryValueFontSize,  Color stringValueColor,  Color numberValueColor,  Color booleanValueColor,  Color nullValueColor,  String fontFamily,  Color selectedBorderColor,  Color addButtonColor,  Color addButtonBackgroundColor,  double addButtonSize,  double addButtonIconSize,  double addButtonBorderWidth)?  $default,) {final _that = this;
switch (_that) {
case _NodeCardStyle() when $default != null:
return $default(_that.width,_that.headerHeight,_that.entryHeight,_that.borderRadius,_that.backgroundColor,_that.borderColor,_that.borderWidth,_that.shadowColor,_that.shadowBlurRadius,_that.shadowOffset,_that.headerBackgroundColor,_that.headerPaddingHorizontal,_that.typeBadgeBackgroundColor,_that.typeBadgeTextColor,_that.typeBadgeFontSize,_that.typeBadgeBorderRadius,_that.badgeLabelGap,_that.labelColor,_that.labelFontSize,_that.labelFontWeight,_that.collapseIconColor,_that.collapseIconSize,_that.collapseIconBackgroundColor,_that.collapseIconBorderRadius,_that.entryPaddingHorizontal,_that.entryDividerColor,_that.entryKeyColor,_that.entryKeyFontSize,_that.entrySeparatorColor,_that.entrySeparatorPadding,_that.entryValueFontSize,_that.stringValueColor,_that.numberValueColor,_that.booleanValueColor,_that.nullValueColor,_that.fontFamily,_that.selectedBorderColor,_that.addButtonColor,_that.addButtonBackgroundColor,_that.addButtonSize,_that.addButtonIconSize,_that.addButtonBorderWidth);case _:
  return null;

}
}

}

/// @nodoc


class _NodeCardStyle extends NodeCardStyle {
  const _NodeCardStyle({this.width = 210.0, this.headerHeight = 40.0, this.entryHeight = 28.0, this.borderRadius = 8.0, this.backgroundColor = const Color(0xFFFFFFFF), this.borderColor = const Color(0xFFE1E4E8), this.borderWidth = 1.0, this.shadowColor = const Color(0x0D000000), this.shadowBlurRadius = 8.0, this.shadowOffset = const Offset(0, 2), this.headerBackgroundColor = const Color(0xFFF6F8FA), this.headerPaddingHorizontal = 10.0, this.typeBadgeBackgroundColor = const Color(0xFFF1F8FF), this.typeBadgeTextColor = const Color(0xFF0366D6), this.typeBadgeFontSize = 10.0, this.typeBadgeBorderRadius = 4.0, this.badgeLabelGap = 8.0, this.labelColor = const Color(0xFF24292E), this.labelFontSize = 12.0, this.labelFontWeight = FontWeight.w600, this.collapseIconColor = const Color(0xFF6A737D), this.collapseIconSize = 14.0, this.collapseIconBackgroundColor = const Color(0xFFF1F8FF), this.collapseIconBorderRadius = 4.0, this.entryPaddingHorizontal = 12.0, this.entryDividerColor = const Color(0xFFF0F2F4), this.entryKeyColor = const Color(0xFF6A737D), this.entryKeyFontSize = 11.0, this.entrySeparatorColor = const Color(0xFFBEC4CB), this.entrySeparatorPadding = 4.0, this.entryValueFontSize = 11.0, this.stringValueColor = const Color(0xFF22863A), this.numberValueColor = const Color(0xFF005CC5), this.booleanValueColor = const Color(0xFF6F42C1), this.nullValueColor = const Color(0xFF6A737D), this.fontFamily = 'monospace', this.selectedBorderColor = const Color(0xFF0366D6), this.addButtonColor = const Color(0xFF0366D6), this.addButtonBackgroundColor = const Color(0xFFF1F8FF), this.addButtonSize = 26.0, this.addButtonIconSize = 14.0, this.addButtonBorderWidth = 1.5}): super._();
  

/// 카드 고정 너비(px).
/// tree_layout의 수평 간격 계산에도 사용되므로 바꾸면 layoutTree 재호출 필요.
@override@JsonKey() final  double width;
/// 카드 헤더 영역 높이(px).
/// nodeHeight 계산에 포함되므로 바꾸면 layoutTree 재호출 필요.
@override@JsonKey() final  double headerHeight;
/// key-value 행 하나의 높이(px).
/// nodeHeight = headerHeight + entries.length × entryHeight + borderWidth×2.
@override@JsonKey() final  double entryHeight;
/// 카드 모서리 둥글기 반지름(px). 0이면 직각.
@override@JsonKey() final  double borderRadius;
/// 카드 내부 배경색.
@override@JsonKey() final  Color backgroundColor;
/// 카드 테두리 색.
@override@JsonKey() final  Color borderColor;
/// 카드 테두리 두께(px).
@override@JsonKey() final  double borderWidth;
/// 카드 아래 그림자 색상.
@override@JsonKey() final  Color shadowColor;
/// 그림자 번짐 반경(px).
@override@JsonKey() final  double shadowBlurRadius;
/// 그림자 위치 오프셋.
@override@JsonKey() final  Offset shadowOffset;
/// 헤더 배경색.
@override@JsonKey() final  Color headerBackgroundColor;
/// 헤더 내 좌우 내부 패딩(px).
@override@JsonKey() final  double headerPaddingHorizontal;
/// 타입 뱃지 배경색.
@override@JsonKey() final  Color typeBadgeBackgroundColor;
/// 타입 뱃지 텍스트 색.
@override@JsonKey() final  Color typeBadgeTextColor;
/// 타입 뱃지 폰트 크기(pt).
@override@JsonKey() final  double typeBadgeFontSize;
/// 타입 뱃지 모서리 둥글기 반지름(px).
@override@JsonKey() final  double typeBadgeBorderRadius;
/// 타입 뱃지 오른쪽 끝 ~ 라벨 왼쪽 시작 사이 간격(px).
@override@JsonKey() final  double badgeLabelGap;
/// 헤더에 표시되는 키 이름 텍스트 색.
@override@JsonKey() final  Color labelColor;
/// 헤더 키 이름 폰트 크기(pt).
@override@JsonKey() final  double labelFontSize;
/// 헤더 키 이름 폰트 두께.
@override@JsonKey() final  FontWeight labelFontWeight;
/// 접기/펼치기 아이콘 색.
@override@JsonKey() final  Color collapseIconColor;
/// 접기/펼치기 아이콘 크기(px).
@override@JsonKey() final  double collapseIconSize;
/// 접기/펼치기 버튼 배경색.
@override@JsonKey() final  Color collapseIconBackgroundColor;
/// 접기/펼치기 버튼 모서리 둥글기(px).
@override@JsonKey() final  double collapseIconBorderRadius;
/// entry 행 좌우 내부 패딩(px).
@override@JsonKey() final  double entryPaddingHorizontal;
/// 각 entry 행 위에 그려지는 구분선 색.
@override@JsonKey() final  Color entryDividerColor;
/// entry 행의 key 텍스트 색.
@override@JsonKey() final  Color entryKeyColor;
/// entry 행의 key 폰트 크기(pt).
@override@JsonKey() final  double entryKeyFontSize;
/// key와 value 사이 ':' 구분자 색.
@override@JsonKey() final  Color entrySeparatorColor;
/// ':' 구분자 좌우 패딩(px).
@override@JsonKey() final  double entrySeparatorPadding;
/// entry 행의 value 폰트 크기(pt).
@override@JsonKey() final  double entryValueFontSize;
/// JSON string 값 색.
@override@JsonKey() final  Color stringValueColor;
/// JSON number 값 색.
@override@JsonKey() final  Color numberValueColor;
/// JSON boolean 값 색.
@override@JsonKey() final  Color booleanValueColor;
/// JSON null 값 색.
@override@JsonKey() final  Color nullValueColor;
/// 카드 전체에 적용되는 폰트 패밀리.
@override@JsonKey() final  String fontFamily;
/// 사이드 패널에서 선택된 노드 카드의 테두리 색.
@override@JsonKey() final  Color selectedBorderColor;
/// + 버튼 아이콘 및 테두리 색.
@override@JsonKey() final  Color addButtonColor;
/// + 버튼 배경색.
@override@JsonKey() final  Color addButtonBackgroundColor;
/// + 버튼 크기(px, 지름).
@override@JsonKey() final  double addButtonSize;
/// + 버튼 아이콘 크기(px).
@override@JsonKey() final  double addButtonIconSize;
/// + 버튼 테두리 두께(px).
@override@JsonKey() final  double addButtonBorderWidth;

/// Create a copy of NodeCardStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeCardStyleCopyWith<_NodeCardStyle> get copyWith => __$NodeCardStyleCopyWithImpl<_NodeCardStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodeCardStyle&&(identical(other.width, width) || other.width == width)&&(identical(other.headerHeight, headerHeight) || other.headerHeight == headerHeight)&&(identical(other.entryHeight, entryHeight) || other.entryHeight == entryHeight)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.borderColor, borderColor) || other.borderColor == borderColor)&&(identical(other.borderWidth, borderWidth) || other.borderWidth == borderWidth)&&(identical(other.shadowColor, shadowColor) || other.shadowColor == shadowColor)&&(identical(other.shadowBlurRadius, shadowBlurRadius) || other.shadowBlurRadius == shadowBlurRadius)&&(identical(other.shadowOffset, shadowOffset) || other.shadowOffset == shadowOffset)&&(identical(other.headerBackgroundColor, headerBackgroundColor) || other.headerBackgroundColor == headerBackgroundColor)&&(identical(other.headerPaddingHorizontal, headerPaddingHorizontal) || other.headerPaddingHorizontal == headerPaddingHorizontal)&&(identical(other.typeBadgeBackgroundColor, typeBadgeBackgroundColor) || other.typeBadgeBackgroundColor == typeBadgeBackgroundColor)&&(identical(other.typeBadgeTextColor, typeBadgeTextColor) || other.typeBadgeTextColor == typeBadgeTextColor)&&(identical(other.typeBadgeFontSize, typeBadgeFontSize) || other.typeBadgeFontSize == typeBadgeFontSize)&&(identical(other.typeBadgeBorderRadius, typeBadgeBorderRadius) || other.typeBadgeBorderRadius == typeBadgeBorderRadius)&&(identical(other.badgeLabelGap, badgeLabelGap) || other.badgeLabelGap == badgeLabelGap)&&(identical(other.labelColor, labelColor) || other.labelColor == labelColor)&&(identical(other.labelFontSize, labelFontSize) || other.labelFontSize == labelFontSize)&&(identical(other.labelFontWeight, labelFontWeight) || other.labelFontWeight == labelFontWeight)&&(identical(other.collapseIconColor, collapseIconColor) || other.collapseIconColor == collapseIconColor)&&(identical(other.collapseIconSize, collapseIconSize) || other.collapseIconSize == collapseIconSize)&&(identical(other.collapseIconBackgroundColor, collapseIconBackgroundColor) || other.collapseIconBackgroundColor == collapseIconBackgroundColor)&&(identical(other.collapseIconBorderRadius, collapseIconBorderRadius) || other.collapseIconBorderRadius == collapseIconBorderRadius)&&(identical(other.entryPaddingHorizontal, entryPaddingHorizontal) || other.entryPaddingHorizontal == entryPaddingHorizontal)&&(identical(other.entryDividerColor, entryDividerColor) || other.entryDividerColor == entryDividerColor)&&(identical(other.entryKeyColor, entryKeyColor) || other.entryKeyColor == entryKeyColor)&&(identical(other.entryKeyFontSize, entryKeyFontSize) || other.entryKeyFontSize == entryKeyFontSize)&&(identical(other.entrySeparatorColor, entrySeparatorColor) || other.entrySeparatorColor == entrySeparatorColor)&&(identical(other.entrySeparatorPadding, entrySeparatorPadding) || other.entrySeparatorPadding == entrySeparatorPadding)&&(identical(other.entryValueFontSize, entryValueFontSize) || other.entryValueFontSize == entryValueFontSize)&&(identical(other.stringValueColor, stringValueColor) || other.stringValueColor == stringValueColor)&&(identical(other.numberValueColor, numberValueColor) || other.numberValueColor == numberValueColor)&&(identical(other.booleanValueColor, booleanValueColor) || other.booleanValueColor == booleanValueColor)&&(identical(other.nullValueColor, nullValueColor) || other.nullValueColor == nullValueColor)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.selectedBorderColor, selectedBorderColor) || other.selectedBorderColor == selectedBorderColor)&&(identical(other.addButtonColor, addButtonColor) || other.addButtonColor == addButtonColor)&&(identical(other.addButtonBackgroundColor, addButtonBackgroundColor) || other.addButtonBackgroundColor == addButtonBackgroundColor)&&(identical(other.addButtonSize, addButtonSize) || other.addButtonSize == addButtonSize)&&(identical(other.addButtonIconSize, addButtonIconSize) || other.addButtonIconSize == addButtonIconSize)&&(identical(other.addButtonBorderWidth, addButtonBorderWidth) || other.addButtonBorderWidth == addButtonBorderWidth));
}


@override
int get hashCode => Object.hashAll([runtimeType,width,headerHeight,entryHeight,borderRadius,backgroundColor,borderColor,borderWidth,shadowColor,shadowBlurRadius,shadowOffset,headerBackgroundColor,headerPaddingHorizontal,typeBadgeBackgroundColor,typeBadgeTextColor,typeBadgeFontSize,typeBadgeBorderRadius,badgeLabelGap,labelColor,labelFontSize,labelFontWeight,collapseIconColor,collapseIconSize,collapseIconBackgroundColor,collapseIconBorderRadius,entryPaddingHorizontal,entryDividerColor,entryKeyColor,entryKeyFontSize,entrySeparatorColor,entrySeparatorPadding,entryValueFontSize,stringValueColor,numberValueColor,booleanValueColor,nullValueColor,fontFamily,selectedBorderColor,addButtonColor,addButtonBackgroundColor,addButtonSize,addButtonIconSize,addButtonBorderWidth]);

@override
String toString() {
  return 'NodeCardStyle(width: $width, headerHeight: $headerHeight, entryHeight: $entryHeight, borderRadius: $borderRadius, backgroundColor: $backgroundColor, borderColor: $borderColor, borderWidth: $borderWidth, shadowColor: $shadowColor, shadowBlurRadius: $shadowBlurRadius, shadowOffset: $shadowOffset, headerBackgroundColor: $headerBackgroundColor, headerPaddingHorizontal: $headerPaddingHorizontal, typeBadgeBackgroundColor: $typeBadgeBackgroundColor, typeBadgeTextColor: $typeBadgeTextColor, typeBadgeFontSize: $typeBadgeFontSize, typeBadgeBorderRadius: $typeBadgeBorderRadius, badgeLabelGap: $badgeLabelGap, labelColor: $labelColor, labelFontSize: $labelFontSize, labelFontWeight: $labelFontWeight, collapseIconColor: $collapseIconColor, collapseIconSize: $collapseIconSize, collapseIconBackgroundColor: $collapseIconBackgroundColor, collapseIconBorderRadius: $collapseIconBorderRadius, entryPaddingHorizontal: $entryPaddingHorizontal, entryDividerColor: $entryDividerColor, entryKeyColor: $entryKeyColor, entryKeyFontSize: $entryKeyFontSize, entrySeparatorColor: $entrySeparatorColor, entrySeparatorPadding: $entrySeparatorPadding, entryValueFontSize: $entryValueFontSize, stringValueColor: $stringValueColor, numberValueColor: $numberValueColor, booleanValueColor: $booleanValueColor, nullValueColor: $nullValueColor, fontFamily: $fontFamily, selectedBorderColor: $selectedBorderColor, addButtonColor: $addButtonColor, addButtonBackgroundColor: $addButtonBackgroundColor, addButtonSize: $addButtonSize, addButtonIconSize: $addButtonIconSize, addButtonBorderWidth: $addButtonBorderWidth)';
}


}

/// @nodoc
abstract mixin class _$NodeCardStyleCopyWith<$Res> implements $NodeCardStyleCopyWith<$Res> {
  factory _$NodeCardStyleCopyWith(_NodeCardStyle value, $Res Function(_NodeCardStyle) _then) = __$NodeCardStyleCopyWithImpl;
@override @useResult
$Res call({
 double width, double headerHeight, double entryHeight, double borderRadius, Color backgroundColor, Color borderColor, double borderWidth, Color shadowColor, double shadowBlurRadius, Offset shadowOffset, Color headerBackgroundColor, double headerPaddingHorizontal, Color typeBadgeBackgroundColor, Color typeBadgeTextColor, double typeBadgeFontSize, double typeBadgeBorderRadius, double badgeLabelGap, Color labelColor, double labelFontSize, FontWeight labelFontWeight, Color collapseIconColor, double collapseIconSize, Color collapseIconBackgroundColor, double collapseIconBorderRadius, double entryPaddingHorizontal, Color entryDividerColor, Color entryKeyColor, double entryKeyFontSize, Color entrySeparatorColor, double entrySeparatorPadding, double entryValueFontSize, Color stringValueColor, Color numberValueColor, Color booleanValueColor, Color nullValueColor, String fontFamily, Color selectedBorderColor, Color addButtonColor, Color addButtonBackgroundColor, double addButtonSize, double addButtonIconSize, double addButtonBorderWidth
});




}
/// @nodoc
class __$NodeCardStyleCopyWithImpl<$Res>
    implements _$NodeCardStyleCopyWith<$Res> {
  __$NodeCardStyleCopyWithImpl(this._self, this._then);

  final _NodeCardStyle _self;
  final $Res Function(_NodeCardStyle) _then;

/// Create a copy of NodeCardStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = null,Object? headerHeight = null,Object? entryHeight = null,Object? borderRadius = null,Object? backgroundColor = null,Object? borderColor = null,Object? borderWidth = null,Object? shadowColor = null,Object? shadowBlurRadius = null,Object? shadowOffset = null,Object? headerBackgroundColor = null,Object? headerPaddingHorizontal = null,Object? typeBadgeBackgroundColor = null,Object? typeBadgeTextColor = null,Object? typeBadgeFontSize = null,Object? typeBadgeBorderRadius = null,Object? badgeLabelGap = null,Object? labelColor = null,Object? labelFontSize = null,Object? labelFontWeight = null,Object? collapseIconColor = null,Object? collapseIconSize = null,Object? collapseIconBackgroundColor = null,Object? collapseIconBorderRadius = null,Object? entryPaddingHorizontal = null,Object? entryDividerColor = null,Object? entryKeyColor = null,Object? entryKeyFontSize = null,Object? entrySeparatorColor = null,Object? entrySeparatorPadding = null,Object? entryValueFontSize = null,Object? stringValueColor = null,Object? numberValueColor = null,Object? booleanValueColor = null,Object? nullValueColor = null,Object? fontFamily = null,Object? selectedBorderColor = null,Object? addButtonColor = null,Object? addButtonBackgroundColor = null,Object? addButtonSize = null,Object? addButtonIconSize = null,Object? addButtonBorderWidth = null,}) {
  return _then(_NodeCardStyle(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,headerHeight: null == headerHeight ? _self.headerHeight : headerHeight // ignore: cast_nullable_to_non_nullable
as double,entryHeight: null == entryHeight ? _self.entryHeight : entryHeight // ignore: cast_nullable_to_non_nullable
as double,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,borderColor: null == borderColor ? _self.borderColor : borderColor // ignore: cast_nullable_to_non_nullable
as Color,borderWidth: null == borderWidth ? _self.borderWidth : borderWidth // ignore: cast_nullable_to_non_nullable
as double,shadowColor: null == shadowColor ? _self.shadowColor : shadowColor // ignore: cast_nullable_to_non_nullable
as Color,shadowBlurRadius: null == shadowBlurRadius ? _self.shadowBlurRadius : shadowBlurRadius // ignore: cast_nullable_to_non_nullable
as double,shadowOffset: null == shadowOffset ? _self.shadowOffset : shadowOffset // ignore: cast_nullable_to_non_nullable
as Offset,headerBackgroundColor: null == headerBackgroundColor ? _self.headerBackgroundColor : headerBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,headerPaddingHorizontal: null == headerPaddingHorizontal ? _self.headerPaddingHorizontal : headerPaddingHorizontal // ignore: cast_nullable_to_non_nullable
as double,typeBadgeBackgroundColor: null == typeBadgeBackgroundColor ? _self.typeBadgeBackgroundColor : typeBadgeBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,typeBadgeTextColor: null == typeBadgeTextColor ? _self.typeBadgeTextColor : typeBadgeTextColor // ignore: cast_nullable_to_non_nullable
as Color,typeBadgeFontSize: null == typeBadgeFontSize ? _self.typeBadgeFontSize : typeBadgeFontSize // ignore: cast_nullable_to_non_nullable
as double,typeBadgeBorderRadius: null == typeBadgeBorderRadius ? _self.typeBadgeBorderRadius : typeBadgeBorderRadius // ignore: cast_nullable_to_non_nullable
as double,badgeLabelGap: null == badgeLabelGap ? _self.badgeLabelGap : badgeLabelGap // ignore: cast_nullable_to_non_nullable
as double,labelColor: null == labelColor ? _self.labelColor : labelColor // ignore: cast_nullable_to_non_nullable
as Color,labelFontSize: null == labelFontSize ? _self.labelFontSize : labelFontSize // ignore: cast_nullable_to_non_nullable
as double,labelFontWeight: null == labelFontWeight ? _self.labelFontWeight : labelFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight,collapseIconColor: null == collapseIconColor ? _self.collapseIconColor : collapseIconColor // ignore: cast_nullable_to_non_nullable
as Color,collapseIconSize: null == collapseIconSize ? _self.collapseIconSize : collapseIconSize // ignore: cast_nullable_to_non_nullable
as double,collapseIconBackgroundColor: null == collapseIconBackgroundColor ? _self.collapseIconBackgroundColor : collapseIconBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,collapseIconBorderRadius: null == collapseIconBorderRadius ? _self.collapseIconBorderRadius : collapseIconBorderRadius // ignore: cast_nullable_to_non_nullable
as double,entryPaddingHorizontal: null == entryPaddingHorizontal ? _self.entryPaddingHorizontal : entryPaddingHorizontal // ignore: cast_nullable_to_non_nullable
as double,entryDividerColor: null == entryDividerColor ? _self.entryDividerColor : entryDividerColor // ignore: cast_nullable_to_non_nullable
as Color,entryKeyColor: null == entryKeyColor ? _self.entryKeyColor : entryKeyColor // ignore: cast_nullable_to_non_nullable
as Color,entryKeyFontSize: null == entryKeyFontSize ? _self.entryKeyFontSize : entryKeyFontSize // ignore: cast_nullable_to_non_nullable
as double,entrySeparatorColor: null == entrySeparatorColor ? _self.entrySeparatorColor : entrySeparatorColor // ignore: cast_nullable_to_non_nullable
as Color,entrySeparatorPadding: null == entrySeparatorPadding ? _self.entrySeparatorPadding : entrySeparatorPadding // ignore: cast_nullable_to_non_nullable
as double,entryValueFontSize: null == entryValueFontSize ? _self.entryValueFontSize : entryValueFontSize // ignore: cast_nullable_to_non_nullable
as double,stringValueColor: null == stringValueColor ? _self.stringValueColor : stringValueColor // ignore: cast_nullable_to_non_nullable
as Color,numberValueColor: null == numberValueColor ? _self.numberValueColor : numberValueColor // ignore: cast_nullable_to_non_nullable
as Color,booleanValueColor: null == booleanValueColor ? _self.booleanValueColor : booleanValueColor // ignore: cast_nullable_to_non_nullable
as Color,nullValueColor: null == nullValueColor ? _self.nullValueColor : nullValueColor // ignore: cast_nullable_to_non_nullable
as Color,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,selectedBorderColor: null == selectedBorderColor ? _self.selectedBorderColor : selectedBorderColor // ignore: cast_nullable_to_non_nullable
as Color,addButtonColor: null == addButtonColor ? _self.addButtonColor : addButtonColor // ignore: cast_nullable_to_non_nullable
as Color,addButtonBackgroundColor: null == addButtonBackgroundColor ? _self.addButtonBackgroundColor : addButtonBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,addButtonSize: null == addButtonSize ? _self.addButtonSize : addButtonSize // ignore: cast_nullable_to_non_nullable
as double,addButtonIconSize: null == addButtonIconSize ? _self.addButtonIconSize : addButtonIconSize // ignore: cast_nullable_to_non_nullable
as double,addButtonBorderWidth: null == addButtonBorderWidth ? _self.addButtonBorderWidth : addButtonBorderWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
