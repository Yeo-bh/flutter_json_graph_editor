import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/node_detail_style.dart';

class NodeEntryTile extends StatelessWidget {
  final NodeEntry entry;
  final bool isEditing;
  final TextEditingController? editController;
  final VoidCallback onStartEdit;
  final VoidCallback onSaveEdit;
  final NodeDetailStyle style;

  const NodeEntryTile({
    super.key,
    required this.entry,
    required this.isEditing,
    required this.editController,
    required this.onStartEdit,
    required this.onSaveEdit,
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

    return Container(
      margin: EdgeInsets.only(bottom: s.entryTileBottomMargin),
      padding: EdgeInsets.symmetric(
        horizontal: s.entryTilePaddingHorizontal,
        vertical: s.entryTilePaddingVertical,
      ),
      decoration: BoxDecoration(
        color: s.entryTileBackgroundColor,
        borderRadius: BorderRadius.circular(s.entryTileBorderRadius),
      ),
      child: Row(
        children: [
          Text(
            entry.key,
            style: TextStyle(
              color: s.entryKeyColor,
              fontSize: s.entryKeyFontSize,
              fontFamily: s.fontFamily,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: s.entrySeparatorPaddingHorizontal,
            ),
            child: Text(
              ':',
              style: TextStyle(
                color: s.entrySeparatorColor,
                fontSize: s.entryKeyFontSize,
              ),
            ),
          ),
          Expanded(
            child: isEditing
                ? TextField(
                    controller: editController,
                    autofocus: true,
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
                        borderSide: BorderSide(color: s.dividerColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: s.headerBadgeTextColor),
                      ),
                    ),
                    onSubmitted: (_) => onSaveEdit(),
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
          if (!isEditing) ...[
            const SizedBox(width: 6),
            Container(
              padding: s.typeBadgePadding,
              decoration: BoxDecoration(
                color: s.typeBadgeBackgroundColor,
                borderRadius: BorderRadius.circular(s.typeBadgeBorderRadius),
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
          const SizedBox(width: 6),
          GestureDetector(
            onTap: isEditing ? onSaveEdit : onStartEdit,
            child: Icon(
              isEditing ? Icons.check : Icons.edit,
              size: 16,
              color: isEditing ? s.headerBadgeTextColor : s.metaLabelColor,
            ),
          ),
        ],
      ),
    );
  }
}
