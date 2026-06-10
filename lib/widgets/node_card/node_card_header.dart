import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/node_card_style.dart';

// 카드 상단 헤더: 타입 뱃지 + 라벨 + 자식 접기/펼치기 버튼
// onToggleEntries가 있으면 헤더 전체 클릭 → entries 접기/펼치기
class NodeCardHeader extends StatelessWidget {
  final JsonNode node;
  final VoidCallback onToggle;
  final VoidCallback? onToggleEntries; // null이면 헤더 클릭 비활성
  final NodeCardStyle style;

  const NodeCardHeader({
    super.key,
    required this.node,
    required this.onToggle,
    required this.onToggleEntries,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final hasChildren = node.children.isNotEmpty;
    final inner = Container(
      height: style.headerHeight,
      padding: EdgeInsets.symmetric(
        horizontal: style.headerPaddingHorizontal,
        vertical: 4,
      ),
      color: style.headerBackgroundColor,
      child: Row(
        children: [
          // 타입 뱃지: object면 { }, array면 [ ]
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: style.typeBadgeBackgroundColor,
              borderRadius: BorderRadius.circular(style.typeBadgeBorderRadius),
            ),
            child: Text(
              node.isArray ? '[ ]' : '{ }',
              style: TextStyle(
                color: style.typeBadgeTextColor,
                fontSize: style.typeBadgeFontSize,
                fontFamily: style.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: style.badgeLabelGap),
          // 키 이름 (긴 경우 말줄임표)
          Expanded(
            child: Text(
              node.label,
              style: TextStyle(
                color: style.labelColor,
                fontSize: style.labelFontSize,
                fontWeight: style.labelFontWeight,
                fontFamily: style.fontFamily,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // 자식이 있을 때만 접기/펼치기 버튼 표시
          if (hasChildren)
            IconButton(
              onPressed: onToggle,
              icon: Icon(
                node.isCollapsed ? Icons.chevron_right : Icons.chevron_left,
                size: style.collapseIconSize,
                color: style.collapseIconColor,
              ),
              style: IconButton.styleFrom(
                backgroundColor: style.collapseIconBackgroundColor,
                shape: CircleBorder(),
                padding: const EdgeInsets.all(4),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
        ],
      ),
    );

    if (onToggleEntries == null) return inner;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onToggleEntries,
        child: inner,
      ),
    );
  }
}
