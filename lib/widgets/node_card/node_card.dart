import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/style/node_card_style.dart';
import 'node_card_entry_row.dart';
import 'node_card_header.dart';

// 그래프에서 하나의 JSON 객체/배열을 나타내는 카드 위젯
// 헤더 클릭 → entries 접기/펼치기, 바디(entries 영역) 클릭 → 사이드 패널
class NodeCard extends StatelessWidget {
  final JsonNode node;
  final bool isSelected;
  final bool isMatched; // 검색 결과 하이라이트
  final String? highlightQuery; // entry 행 하이라이트용 검색어
  final VoidCallback onToggleCollapse; // 헤더의 ‹/› 버튼 클릭 시 호출
  final VoidCallback onToggleEntriesCollapse; // 헤더 클릭 시 호출
  final VoidCallback? onShowDetail; // 카드 클릭 시 호출 (사이드 패널 열기)
  final NodeCardStyle style;

  const NodeCard({
    super.key,
    required this.node,
    required this.onToggleCollapse,
    required this.onToggleEntriesCollapse,
    this.onShowDetail,
    this.isSelected = false,
    this.isMatched = false,
    this.highlightQuery,
    this.style = const NodeCardStyle(),
  });

  @override
  Widget build(BuildContext context) {
    // 카드 전체를 감싸서 entries 없는 노드도 탭으로 선택 가능하게 함.
    // 내부 GestureDetector(헤더 토글, collapse 버튼)가 아레나에서 먼저 이기므로
    // 중복 호출 없이 각 영역의 동작이 독립적으로 작동함.
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onShowDetail,
      child: Container(
        width: node.size.width,
        height: node.size.height,
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: BorderRadius.circular(style.borderRadius),
          border: Border.all(
            color: isSelected
                ? style.selectedBorderColor
                : isMatched
                    ? style.searchMatchBorderColor
                    : style.borderColor,
            width: style.borderWidth,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: style.selectedBorderColor.withValues(alpha: 0.3),
                blurRadius: 0,
                spreadRadius: 2,
              )
            else if (isMatched)
              BoxShadow(
                color: style.searchMatchShadowColor,
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
              NodeCardHeader(
                node: node,
                onToggle: onToggleCollapse,
                onToggleEntries: node.entries.isNotEmpty
                    ? onToggleEntriesCollapse
                    : null,
                style: style,
              ),
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
                      children: node.entries.map((e) {
                            final q = isMatched && highlightQuery != null
                                ? highlightQuery!.toLowerCase()
                                : null;
                            final entryMatched = q != null &&
                                (e.key.toLowerCase().contains(q) ||
                                    e.displayValue.toLowerCase().contains(q));
                            return NodeCardEntryRow(
                              entry: e,
                              style: style,
                              isMatched: entryMatched,
                            );
                          }).toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
