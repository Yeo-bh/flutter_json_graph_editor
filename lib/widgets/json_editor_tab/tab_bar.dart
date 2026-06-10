import 'package:flutter/material.dart';
import '../../state/json_editor_tab_controller.dart';
import 'add_tab_button.dart';
import 'tab_item.dart';

class JsonEditorTabBar extends StatelessWidget {
  final JsonEditorTabController controller;

  const JsonEditorTabBar({super.key, required this.controller});

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
                return TabItem(
                  label: tab.name,
                  isActive: isActive,
                  onTap: () => controller.setActive(i),
                  onRename: (name) => controller.renameTab(tab.id, name),
                  onClose: controller.tabs.length > 1
                      ? () => controller.removeTab(tab.id)
                      : null,
                );
              },
            ),
          ),
          AddTabButton(onTap: () => controller.addTab()),
        ],
      ),
    );
  }
}
