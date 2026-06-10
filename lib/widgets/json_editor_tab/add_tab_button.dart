import 'package:flutter/material.dart';

class AddTabButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddTabButton({super.key, required this.onTap});

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
