import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/node_detail_style.dart';

/// 노드의 단일 entry(키-값 쌍)를 표시하는 카드 타일.
/// 키(상단, bold)와 값(하단)을 분리 표시하며, 각 영역을 더블클릭하면 인라인 편집 모드로 전환된다.
class NodeEntryTile extends StatelessWidget {
  final NodeEntry entry;
  final bool isEditingKey;
  final bool isEditingValue;

  /// 키·값 중 하나만 편집 가능하므로 컨트롤러는 공유
  final TextEditingController? editController;

  /// 값 편집 중 현재 선택된 타입 (null이면 비편집 상태)
  final EntryType? editingType;
  final ValueChanged<EntryType>? onTypeChanged;

  final VoidCallback onStartEditKey;
  final VoidCallback onStartEditValue;
  final VoidCallback onSaveEditKey;
  final VoidCallback onSaveEditValue;
  final VoidCallback onDelete;
  final NodeDetailStyle style;

  const NodeEntryTile({
    super.key,
    required this.entry,
    required this.isEditingKey,
    required this.isEditingValue,
    required this.editController,
    this.editingType,
    this.onTypeChanged,
    required this.onStartEditKey,
    required this.onStartEditValue,
    required this.onSaveEditKey,
    required this.onSaveEditValue,
    required this.onDelete,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final s = style;

    final Color valueColor = switch (entry.type) {
      EntryType.string => s.stringValueColor,
      EntryType.number => s.numberValueColor,
      EntryType.boolean => s.booleanValueColor,
      EntryType.nullValue => s.nullValueColor,
    };

    // 타일 카드 + 우측 X 버튼
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: s.entryTileBottomMargin),
            padding: EdgeInsets.symmetric(
              horizontal: s.entryTilePaddingHorizontal,
              vertical: s.entryTilePaddingVertical,
            ),
            decoration: BoxDecoration(
              color: s.entryTileBackgroundColor,
              borderRadius: BorderRadius.circular(s.entryTileBorderRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 키 행: 이름(더블클릭 편집) + 타입 뱃지
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: isEditingKey ? null : onStartEditKey,
                        child: isEditingKey
                            ? TextField(
                                controller: editController,
                                autofocus: true,
                                style: TextStyle(
                                  color: s.entryKeyColor,
                                  fontFamily: s.fontFamily,
                                  fontSize: s.entryKeyFontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: s.dividerColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: s.headerBadgeTextColor,
                                    ),
                                  ),
                                ),
                                onSubmitted: (_) => onSaveEditKey(),
                              )
                            : Text(
                                entry.key,
                                style: TextStyle(
                                  color: s.entryKeyColor,
                                  fontSize: s.entryKeyFontSize,
                                  fontFamily: s.fontFamily,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (isEditingKey)
                      IconButton(
                        onPressed: onSaveEditKey,
                        tooltip: '저장',
                        icon: Icon(
                          Icons.check,
                          size: 20,
                          color: s.headerBadgeTextColor,
                        ),
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(8),
                        ),
                      )
                    else
                      Container(
                        padding: s.typeBadgePadding,
                        decoration: BoxDecoration(
                          color: s.typeBadgeBackgroundColor,
                          borderRadius: BorderRadius.circular(
                            s.typeBadgeBorderRadius,
                          ),
                        ),
                        child: Text(
                          entry.type.name,
                          style: TextStyle(
                            color: s.typeBadgeTextColor,
                            fontSize: s.typeBadgeFontSize,
                            fontFamily: s.fontFamily,
                          ),
                        ),
                      ),
                  ],
                ),
                // 값 행: 내용(더블클릭 편집) + 저장 버튼
                SizedBox(height: s.entryTilePaddingVertical),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: isEditingValue ? null : onStartEditValue,
                        child: isEditingValue
                            ? TextField(
                                controller: editController,
                                autofocus: true,
                                maxLines: null,
                                style: TextStyle(
                                  color: s.metaValueColor,
                                  fontFamily: s.fontFamily,
                                  fontSize: s.entryValueFontSize,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: s.dividerColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: s.headerBadgeTextColor,
                                    ),
                                  ),
                                ),
                                onSubmitted: (_) => onSaveEditValue(),
                              )
                            : Text(
                                entry.displayValue,
                                style: TextStyle(
                                  color: valueColor,
                                  fontSize: s.entryValueFontSize,
                                  fontFamily: s.fontFamily,
                                ),
                              ),
                      ),
                    ),
                    if (isEditingValue) ...[
                      const SizedBox(width: 6),
                      PopupMenuButton<EntryType>(
                        initialValue: editingType,
                        onSelected: (t) => onTypeChanged?.call(t),
                        padding: EdgeInsets.zero,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(color: s.dividerColor),
                        ),
                        itemBuilder: (_) => EntryType.values
                            .map(
                              (t) => PopupMenuItem<EntryType>(
                                value: t,
                                height: 32,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  t.label,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: s.fontFamily,
                                    color: t == editingType
                                        ? s.headerBadgeTextColor
                                        : s.metaValueColor,
                                    fontWeight: t == editingType
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        child: Container(
                          padding: s.typeBadgePadding,
                          decoration: BoxDecoration(
                            color: s.headerBadgeBackgroundColor,
                            borderRadius: BorderRadius.circular(
                              s.typeBadgeBorderRadius,
                            ),
                            border: Border.all(
                              color: s.headerBadgeTextColor.withValues(
                                alpha: 0.35,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                editingType?.label ?? '',
                                style: TextStyle(
                                  color: s.headerBadgeTextColor,
                                  fontSize: s.typeBadgeFontSize,
                                  fontFamily: s.fontFamily,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 12,
                                color: s.headerBadgeTextColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),
                      IconButton(
                        onPressed: onSaveEditValue,
                        tooltip: '저장',
                        icon: Icon(
                          Icons.check,
                          size: 20,
                          color: s.headerBadgeTextColor,
                        ),
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
        // 삭제 버튼
        IconButton(
          onPressed: onDelete,
          tooltip: '삭제',
          icon: Icon(Icons.close, size: 14, color: s.closeIconColor),
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(4),
          ),
        ),
      ],
    );
  }
}
