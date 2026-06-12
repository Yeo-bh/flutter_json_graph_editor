import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/style/node_detail_style.dart';

/// 사이드 패널 상단 헤더.
/// 노드 타입 배지([ ] / { }), 레이블(더블클릭 편집), 닫기 버튼으로 구성된다.
class NodeSidePanelHeader extends StatelessWidget {
  final JsonNode node;
  final NodeDetailStyle style;
  final bool isEditingLabel;
  final TextEditingController? labelController;
  final VoidCallback onClose;
  /// null이면 편집 불가(List 인덱스 노드)
  final VoidCallback? onStartEdit;
  final VoidCallback onSaveEdit;
  final VoidCallback onCancelEdit;

  const NodeSidePanelHeader({
    super.key,
    required this.node,
    required this.style,
    required this.isEditingLabel,
    required this.labelController,
    required this.onClose,
    required this.onStartEdit,
    required this.onSaveEdit,
    required this.onCancelEdit,
  });

  @override
  Widget build(BuildContext context) {
    final s = style;
    final labelWidget = isEditingLabel
        ? TextField(
            controller: labelController,
            autofocus: true,
            style: TextStyle(
              color: s.titleColor,
              fontSize: s.titleFontSize,
              fontWeight: s.titleFontWeight,
              fontFamily: s.fontFamily,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: s.dividerColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: s.headerBadgeTextColor),
              ),
            ),
            onSubmitted: (_) => onSaveEdit(),
            onTapOutside: (_) => onCancelEdit(),
          )
        : GestureDetector(
            onDoubleTap: onStartEdit,
            child: Text(
              node.label,
              style: TextStyle(
                color: s.titleColor,
                fontSize: s.titleFontSize,
                fontWeight: s.titleFontWeight,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          );

    return Padding(
      padding: s.headerPadding,
      child: Row(
        children: [
          Container(
            padding: s.headerBadgePadding,
            decoration: BoxDecoration(
              color: s.headerBadgeBackgroundColor,
              borderRadius: BorderRadius.circular(s.headerBadgeBorderRadius),
            ),
            child: Text(
              node.isArray ? '[ ]' : '{ }',
              style: TextStyle(
                color: s.headerBadgeTextColor,
                fontSize: s.headerBadgeFontSize,
                fontFamily: s.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: labelWidget),
          IconButton(
            onPressed: onClose,
            icon: Icon(
              Icons.close,
              size: s.closeIconSize,
              color: s.closeIconColor,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
