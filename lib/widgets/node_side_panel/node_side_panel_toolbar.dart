import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/node_detail_style.dart';

// 사이드 패널 헤더 하단 액션 버튼 툴바
class NodeSidePanelToolbar extends StatelessWidget {
  final String jsonText;
  final List<String> nodePath;
  final NodeDetailStyle style;
  final VoidCallback? onDelete; // null이면 삭제 버튼 비활성 (루트 노드)

  const NodeSidePanelToolbar({
    super.key,
    required this.jsonText,
    required this.nodePath,
    required this.style,
    this.onDelete,
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

  Future<void> _confirmDelete(BuildContext context) async {
    final s = style;
    final buttonStyle = TextStyle(fontFamily: s.fontFamily, fontSize: s.metaValueFontSize);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: s.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(
          '노드 삭제',
          style: TextStyle(
            color: s.titleColor,
            fontSize: s.titleFontSize,
            fontWeight: s.titleFontWeight,
            fontFamily: s.fontFamily,
          ),
        ),
        content: Text(
          '이 노드와 하위 내용을 모두 삭제할까요?',
          style: TextStyle(color: s.metaValueColor, fontFamily: s.fontFamily, fontSize: s.metaValueFontSize),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            style: TextButton.styleFrom(foregroundColor: s.metaLabelColor),
            child: Text('취소', style: buttonStyle),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('삭제', style: buttonStyle),
          ),
        ],
      ),
    );
    if (confirmed == true) onDelete?.call();
  }

  @override
  Widget build(BuildContext context) {
    final s = style;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: _copyNodeJson,
            icon: Icon(Icons.content_copy, size: 16, color: s.metaLabelColor),
            tooltip: 'Copy JSON',
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: onDelete != null ? () => _confirmDelete(context) : null,
            icon: Icon(
              Icons.delete_outline,
              size: 16,
              color: onDelete != null ? Colors.red : s.metaLabelColor.withValues(alpha: 0.3),
            ),
            tooltip: '노드 삭제',
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}
