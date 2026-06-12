import 'package:flutter/material.dart';
import '../../models/style/json_editor_tab_bar_style.dart';

class TabItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final VoidCallback? onClose;
  final ValueChanged<String> onRename;
  final JsonEditorTabBarStyle style;

  const TabItem({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.onRename,
    this.onClose,
    this.style = const JsonEditorTabBarStyle(),
  });

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  bool _editing = false;
  late final TextEditingController _textCtrl;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textCtrl = TextEditingController(text: widget.label);
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) _commitRename();
    });
  }

  @override
  void didUpdateWidget(TabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_editing && oldWidget.label != widget.label) {
      _textCtrl.text = widget.label;
    }
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _startEditing() {
    setState(() => _editing = true);
    _textCtrl.selection = TextSelection(
      baseOffset: 0,
      extentOffset: _textCtrl.text.length,
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _focusNode.requestFocus(),
    );
  }

  void _commitRename() {
    if (!_editing) return;
    final name = _textCtrl.text.trim();
    setState(() => _editing = false);
    if (name.isNotEmpty && name != widget.label) widget.onRename(name);
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.style;
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTap: _startEditing,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(top: 4, left: 2, right: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: widget.isActive ? s.activeTabColor : s.inactiveTabColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
          boxShadow: widget.isActive
              ? [
                  BoxShadow(
                    color: s.activeTabShadowColor,
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
              child: _editing
                  ? SizedBox(
                      width: 90,
                      height: 20,
                      child: TextField(
                        controller: _textCtrl,
                        focusNode: _focusNode,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: s.activeTextColor,
                        ),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => _commitRename(),
                      ),
                    )
                  : Text(
                      widget.label,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: widget.isActive
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: widget.isActive
                            ? s.activeTextColor
                            : s.inactiveTextColor,
                      ),
                    ),
            ),
            if (widget.onClose != null) ...[
              const SizedBox(width: 6),
              GestureDetector(
                onTap: widget.onClose,
                child: Icon(
                  Icons.close,
                  size: 13,
                  color: widget.isActive
                      ? s.activeCloseIconColor
                      : s.inactiveCloseIconColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
