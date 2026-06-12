import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/styles/atom-one-dark.dart';

import '../models/style/add_child_dialog_style.dart';
import '../models/style/edge_style.dart';
import '../models/style/editor_panel_style.dart';
import '../models/style/graph_panel_style.dart';
import '../models/style/graph_toolbar_style.dart';
import '../models/style/json_editor_style.dart';
import '../models/style/json_editor_tab_bar_style.dart';
import '../models/style/node_card_style.dart';
import '../models/style/node_detail_style.dart';
import '../models/style/split_view_style.dart';

/// 라이트/다크 테마 프리셋.
/// [JsonEditorWidget]의 style(라이트) / darkStyle(다크) 기본값으로 사용된다.
class JsonEditorThemes {
  JsonEditorThemes._();

  /// 기본 라이트 테마 (GitHub Light 팔레트). 각 스타일 클래스의 기본값과 동일.
  static const JsonEditorStyle light = JsonEditorStyle();

  /// 다크 테마 (GitHub Dark 팔레트).
  static final JsonEditorStyle dark = JsonEditorStyle(
    nodeCard: const NodeCardStyle(
      backgroundColor: Color(0xFF161B22),
      borderColor: Color(0xFF30363D),
      shadowColor: Color(0x66000000),
      headerBackgroundColor: Color(0xFF21262D),
      typeBadgeBackgroundColor: Color(0x1A388BFD),
      typeBadgeTextColor: Color(0xFF58A6FF),
      labelColor: Color(0xFFE6EDF3),
      collapseIconColor: Color(0xFF8B949E),
      collapseIconBackgroundColor: Color(0x1A388BFD),
      entryDividerColor: Color(0xFF21262D),
      entryKeyColor: Color(0xFF8B949E),
      entrySeparatorColor: Color(0xFF484F58),
      stringValueColor: Color(0xFF7EE787),
      numberValueColor: Color(0xFF79C0FF),
      booleanValueColor: Color(0xFFD2A8FF),
      nullValueColor: Color(0xFF8B949E),
      selectedBorderColor: Color(0xFF58A6FF),
      addButtonColor: Color(0xFF58A6FF),
      addButtonBackgroundColor: Color(0x1A388BFD),
      searchMatchBorderColor: Color(0xFFD29922),
      searchMatchShadowColor: Color(0x40D29922),
      searchMatchEntryBackgroundColor: Color(0x33BB8009),
    ),
    nodeDetail: const NodeDetailStyle(
      backgroundColor: Color(0xFF161B22),
      dividerColor: Color(0xFF30363D),
      headerBadgeBackgroundColor: Color(0xFF21262D),
      headerBadgeTextColor: Color(0xFF58A6FF),
      titleColor: Color(0xFFE6EDF3),
      closeIconColor: Color(0xFFF85149),
      propertiesLabelColor: Color(0xFF8B949E),
      metaLabelColor: Color(0xFF8B949E),
      metaValueColor: Color(0xFFC9D1D9),
      entryTileBackgroundColor: Color(0xFF21262D),
      entryKeyColor: Color(0xFFC9D1D9),
      entrySeparatorColor: Color(0xFF484F58),
      stringValueColor: Color(0xFF7EE787),
      numberValueColor: Color(0xFF79C0FF),
      booleanValueColor: Color(0xFFD2A8FF),
      nullValueColor: Color(0xFF8B949E),
      typeBadgeBackgroundColor: Color(0xFF30363D),
      typeBadgeTextColor: Color(0xFF8B949E),
      panelShadowColor: Color(0x66000000),
      deleteIconColor: Color(0xFFF85149),
    ),
    edge: const EdgeStyle(lineColor: Color(0xFF30363D)),
    graphPanel: const GraphPanelStyle(
      backgroundColor: Color(0xFF0D1117),
      minorGridColor: Color(0xFF161B22),
      majorGridColor: Color(0xFF21262D),
      emptyStateTextColor: Color(0xFF8B949E),
      errorTextColor: Color(0xFFF85149),
    ),
    graphToolbar: const GraphToolbarStyle(
      backgroundColor: Color(0xFF21262D),
      shadowColor: Color(0x66000000),
      dividerColor: Color(0xFF30363D),
      iconColor: Color(0xFF8B949E),
      activeIconColor: Color(0xFF58A6FF),
      searchBarBackgroundColor: Color(0xFF21262D),
      searchBarShadowColor: Color(0x66000000),
      searchBarTextColor: Color(0xFFC9D1D9),
      searchBarHintColor: Color(0xFF8B949E),
      chipIdleBackgroundColor: Color(0xFF30363D),
      chipIdleTextColor: Color(0xFF8B949E),
      chipActiveTextColor: Color(0xFFFFFFFF),
    ),
    splitView: const SplitViewStyle(dividerColor: Color(0xFF30363D)),
    editorPanel: EditorPanelStyle(
      toolbarBackgroundColor: const Color(0xFF161B22),
      toolbarTitleColor: const Color(0xFF8B949E),
      toolbarIconColor: const Color(0xFF8B949E),
      codeBackgroundColor: const Color(0xFF0D1117),
      codeTextColor: const Color(0xFFC9D1D9),
      cursorColor: const Color(0xFF58A6FF),
      selectionColor: const Color(0x4458A6FF),
      cursorLineColor: const Color(0x0DFFFFFF),
      codeTheme: CodeHighlightTheme(
        languages: {'json': CodeHighlightThemeMode(mode: langJson)},
        theme: atomOneDarkTheme,
      ),
      lineNumberBackgroundColor: const Color(0xFF161B22),
      lineNumberTextColor: const Color(0xFF484F58),
      lineNumberFocusedTextColor: const Color(0xFF8B949E),
      separatorColor: const Color(0xFF30363D),
      errorBarBackgroundColor: const Color(0xFF2D1214),
      errorBarTextColor: const Color(0xFFF85149),
    ),
    addChildDialog: const AddChildDialogStyle(
      backgroundColor: Color(0xFF161B22),
      dividerColor: Color(0xFF30363D),
      titleColor: Color(0xFFE6EDF3),
      closeIconColor: Color(0xFF8B949E),
      sectionLabelColor: Color(0xFF8B949E),
      keyFieldBorderColor: Color(0xFF30363D),
      keyFieldFocusedBorderColor: Color(0xFF58A6FF),
      keyFieldTextColor: Color(0xFFC9D1D9),
      chipIdleBackgroundColor: Color(0xFF21262D),
      chipActiveBackgroundColor: Color(0x1A388BFD),
      chipActiveBorderColor: Color(0xFF58A6FF),
      chipIdleTextColor: Color(0xFF8B949E),
      chipActiveTextColor: Color(0xFF58A6FF),
      cancelTextColor: Color(0xFF8B949E),
      confirmBackgroundColor: Color(0xFF1F6FEB),
      confirmTextColor: Color(0xFFFFFFFF),
      errorBorderColor: Color(0xFFF85149),
    ),
  );

  /// 다크 테마용 탭 바 스타일. [JsonEditorTabView.tabBarStyle]에 전달.
  static const JsonEditorTabBarStyle darkTabBar = JsonEditorTabBarStyle(
    backgroundColor: Color(0xFF010409),
    activeTabColor: Color(0xFF0D1117),
    inactiveTabColor: Color(0xFF161B22),
    activeTabShadowColor: Color(0x66000000),
    activeTextColor: Color(0xFFE6EDF3),
    inactiveTextColor: Color(0xFF8B949E),
    activeCloseIconColor: Color(0xFF8B949E),
    inactiveCloseIconColor: Color(0xFF6E7681),
    addIconColor: Color(0xFF8B949E),
  );
}
