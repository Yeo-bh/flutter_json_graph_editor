import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/style/node_card_style.dart';

// 카드 내부 한 줄: key : value (타입에 따라 값 색상 다름)
class NodeCardEntryRow extends StatelessWidget {
  final NodeEntry entry;
  final NodeCardStyle style;
  final bool isMatched;

  const NodeCardEntryRow({
    super.key,
    required this.entry,
    required this.style,
    this.isMatched = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: style.entryHeight,
      padding: EdgeInsets.symmetric(horizontal: style.entryPaddingHorizontal),
      decoration: BoxDecoration(
        color: isMatched ? style.searchMatchEntryBackgroundColor : null,
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
