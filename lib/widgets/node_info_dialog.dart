import 'package:flutter/material.dart';
import '../models/json_node.dart';
import '../models/node_info_dialog_style.dart';
import '../state/editor_state.dart';
import '../utils/json_value_parser.dart';

class NodeInfoDialog extends StatefulWidget {
  final JsonNode node;
  final EditorState state;
  final NodeInfoDialogStyle style;

  const NodeInfoDialog({
    super.key,
    required this.node,
    required this.state,
    this.style = const NodeInfoDialogStyle(),
  });

  @override
  State<NodeInfoDialog> createState() => _NodeInfoDialogState();
}

class _NodeInfoDialogState extends State<NodeInfoDialog> {
  late final List<String> _nodePath;
  String? _editingKey;
  TextEditingController? _editController;

  @override
  void initState() {
    super.initState();
    _nodePath = widget.node.path;
    widget.state.addListener(_onStateChanged);
  }

  void _onStateChanged() => setState(() {});

  @override
  void dispose() {
    widget.state.removeListener(_onStateChanged);
    _editController?.dispose();
    super.dispose();
  }

  // state가 바뀔 때마다 path로 현재 node 재탐색
  JsonNode get _node {
    final root = widget.state.rootNode;
    if (root == null) return widget.node;
    return _findByPath(root, _nodePath) ?? widget.node;
  }

  JsonNode? _findByPath(JsonNode node, List<String> target) {
    if (_pathEq(node.path, target)) return node;
    for (final child in node.children) {
      final found = _findByPath(child, target);
      if (found != null) return found;
    }
    return null;
  }

  bool _pathEq(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  void _startEdit(NodeEntry entry) {
    final initial = entry.type == EntryType.string
        ? entry.displayValue.replaceAll('"', '')
        : entry.displayValue;
    setState(() {
      _editingKey = entry.navigationKey;
      _editController?.dispose();
      _editController = TextEditingController(text: initial);
    });
  }

  void _saveEdit(NodeEntry entry) {
    final newValue = parseJsonInput(_editController!.text.trim());
    widget.state.updateEntryAtPath(_nodePath, entry.navigationKey, newValue);
    // _onStateChanged가 setState 호출하므로 여기선 editingKey만 리셋
    _editingKey = null;
    _editController?.dispose();
    _editController = null;
  }

  @override
  Widget build(BuildContext context) {
    final node = _node;
    return Dialog(
      backgroundColor: widget.style.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.style.borderRadius),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: widget.style.maxWidth,
          maxHeight: widget.style.maxHeight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, node),
            Divider(height: 1, color: widget.style.dividerColor),
            Flexible(
              child: SingleChildScrollView(
                padding: widget.style.bodyPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _metaRow('Type', node.isArray ? 'Array' : 'Object'),
                    _metaRow('Key', node.label),
                    if (node.children.isNotEmpty)
                      _metaRow('Children', '${node.children.length}'),
                    if (node.entries.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      _buildPropertiesLabel(),
                      const SizedBox(height: 8),
                      ...node.entries.map(_entryTile),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, JsonNode node) {
    return Padding(
      padding: widget.style.headerPadding,
      child: Row(
        children: [
          Container(
            padding: widget.style.headerBadgePadding,
            decoration: BoxDecoration(
              color: widget.style.headerBadgeBackgroundColor,
              borderRadius: BorderRadius.circular(
                widget.style.headerBadgeBorderRadius,
              ),
            ),
            child: Text(
              node.isArray ? '[ ]' : '{ }',
              style: TextStyle(
                color: widget.style.headerBadgeTextColor,
                fontSize: widget.style.headerBadgeFontSize,
                fontFamily: widget.style.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              node.label,
              style: TextStyle(
                color: widget.style.titleColor,
                fontSize: widget.style.titleFontSize,
                fontWeight: widget.style.titleFontWeight,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.close,
              size: widget.style.closeIconSize,
              color: widget.style.closeIconColor,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertiesLabel() {
    return Text(
      'Properties',
      style: TextStyle(
        color: widget.style.propertiesLabelColor,
        fontSize: widget.style.propertiesLabelFontSize,
        fontWeight: widget.style.propertiesLabelFontWeight,
        letterSpacing: widget.style.propertiesLabelLetterSpacing,
      ),
    );
  }

  Widget _metaRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.style.metaRowBottomPadding),
      child: Row(
        children: [
          SizedBox(
            width: widget.style.metaLabelWidth,
            child: Text(
              label,
              style: TextStyle(
                color: widget.style.metaLabelColor,
                fontSize: widget.style.metaLabelFontSize,
                fontFamily: widget.style.fontFamily,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: widget.style.metaValueColor,
              fontSize: widget.style.metaValueFontSize,
              fontFamily: widget.style.fontFamily,
            ),
          ),
        ],
      ),
    );
  }

  Widget _entryTile(NodeEntry entry) {
    final isEditing = _editingKey == entry.navigationKey;

    final Color valueColor = switch (entry.type) {
      EntryType.string => widget.style.stringValueColor,
      EntryType.number => widget.style.numberValueColor,
      EntryType.boolean => widget.style.booleanValueColor,
      EntryType.nullValue => widget.style.nullValueColor,
    };

    return Container(
      margin: EdgeInsets.only(bottom: widget.style.entryTileBottomMargin),
      padding: EdgeInsets.symmetric(
        horizontal: widget.style.entryTilePaddingHorizontal,
        vertical: widget.style.entryTilePaddingVertical,
      ),
      decoration: BoxDecoration(
        color: widget.style.entryTileBackgroundColor,
        borderRadius: BorderRadius.circular(widget.style.entryTileBorderRadius),
      ),
      child: Row(
        children: [
          Text(
            entry.key,
            style: TextStyle(
              color: widget.style.entryKeyColor,
              fontSize: widget.style.entryKeyFontSize,
              fontFamily: widget.style.fontFamily,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.style.entrySeparatorPaddingHorizontal,
            ),
            child: Text(
              ':',
              style: TextStyle(
                color: widget.style.entrySeparatorColor,
                fontSize: widget.style.entryKeyFontSize,
              ),
            ),
          ),
          Expanded(
            child: isEditing
                ? TextField(
                    controller: _editController,
                    autofocus: true,
                    style: TextStyle(
                      color: widget.style.metaValueColor,
                      fontFamily: widget.style.fontFamily,
                      fontSize: widget.style.entryValueFontSize,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.style.dividerColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.style.headerBadgeTextColor,
                        ),
                      ),
                    ),
                    onSubmitted: (_) => _saveEdit(entry),
                  )
                : Text(
                    entry.displayValue,
                    style: TextStyle(
                      color: valueColor,
                      fontSize: widget.style.entryValueFontSize,
                      fontFamily: widget.style.fontFamily,
                    ),
                  ),
          ),
          if (!isEditing) ...[
            const SizedBox(width: 6),
            Container(
              padding: widget.style.typeBadgePadding,
              decoration: BoxDecoration(
                color: widget.style.typeBadgeBackgroundColor,
                borderRadius: BorderRadius.circular(
                  widget.style.typeBadgeBorderRadius,
                ),
              ),
              child: Text(
                entry.type.name,
                style: TextStyle(
                  color: widget.style.typeBadgeTextColor,
                  fontSize: widget.style.typeBadgeFontSize,
                  fontFamily: widget.style.fontFamily,
                ),
              ),
            ),
          ],
          const SizedBox(width: 6),
          GestureDetector(
            onTap: isEditing ? () => _saveEdit(entry) : () => _startEdit(entry),
            child: Icon(
              isEditing ? Icons.check : Icons.edit,
              size: 16,
              color: isEditing
                  ? widget.style.headerBadgeTextColor
                  : widget.style.metaLabelColor,
            ),
          ),
        ],
      ),
    );
  }
}
