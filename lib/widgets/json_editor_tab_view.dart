import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/json_editor_style.dart';
import '../state/json_editor_tab_controller.dart';
import 'graph_toolbar/graph_toolbar.dart';
import 'json_editor_widget.dart';
import 'json_editor_tab/tab_bar.dart';

class JsonEditorTabView extends StatefulWidget {
  final JsonEditorTabController controller;
  final JsonEditorStyle style;
  final List<GraphToolbarAction> extraActions;

  JsonEditorTabView({
    super.key,
    required this.controller,
    JsonEditorStyle? style,
    this.extraActions = const [],
  }) : style = style ?? JsonEditorStyle();

  @override
  State<JsonEditorTabView> createState() => _JsonEditorTabViewState();
}

class _JsonEditorTabViewState extends State<JsonEditorTabView> {
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

  @override
  Widget build(BuildContext context) {
    final ctrl = widget.controller;
    return Column(
      children: [
        JsonEditorTabBar(controller: ctrl),
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
