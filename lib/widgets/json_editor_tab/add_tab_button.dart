import 'package:flutter/material.dart';

class AddTabButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color iconColor;

  const AddTabButton({
    super.key,
    required this.onTap,
    this.iconColor = const Color(0xFF666666),
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '새 탭 추가',
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Icon(Icons.add, size: 18, color: iconColor),
        ),
      ),
    );
  }
}
