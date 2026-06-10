import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/json_editor_style.dart';
import '../state/json_editor_tab_controller.dart';
import 'graph_toolbar/graph_toolbar.dart';
import 'json_editor_widget.dart';

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
        _TabBar(controller: ctrl),
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

class _TabBar extends StatelessWidget {
  final JsonEditorTabController controller;

  const _TabBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      color: const Color(0xFFF0F0F0),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.tabs.length,
              itemBuilder: (context, i) {
                final tab = controller.tabs[i];
                final isActive = i == controller.activeIndex;
                return _TabItem(
                  label: tab.name,
                  isActive: isActive,
                  onTap: () => controller.setActive(i),
                  onClose: controller.tabs.length > 1
                      ? () => controller.removeTab(tab.id)
                      : null,
                );
              },
            ),
          ),
          _AddTabButton(onTap: () => controller.addTab()),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final VoidCallback? onClose;

  const _TabItem({
    required this.label,
    required this.isActive,
    required this.onTap,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(top: 4, left: 2, right: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : const Color(0xFFE0E0E0),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 2,
                    offset: const Offset(0, -1),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 120),
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  color: isActive
                      ? const Color(0xFF1A1A1A)
                      : const Color(0xFF666666),
                ),
              ),
            ),
            if (onClose != null) ...[
              const SizedBox(width: 6),
              GestureDetector(
                onTap: onClose,
                child: Icon(
                  Icons.close,
                  size: 13,
                  color: isActive
                      ? const Color(0xFF666666)
                      : const Color(0xFF999999),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _AddTabButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddTabButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '새 탭 추가',
      child: InkWell(
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Icon(Icons.add, size: 18, color: Color(0xFF666666)),
        ),
      ),
    );
  }
}
