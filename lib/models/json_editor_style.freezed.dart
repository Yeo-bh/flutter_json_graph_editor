// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_editor_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JsonEditorStyle {

/// 노드 카드 스타일.
 NodeCardStyle get nodeCard;/// 노드 상세 사이드 패널 스타일.
 NodeDetailStyle get nodeDetail;/// 노드 연결선(엣지) 스타일.
 EdgeStyle get edge;/// 그래프 패널(캔버스 영역) 스타일.
 GraphPanelStyle get graphPanel;/// 그래프 패널 하단 툴바 스타일.
 GraphToolbarStyle get graphToolbar;/// 좌우 분할 뷰 스타일.
 SplitViewStyle get splitView;/// 좌측 JSON 코드 에디터 패널 스타일.
 EditorPanelStyle get editorPanel;/// 자식 추가 다이얼로그 스타일.
 AddChildDialogStyle get addChildDialog;/// true면 파싱 시 root 제외 모든 자식 노드를 접힌 상태로 초기화.
 bool get collapseChildrenByDefault;/// true면 파싱 시 root 제외 모든 노드의 entries를 접힌 상태로 초기화.
 bool get collapseEntriesByDefault;
/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonEditorStyleCopyWith<JsonEditorStyle> get copyWith => _$JsonEditorStyleCopyWithImpl<JsonEditorStyle>(this as JsonEditorStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonEditorStyle&&(identical(other.nodeCard, nodeCard) || other.nodeCard == nodeCard)&&(identical(other.nodeDetail, nodeDetail) || other.nodeDetail == nodeDetail)&&(identical(other.edge, edge) || other.edge == edge)&&(identical(other.graphPanel, graphPanel) || other.graphPanel == graphPanel)&&(identical(other.graphToolbar, graphToolbar) || other.graphToolbar == graphToolbar)&&(identical(other.splitView, splitView) || other.splitView == splitView)&&(identical(other.editorPanel, editorPanel) || other.editorPanel == editorPanel)&&(identical(other.addChildDialog, addChildDialog) || other.addChildDialog == addChildDialog)&&(identical(other.collapseChildrenByDefault, collapseChildrenByDefault) || other.collapseChildrenByDefault == collapseChildrenByDefault)&&(identical(other.collapseEntriesByDefault, collapseEntriesByDefault) || other.collapseEntriesByDefault == collapseEntriesByDefault));
}


@override
int get hashCode => Object.hash(runtimeType,nodeCard,nodeDetail,edge,graphPanel,graphToolbar,splitView,editorPanel,addChildDialog,collapseChildrenByDefault,collapseEntriesByDefault);

@override
String toString() {
  return 'JsonEditorStyle(nodeCard: $nodeCard, nodeDetail: $nodeDetail, edge: $edge, graphPanel: $graphPanel, graphToolbar: $graphToolbar, splitView: $splitView, editorPanel: $editorPanel, addChildDialog: $addChildDialog, collapseChildrenByDefault: $collapseChildrenByDefault, collapseEntriesByDefault: $collapseEntriesByDefault)';
}


}

/// @nodoc
abstract mixin class $JsonEditorStyleCopyWith<$Res>  {
  factory $JsonEditorStyleCopyWith(JsonEditorStyle value, $Res Function(JsonEditorStyle) _then) = _$JsonEditorStyleCopyWithImpl;
@useResult
$Res call({
 NodeCardStyle nodeCard, NodeDetailStyle nodeDetail, EdgeStyle edge, GraphPanelStyle graphPanel, GraphToolbarStyle graphToolbar, SplitViewStyle splitView, EditorPanelStyle editorPanel, AddChildDialogStyle addChildDialog, bool collapseChildrenByDefault, bool collapseEntriesByDefault
});


$NodeCardStyleCopyWith<$Res> get nodeCard;$NodeDetailStyleCopyWith<$Res> get nodeDetail;$EdgeStyleCopyWith<$Res> get edge;$GraphPanelStyleCopyWith<$Res> get graphPanel;$GraphToolbarStyleCopyWith<$Res> get graphToolbar;$SplitViewStyleCopyWith<$Res> get splitView;$EditorPanelStyleCopyWith<$Res> get editorPanel;$AddChildDialogStyleCopyWith<$Res> get addChildDialog;

}
/// @nodoc
class _$JsonEditorStyleCopyWithImpl<$Res>
    implements $JsonEditorStyleCopyWith<$Res> {
  _$JsonEditorStyleCopyWithImpl(this._self, this._then);

  final JsonEditorStyle _self;
  final $Res Function(JsonEditorStyle) _then;

/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nodeCard = null,Object? nodeDetail = null,Object? edge = null,Object? graphPanel = null,Object? graphToolbar = null,Object? splitView = null,Object? editorPanel = null,Object? addChildDialog = null,Object? collapseChildrenByDefault = null,Object? collapseEntriesByDefault = null,}) {
  return _then(_self.copyWith(
nodeCard: null == nodeCard ? _self.nodeCard : nodeCard // ignore: cast_nullable_to_non_nullable
as NodeCardStyle,nodeDetail: null == nodeDetail ? _self.nodeDetail : nodeDetail // ignore: cast_nullable_to_non_nullable
as NodeDetailStyle,edge: null == edge ? _self.edge : edge // ignore: cast_nullable_to_non_nullable
as EdgeStyle,graphPanel: null == graphPanel ? _self.graphPanel : graphPanel // ignore: cast_nullable_to_non_nullable
as GraphPanelStyle,graphToolbar: null == graphToolbar ? _self.graphToolbar : graphToolbar // ignore: cast_nullable_to_non_nullable
as GraphToolbarStyle,splitView: null == splitView ? _self.splitView : splitView // ignore: cast_nullable_to_non_nullable
as SplitViewStyle,editorPanel: null == editorPanel ? _self.editorPanel : editorPanel // ignore: cast_nullable_to_non_nullable
as EditorPanelStyle,addChildDialog: null == addChildDialog ? _self.addChildDialog : addChildDialog // ignore: cast_nullable_to_non_nullable
as AddChildDialogStyle,collapseChildrenByDefault: null == collapseChildrenByDefault ? _self.collapseChildrenByDefault : collapseChildrenByDefault // ignore: cast_nullable_to_non_nullable
as bool,collapseEntriesByDefault: null == collapseEntriesByDefault ? _self.collapseEntriesByDefault : collapseEntriesByDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeCardStyleCopyWith<$Res> get nodeCard {
  
  return $NodeCardStyleCopyWith<$Res>(_self.nodeCard, (value) {
    return _then(_self.copyWith(nodeCard: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeDetailStyleCopyWith<$Res> get nodeDetail {
  
  return $NodeDetailStyleCopyWith<$Res>(_self.nodeDetail, (value) {
    return _then(_self.copyWith(nodeDetail: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EdgeStyleCopyWith<$Res> get edge {
  
  return $EdgeStyleCopyWith<$Res>(_self.edge, (value) {
    return _then(_self.copyWith(edge: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GraphPanelStyleCopyWith<$Res> get graphPanel {
  
  return $GraphPanelStyleCopyWith<$Res>(_self.graphPanel, (value) {
    return _then(_self.copyWith(graphPanel: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GraphToolbarStyleCopyWith<$Res> get graphToolbar {
  
  return $GraphToolbarStyleCopyWith<$Res>(_self.graphToolbar, (value) {
    return _then(_self.copyWith(graphToolbar: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplitViewStyleCopyWith<$Res> get splitView {
  
  return $SplitViewStyleCopyWith<$Res>(_self.splitView, (value) {
    return _then(_self.copyWith(splitView: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EditorPanelStyleCopyWith<$Res> get editorPanel {
  
  return $EditorPanelStyleCopyWith<$Res>(_self.editorPanel, (value) {
    return _then(_self.copyWith(editorPanel: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddChildDialogStyleCopyWith<$Res> get addChildDialog {
  
  return $AddChildDialogStyleCopyWith<$Res>(_self.addChildDialog, (value) {
    return _then(_self.copyWith(addChildDialog: value));
  });
}
}


/// Adds pattern-matching-related methods to [JsonEditorStyle].
extension JsonEditorStylePatterns on JsonEditorStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JsonEditorStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JsonEditorStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JsonEditorStyle value)  $default,){
final _that = this;
switch (_that) {
case _JsonEditorStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JsonEditorStyle value)?  $default,){
final _that = this;
switch (_that) {
case _JsonEditorStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NodeCardStyle nodeCard,  NodeDetailStyle nodeDetail,  EdgeStyle edge,  GraphPanelStyle graphPanel,  GraphToolbarStyle graphToolbar,  SplitViewStyle splitView,  EditorPanelStyle editorPanel,  AddChildDialogStyle addChildDialog,  bool collapseChildrenByDefault,  bool collapseEntriesByDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JsonEditorStyle() when $default != null:
return $default(_that.nodeCard,_that.nodeDetail,_that.edge,_that.graphPanel,_that.graphToolbar,_that.splitView,_that.editorPanel,_that.addChildDialog,_that.collapseChildrenByDefault,_that.collapseEntriesByDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NodeCardStyle nodeCard,  NodeDetailStyle nodeDetail,  EdgeStyle edge,  GraphPanelStyle graphPanel,  GraphToolbarStyle graphToolbar,  SplitViewStyle splitView,  EditorPanelStyle editorPanel,  AddChildDialogStyle addChildDialog,  bool collapseChildrenByDefault,  bool collapseEntriesByDefault)  $default,) {final _that = this;
switch (_that) {
case _JsonEditorStyle():
return $default(_that.nodeCard,_that.nodeDetail,_that.edge,_that.graphPanel,_that.graphToolbar,_that.splitView,_that.editorPanel,_that.addChildDialog,_that.collapseChildrenByDefault,_that.collapseEntriesByDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NodeCardStyle nodeCard,  NodeDetailStyle nodeDetail,  EdgeStyle edge,  GraphPanelStyle graphPanel,  GraphToolbarStyle graphToolbar,  SplitViewStyle splitView,  EditorPanelStyle editorPanel,  AddChildDialogStyle addChildDialog,  bool collapseChildrenByDefault,  bool collapseEntriesByDefault)?  $default,) {final _that = this;
switch (_that) {
case _JsonEditorStyle() when $default != null:
return $default(_that.nodeCard,_that.nodeDetail,_that.edge,_that.graphPanel,_that.graphToolbar,_that.splitView,_that.editorPanel,_that.addChildDialog,_that.collapseChildrenByDefault,_that.collapseEntriesByDefault);case _:
  return null;

}
}

}

/// @nodoc


class _JsonEditorStyle implements JsonEditorStyle {
  const _JsonEditorStyle({this.nodeCard = const NodeCardStyle(), this.nodeDetail = const NodeDetailStyle(), this.edge = const EdgeStyle(), this.graphPanel = const GraphPanelStyle(), this.graphToolbar = const GraphToolbarStyle(), this.splitView = const SplitViewStyle(), this.editorPanel = const EditorPanelStyle(), this.addChildDialog = const AddChildDialogStyle(), this.collapseChildrenByDefault = true, this.collapseEntriesByDefault = true});
  

/// 노드 카드 스타일.
@override@JsonKey() final  NodeCardStyle nodeCard;
/// 노드 상세 사이드 패널 스타일.
@override@JsonKey() final  NodeDetailStyle nodeDetail;
/// 노드 연결선(엣지) 스타일.
@override@JsonKey() final  EdgeStyle edge;
/// 그래프 패널(캔버스 영역) 스타일.
@override@JsonKey() final  GraphPanelStyle graphPanel;
/// 그래프 패널 하단 툴바 스타일.
@override@JsonKey() final  GraphToolbarStyle graphToolbar;
/// 좌우 분할 뷰 스타일.
@override@JsonKey() final  SplitViewStyle splitView;
/// 좌측 JSON 코드 에디터 패널 스타일.
@override@JsonKey() final  EditorPanelStyle editorPanel;
/// 자식 추가 다이얼로그 스타일.
@override@JsonKey() final  AddChildDialogStyle addChildDialog;
/// true면 파싱 시 root 제외 모든 자식 노드를 접힌 상태로 초기화.
@override@JsonKey() final  bool collapseChildrenByDefault;
/// true면 파싱 시 root 제외 모든 노드의 entries를 접힌 상태로 초기화.
@override@JsonKey() final  bool collapseEntriesByDefault;

/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonEditorStyleCopyWith<_JsonEditorStyle> get copyWith => __$JsonEditorStyleCopyWithImpl<_JsonEditorStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonEditorStyle&&(identical(other.nodeCard, nodeCard) || other.nodeCard == nodeCard)&&(identical(other.nodeDetail, nodeDetail) || other.nodeDetail == nodeDetail)&&(identical(other.edge, edge) || other.edge == edge)&&(identical(other.graphPanel, graphPanel) || other.graphPanel == graphPanel)&&(identical(other.graphToolbar, graphToolbar) || other.graphToolbar == graphToolbar)&&(identical(other.splitView, splitView) || other.splitView == splitView)&&(identical(other.editorPanel, editorPanel) || other.editorPanel == editorPanel)&&(identical(other.addChildDialog, addChildDialog) || other.addChildDialog == addChildDialog)&&(identical(other.collapseChildrenByDefault, collapseChildrenByDefault) || other.collapseChildrenByDefault == collapseChildrenByDefault)&&(identical(other.collapseEntriesByDefault, collapseEntriesByDefault) || other.collapseEntriesByDefault == collapseEntriesByDefault));
}


@override
int get hashCode => Object.hash(runtimeType,nodeCard,nodeDetail,edge,graphPanel,graphToolbar,splitView,editorPanel,addChildDialog,collapseChildrenByDefault,collapseEntriesByDefault);

@override
String toString() {
  return 'JsonEditorStyle(nodeCard: $nodeCard, nodeDetail: $nodeDetail, edge: $edge, graphPanel: $graphPanel, graphToolbar: $graphToolbar, splitView: $splitView, editorPanel: $editorPanel, addChildDialog: $addChildDialog, collapseChildrenByDefault: $collapseChildrenByDefault, collapseEntriesByDefault: $collapseEntriesByDefault)';
}


}

/// @nodoc
abstract mixin class _$JsonEditorStyleCopyWith<$Res> implements $JsonEditorStyleCopyWith<$Res> {
  factory _$JsonEditorStyleCopyWith(_JsonEditorStyle value, $Res Function(_JsonEditorStyle) _then) = __$JsonEditorStyleCopyWithImpl;
@override @useResult
$Res call({
 NodeCardStyle nodeCard, NodeDetailStyle nodeDetail, EdgeStyle edge, GraphPanelStyle graphPanel, GraphToolbarStyle graphToolbar, SplitViewStyle splitView, EditorPanelStyle editorPanel, AddChildDialogStyle addChildDialog, bool collapseChildrenByDefault, bool collapseEntriesByDefault
});


@override $NodeCardStyleCopyWith<$Res> get nodeCard;@override $NodeDetailStyleCopyWith<$Res> get nodeDetail;@override $EdgeStyleCopyWith<$Res> get edge;@override $GraphPanelStyleCopyWith<$Res> get graphPanel;@override $GraphToolbarStyleCopyWith<$Res> get graphToolbar;@override $SplitViewStyleCopyWith<$Res> get splitView;@override $EditorPanelStyleCopyWith<$Res> get editorPanel;@override $AddChildDialogStyleCopyWith<$Res> get addChildDialog;

}
/// @nodoc
class __$JsonEditorStyleCopyWithImpl<$Res>
    implements _$JsonEditorStyleCopyWith<$Res> {
  __$JsonEditorStyleCopyWithImpl(this._self, this._then);

  final _JsonEditorStyle _self;
  final $Res Function(_JsonEditorStyle) _then;

/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nodeCard = null,Object? nodeDetail = null,Object? edge = null,Object? graphPanel = null,Object? graphToolbar = null,Object? splitView = null,Object? editorPanel = null,Object? addChildDialog = null,Object? collapseChildrenByDefault = null,Object? collapseEntriesByDefault = null,}) {
  return _then(_JsonEditorStyle(
nodeCard: null == nodeCard ? _self.nodeCard : nodeCard // ignore: cast_nullable_to_non_nullable
as NodeCardStyle,nodeDetail: null == nodeDetail ? _self.nodeDetail : nodeDetail // ignore: cast_nullable_to_non_nullable
as NodeDetailStyle,edge: null == edge ? _self.edge : edge // ignore: cast_nullable_to_non_nullable
as EdgeStyle,graphPanel: null == graphPanel ? _self.graphPanel : graphPanel // ignore: cast_nullable_to_non_nullable
as GraphPanelStyle,graphToolbar: null == graphToolbar ? _self.graphToolbar : graphToolbar // ignore: cast_nullable_to_non_nullable
as GraphToolbarStyle,splitView: null == splitView ? _self.splitView : splitView // ignore: cast_nullable_to_non_nullable
as SplitViewStyle,editorPanel: null == editorPanel ? _self.editorPanel : editorPanel // ignore: cast_nullable_to_non_nullable
as EditorPanelStyle,addChildDialog: null == addChildDialog ? _self.addChildDialog : addChildDialog // ignore: cast_nullable_to_non_nullable
as AddChildDialogStyle,collapseChildrenByDefault: null == collapseChildrenByDefault ? _self.collapseChildrenByDefault : collapseChildrenByDefault // ignore: cast_nullable_to_non_nullable
as bool,collapseEntriesByDefault: null == collapseEntriesByDefault ? _self.collapseEntriesByDefault : collapseEntriesByDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeCardStyleCopyWith<$Res> get nodeCard {
  
  return $NodeCardStyleCopyWith<$Res>(_self.nodeCard, (value) {
    return _then(_self.copyWith(nodeCard: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeDetailStyleCopyWith<$Res> get nodeDetail {
  
  return $NodeDetailStyleCopyWith<$Res>(_self.nodeDetail, (value) {
    return _then(_self.copyWith(nodeDetail: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EdgeStyleCopyWith<$Res> get edge {
  
  return $EdgeStyleCopyWith<$Res>(_self.edge, (value) {
    return _then(_self.copyWith(edge: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GraphPanelStyleCopyWith<$Res> get graphPanel {
  
  return $GraphPanelStyleCopyWith<$Res>(_self.graphPanel, (value) {
    return _then(_self.copyWith(graphPanel: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GraphToolbarStyleCopyWith<$Res> get graphToolbar {
  
  return $GraphToolbarStyleCopyWith<$Res>(_self.graphToolbar, (value) {
    return _then(_self.copyWith(graphToolbar: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplitViewStyleCopyWith<$Res> get splitView {
  
  return $SplitViewStyleCopyWith<$Res>(_self.splitView, (value) {
    return _then(_self.copyWith(splitView: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EditorPanelStyleCopyWith<$Res> get editorPanel {
  
  return $EditorPanelStyleCopyWith<$Res>(_self.editorPanel, (value) {
    return _then(_self.copyWith(editorPanel: value));
  });
}/// Create a copy of JsonEditorStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddChildDialogStyleCopyWith<$Res> get addChildDialog {
  
  return $AddChildDialogStyleCopyWith<$Res>(_self.addChildDialog, (value) {
    return _then(_self.copyWith(addChildDialog: value));
  });
}
}

// dart format on
