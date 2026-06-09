import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/json_node.dart';
import '../models/node_card_style.dart';
import '../models/node_info_dialog_style.dart';
import '../state/editor_state.dart';
import 'node_info_dialog.dart';

// 그래프에서 하나의 JSON 객체/배열을 나타내는 카드 위젯
// 탭 → 상세 다이얼로그, 헤더 버튼 → 자식 접기/펼치기
class NodeCard extends StatelessWidget {
  final JsonNode node;
  final VoidCallback onToggleCollapse; // 헤더의 ‹/› 버튼 클릭 시 호출
  final VoidCallback onToggleEntriesCollapse; // entries 접기/펼치기 버튼
  final NodeCardStyle style; // 모든 시각적 옵션 (기본값 = NodeCardStyle.defaults)
  final NodeInfoDialogStyle infoDialogStyle;

  const NodeCard({
    super.key,
    required this.node,
    required this.onToggleCollapse,
    required this.onToggleEntriesCollapse,
    this.style = const NodeCardStyle(),
    this.infoDialogStyle = const NodeInfoDialogStyle(),
  });

  void _showInfo(BuildContext context) {
    final state = context.read<EditorState>();
    showDialog(
      context: context,
      builder: (_) =>
          NodeInfoDialog(node: node, state: state, style: infoDialogStyle),
    );
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector로 카드 전체 탭 감지 → 상세 다이얼로그 표시
    return GestureDetector(
      onTap: () => _showInfo(context),
      child: _buildCard(),
    );
  }

  Widget _buildCard() {
    return Container(
      width: node.size.width,
      height: node.size.height, // tree_layout에서 계산된 고정 높이
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(style.borderRadius),
        border: Border.all(color: style.borderColor, width: style.borderWidth),
        boxShadow: [
          BoxShadow(
            color: style.shadowColor,
            blurRadius: style.shadowBlurRadius,
            offset: style.shadowOffset,
          ),
        ],
      ),
      // ClipRRect: 내부 위젯이 둥근 모서리를 넘어가지 않도록 클리핑
      child: ClipRRect(
        borderRadius: BorderRadius.circular(style.borderRadius),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 내용 높이에 맞게 (border 오버플로 방지)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              node: node,
              onToggle: onToggleCollapse,
              onToggleEntries: onToggleEntriesCollapse,
              style: style,
            ),
            // entries 접혀있으면 숨김
            if (!node.isEntriesCollapsed)
              ...node.entries.map((e) => _EntryRow(entry: e, style: style)),
          ],
        ),
      ),
    );
  }
}

// 카드 상단 헤더: 타입 뱃지 + 라벨 + entries 토글 + 자식 접기/펼치기 버튼
class _Header extends StatelessWidget {
  final JsonNode node;
  final VoidCallback onToggle;
  final VoidCallback onToggleEntries;
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
    return Container(
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
          // entries가 있을 때 접기/펼치기 버튼 표시
          if (node.entries.isNotEmpty)
            GestureDetector(
              onTap: onToggleEntries,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: style.collapseIconBackgroundColor,
                  borderRadius: BorderRadius.circular(
                    style.collapseIconBorderRadius,
                  ),
                ),
                child: Icon(
                  node.isEntriesCollapsed
                      ? Icons.expand_more
                      : Icons.expand_less,
                  size: style.collapseIconSize,
                  color: style.collapseIconColor,
                ),
              ),
            ),
          if (node.entries.isNotEmpty && hasChildren) const SizedBox(width: 4),
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
                  // 접힘: 오른쪽 화살표(펼치기 암시), 펼침: 왼쪽 화살표(접기 암시)
                  node.isCollapsed ? Icons.chevron_right : Icons.chevron_left,
                  size: style.collapseIconSize,
                  color: style.collapseIconColor,
                ),
              ),
            ),
        ],
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
