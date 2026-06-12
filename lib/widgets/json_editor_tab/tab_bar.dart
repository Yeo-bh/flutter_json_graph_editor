import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../models/style/json_editor_tab_bar_style.dart';
import '../../state/json_editor_tab_controller.dart';
import 'add_tab_button.dart';
import 'tab_item.dart';

class JsonEditorTabBar extends StatelessWidget {
  final JsonEditorTabController controller;
  final JsonEditorTabBarStyle style;

  const JsonEditorTabBar({
    super.key,
    required this.controller,
    this.style = const JsonEditorTabBarStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      color: style.backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                },
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.tabs.length,
                itemBuilder: (context, i) {
                  final tab = controller.tabs[i];
                  final isActive = i == controller.activeIndex;
                  return TabItem(
                    label: tab.name,
                    isActive: isActive,
                    style: style,
                    onTap: () => controller.setActive(i),
                    onRename: (name) => controller.renameTab(tab.id, name),
                    onClose: controller.tabs.length > 1
                        ? () => controller.removeTab(tab.id)
                        : null,
                  );
                },
              ),
            ),
          ),
          AddTabButton(onTap: () => controller.addTab(), iconColor: style.addIconColor),
        ],
      ),
    );
  }
}
