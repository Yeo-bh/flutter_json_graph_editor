import 'package:flutter/material.dart';
import '../models/json_node.dart';
import '../models/node_card_style.dart';

// 그래프에서 하나의 JSON 객체/배열을 나타내는 카드 위젯
// 헤더 클릭 → entries 접기/펼치기, 바디(entries 영역) 클릭 → 사이드 패널
class NodeCard extends StatelessWidget {
  final JsonNode node;
  final bool isSelected;
  final VoidCallback onToggleCollapse; // 헤더의 ‹/› 버튼 클릭 시 호출
  final VoidCallback onToggleEntriesCollapse; // 헤더 클릭 시 호출
  final VoidCallback? onShowDetail; // entries 영역 클릭 시 호출 (사이드 패널 열기)
  final NodeCardStyle style;

  const NodeCard({
    super.key,
    required this.node,
    required this.onToggleCollapse,
    required this.onToggleEntriesCollapse,
    this.onShowDetail,
    this.isSelected = false,
    this.style = const NodeCardStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: node.size.width,
      height: node.size.height,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(style.borderRadius),
        border: Border.all(
          color: isSelected ? style.selectedBorderColor : style.borderColor,
          width: style.borderWidth,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: style.selectedBorderColor.withValues(alpha: 0.3),
              blurRadius: 0,
              spreadRadius: 2,
            )
          else
            BoxShadow(
              color: style.shadowColor,
              blurRadius: style.shadowBlurRadius,
              offset: style.shadowOffset,
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(style.borderRadius),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              node: node,
              onToggle: onToggleCollapse,
              onToggleEntries: node.entries.isNotEmpty
                  ? onToggleEntriesCollapse
                  : null,
              style: style,
            ),
            // 펼쳐진 entries 영역 클릭 → 사이드 패널 열기
            if (!node.isEntriesCollapsed && node.entries.isNotEmpty)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onShowDetail,
                child: MouseRegion(
                  cursor: onShowDetail != null
                      ? SystemMouseCursors.click
                      : SystemMouseCursors.basic,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: node.entries
                        .map((e) => _EntryRow(entry: e, style: style))
                        .toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// 카드 상단 헤더: 타입 뱃지 + 라벨 + 자식 접기/펼치기 버튼
// onToggleEntries가 있으면 헤더 전체 클릭 → entries 접기/펼치기
class _Header extends StatelessWidget {
  final JsonNode node;
  final VoidCallback onToggle;
  final VoidCallback? onToggleEntries; // null이면 헤더 클릭 비활성
  final NodeCardStyle style;

  const _Header({
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
      padding: EdgeInsets.symmetric(horizontal: style.headerPaddingHorizontal),
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
            GestureDetector(
              onTap: onToggle,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: style.collapseIconBackgroundColor,
                  borderRadius: BorderRadius.circular(
                    style.collapseIconBorderRadius,
                  ),
                ),
                child: Icon(
                  node.isCollapsed ? Icons.chevron_right : Icons.chevron_left,
                  size: style.collapseIconSize,
                  color: style.collapseIconColor,
                ),
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

// 카드 내부 한 줄: key : value (타입에 따라 값 색상 다름)
class _EntryRow extends StatelessWidget {
  final NodeEntry entry;
  final NodeCardStyle style;

  const _EntryRow({required this.entry, required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: style.entryHeight,
      padding: EdgeInsets.symmetric(horizontal: style.entryPaddingHorizontal),
      decoration: BoxDecoration(
        // 각 행 위에 얇은 구분선
        border: Border(top: BorderSide(color: style.entryDividerColor)),
      ),
      child: Row(
        children: [
          // 키 (회색)
          Text(
            entry.key,
            style: TextStyle(
              color: style.entryKeyColor,
              fontSize: style.entryKeyFontSize,
              fontFamily: style.fontFamily,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: style.entrySeparatorPadding,
            ),
            child: Text(
              ':',
              style: TextStyle(
                color: style.entrySeparatorColor,
                fontSize: style.entryKeyFontSize,
              ),
            ),
          ),
          // 값 (타입에 따라 색상 다름, 긴 경우 말줄임표)
          Expanded(
            child: Text(
              entry.displayValue,
              style: TextStyle(
                color: _valueColor(entry.type),
                fontSize: style.entryValueFontSize,
                fontFamily: style.fontFamily,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // 타입별 값 색상: string=초록, number=파랑, boolean=노랑, null=회색
  Color _valueColor(EntryType type) => switch (type) {
    EntryType.string => style.stringValueColor,
    EntryType.number => style.numberValueColor,
    EntryType.boolean => style.booleanValueColor,
    EntryType.nullValue => style.nullValueColor,
  };
}
