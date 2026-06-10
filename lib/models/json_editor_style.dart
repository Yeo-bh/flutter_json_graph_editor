import 'package:freezed_annotation/freezed_annotation.dart';

import 'add_child_dialog_style.dart';
import 'edge_style.dart';
import 'editor_panel_style.dart';
import 'graph_panel_style.dart';
import 'graph_toolbar_style.dart';
import 'node_card_style.dart';
import 'node_detail_style.dart';
import 'split_view_style.dart';

part 'json_editor_style.freezed.dart';

/// JSON 에디터 전체의 시각적 옵션을 한곳에서 관리하는 번들 스타일.
/// [JsonEditorWidget]에 이 하나만 전달하면 모든 하위 위젯의 테마가 바뀜.
@freezed
abstract class JsonEditorStyle with _$JsonEditorStyle {
  const factory JsonEditorStyle({
    /// 노드 카드 스타일.
    @Default(NodeCardStyle()) NodeCardStyle nodeCard,

    /// 노드 상세 사이드 패널 스타일.
    @Default(NodeDetailStyle()) NodeDetailStyle nodeDetail,

    /// 노드 연결선(엣지) 스타일.
    @Default(EdgeStyle()) EdgeStyle edge,

    /// 그래프 패널(캔버스 영역) 스타일.
    @Default(GraphPanelStyle()) GraphPanelStyle graphPanel,

    /// 그래프 패널 하단 툴바 스타일.
    @Default(GraphToolbarStyle()) GraphToolbarStyle graphToolbar,

    /// 좌우 분할 뷰 스타일.
    @Default(SplitViewStyle()) SplitViewStyle splitView,

    /// 좌측 JSON 코드 에디터 패널 스타일.
    @Default(EditorPanelStyle()) EditorPanelStyle editorPanel,

    /// 자식 추가 다이얼로그 스타일.
    @Default(AddChildDialogStyle()) AddChildDialogStyle addChildDialog,

    /// true면 파싱 시 root 제외 모든 자식 노드를 접힌 상태로 초기화.
    @Default(true) bool collapseChildrenByDefault,

    /// true면 파싱 시 root 제외 모든 노드의 entries를 접힌 상태로 초기화.
    @Default(true) bool collapseEntriesByDefault,
  }) = _JsonEditorStyle;
}
