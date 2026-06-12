import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/json_editor_themes.dart';
import '../models/style/json_editor_style.dart';
import '../models/style/json_editor_tab_bar_style.dart';
import '../state/json_editor_tab_controller.dart';
import 'graph_toolbar/graph_toolbar.dart';
import 'json_editor_widget.dart';
import 'json_editor_tab/tab_bar.dart';

class JsonEditorTabView extends StatefulWidget {
  final JsonEditorTabController controller;
  final JsonEditorStyle style;

  /// 다크 모드 스타일. null이면 JsonEditorWidget 기본값(JsonEditorThemes.dark) 사용.
  final JsonEditorStyle? darkStyle;

  /// true면 각 에디터 툴바에 라이트/다크 토글 버튼 표시.
  final bool enableThemeToggle;

  /// 라이트 모드 탭 바 스타일.
  final JsonEditorTabBarStyle tabBarStyle;

  /// 다크 모드 탭 바 스타일. 기본값은 [JsonEditorThemes.darkTabBar].
  final JsonEditorTabBarStyle darkTabBarStyle;

  final List<GraphToolbarAction> extraActions;

  JsonEditorTabView({
    super.key,
    required this.controller,
    JsonEditorStyle? style,
    this.darkStyle,
    this.enableThemeToggle = true,
    this.tabBarStyle = const JsonEditorTabBarStyle(),
    this.darkTabBarStyle = JsonEditorThemes.darkTabBar,
    this.extraActions = const [],
  }) : style = style ?? JsonEditorStyle();

  @override
  State<JsonEditorTabView> createState() => _JsonEditorTabViewState();
}

class _JsonEditorTabViewState extends State<JsonEditorTabView> {
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(JsonEditorTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onControllerChanged);
      widget.controller.addListener(_onControllerChanged);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() => setState(() {});

  void _toggleTheme() => setState(() => _isDark = !_isDark);

  @override
  Widget build(BuildContext context) {
    final ctrl = widget.controller;
    final tabBarStyle = _isDark ? widget.darkTabBarStyle : widget.tabBarStyle;
    return Column(
      children: [
        JsonEditorTabBar(controller: ctrl, style: tabBarStyle),
        Expanded(
          child: IndexedStack(
            index: ctrl.activeIndex,
            children: [
              for (final tab in ctrl.tabs)
                ChangeNotifierProvider.value(
                  key: ValueKey(tab.id),
                  value: ctrl.stateFor(tab.id)!,
                  child: JsonEditorWidget(
                    key: ValueKey('editor_${tab.id}'),
                    style: widget.style,
                    darkStyle: widget.darkStyle,
                    enableThemeToggle: widget.enableThemeToggle,
                    externalIsDark: _isDark,
                    onThemeToggled: _toggleTheme,
                    extraActions: widget.extraActions,
                    externalState: ctrl.stateFor(tab.id),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
