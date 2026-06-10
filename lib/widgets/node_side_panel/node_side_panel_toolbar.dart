import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/node_detail_style.dart';

// 사이드 패널 헤더 하단 액션 버튼 툴바
class NodeSidePanelToolbar extends StatelessWidget {
  final String jsonText;
  final List<String> nodePath;
  final NodeDetailStyle style;

  const NodeSidePanelToolbar({
    super.key,
    required this.jsonText,
    required this.nodePath,
    required this.style,
  });

  // nodePath 기준으로 JSON 서브트리를 추출해 클립보드에 복사
  void _copyNodeJson() {
    try {
      final dynamic decoded = jsonDecode(jsonText);
      dynamic current = decoded;
      for (final key in nodePath) {
        current = current is List ? current[int.parse(key)] : current[key];
      }
      Clipboard.setData(
        ClipboardData(
          text: const JsonEncoder.withIndent('  ').convert(current),
        ),
      );
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final s = style;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          TextButton.icon(
            onPressed: _copyNodeJson,
            icon: const Icon(Icons.content_copy, size: 14),
            label: const Text('Copy'),
            style: TextButton.styleFrom(
              foregroundColor: s.metaLabelColor,
              textStyle: TextStyle(
                fontSize: s.metaLabelFontSize,
                fontFamily: s.fontFamily,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
