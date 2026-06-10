import 'package:flutter/material.dart';

// 상단 툴바: 타이틀 + Format / Clear 버튼
class EditorToolbar extends StatelessWidget {
  final VoidCallback onClear;
  final VoidCallback onFormat;
  final Color toolbarBackgroundColor;
  final Color toolbarTitleColor;
  final Color toolbarIconColor;

  const EditorToolbar({
    super.key,
    required this.onClear,
    required this.onFormat,
    required this.toolbarBackgroundColor,
    required this.toolbarTitleColor,
    required this.toolbarIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: toolbarBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(Icons.data_object, size: 14, color: toolbarIconColor),
          const SizedBox(width: 8),
          Text(
            'JSON',
            style: TextStyle(
              color: toolbarTitleColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onFormat,
            tooltip: 'Format JSON',
            icon: const Icon(Icons.format_align_left),
            color: toolbarIconColor,
            iconSize: 17,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightFor(width: 32, height: 32),
          ),
          TextButton(
            onPressed: onClear,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Clear',
              style: TextStyle(color: toolbarIconColor, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
