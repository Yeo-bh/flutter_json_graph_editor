import 'package:flutter/material.dart';
import '../../models/style/add_child_dialog_style.dart';
import '../../models/json_node.dart';
import '../../models/style/node_detail_style.dart';
import '../../state/editor_state.dart';
import '../shared/confirm_dialog.dart';
import 'add_entry_dialog.dart';
import 'node_entry_tile.dart';

/// 사이드 패널의 스크롤 가능한 본문 영역.
/// 메타 정보, Properties 섹션(entry 목록 + 추가/삭제)을 포함하며,
/// entry 편집 상태를 자체적으로 관리한다.
class NodeSidePanelBody extends StatefulWidget {
  final JsonNode node;
  final List<String> nodePath;
  final EditorState state;
  final NodeDetailStyle style;
  final AddChildDialogStyle addChildDialogStyle;

  const NodeSidePanelBody({
    super.key,
    required this.node,
    required this.nodePath,
    required this.state,
    required this.style,
    this.addChildDialogStyle = const AddChildDialogStyle(),
  });

  @override
  State<NodeSidePanelBody> createState() => _NodeSidePanelBodyState();
}

class _NodeSidePanelBodyState extends State<NodeSidePanelBody> {
  String? _editingKey;
  String? _editingField;
  TextEditingController? _editController;
  EntryType? _editingType;
  dynamic _pendingEditValue;
  bool _pendingEditValid = true;

  static dynamic _rawFromEntry(NodeEntry entry) => switch (entry.type) {
    EntryType.string ||
    EntryType.timestamp => entry.displayValue.replaceAll('"', ''),
    EntryType.int64 => int.tryParse(entry.displayValue),
    EntryType.double_ => double.tryParse(entry.displayValue),
    EntryType.boolean => entry.displayValue == 'true',
    EntryType.nullValue => null,
  };

  @override
  void dispose() {
    _editController?.dispose();
    super.dispose();
  }

  void _startEditValue(NodeEntry entry) {
    setState(() {
      _editingKey = entry.navigationKey;
      _editingField = 'value';
      _editingType = entry.type;
      _pendingEditValue = _rawFromEntry(entry);
      _pendingEditValid = true;
      _editController?.dispose();
      _editController = null;
    });
  }

  void _saveEditValue(NodeEntry entry) {
    widget.state.updateEntryAtPath(
      widget.nodePath,
      entry.navigationKey,
      _pendingEditValue,
    );
    setState(() {
      _editingKey = null;
      _editingField = null;
      _editingType = null;
      _pendingEditValue = null;
      _pendingEditValid = true;
    });
  }

  void _startEditKey(NodeEntry entry) {
    setState(() {
      _editingKey = entry.navigationKey;
      _editingField = 'key';
      _editController?.dispose();
      _editController = TextEditingController(text: entry.key);
    });
  }

  void _saveEditKey(NodeEntry entry) {
    final newKey = _editController!.text.trim();
    if (newKey.isNotEmpty && newKey != entry.key) {
      widget.state.renameEntryKey(widget.nodePath, entry.navigationKey, newKey);
    }
    setState(() {
      _editingKey = null;
      _editingField = null;
      _editController?.dispose();
      _editController = null;
    });
  }

  Future<void> _confirmDeleteEntry(NodeEntry entry) async {
    final s = widget.style;
    final confirmed = await ConfirmDialog.show(
      context,
      title: '"${entry.key}" 삭제',
      message: '이 항목을 삭제하시겠습니까?',
      confirmText: '삭제',
      isDestructive: true,
      backgroundColor: s.backgroundColor,
      titleColor: s.titleColor,
      messageColor: s.metaLabelColor,
      cancelTextColor: s.metaLabelColor,
      confirmColor: s.headerBadgeTextColor,
      destructiveColor: s.deleteIconColor,
    );
    if (confirmed) {
      widget.state.deleteEntry(widget.nodePath, entry.navigationKey);
    }
  }

  void _openAddEntryDialog() {
    showDialog(
      context: context,
      builder: (_) => AddEntryDialog(
        parentNode: widget.node,
        nodePath: widget.nodePath,
        state: widget.state,
        style: widget.addChildDialogStyle,
        valueStyle: widget.style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final node = widget.node;
    final s = widget.style;

    return SingleChildScrollView(
      padding: s.bodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _metaSection(node, s),
          if (node.entries.isNotEmpty || !node.isArray) ...[
            const SizedBox(height: 16),
            _propertiesHeader(s),
            const SizedBox(height: 8),
            ...node.entries.map(
              (entry) => NodeEntryTile(
                entry: entry,
                isEditingKey:
                    _editingKey == entry.navigationKey &&
                    _editingField == 'key',
                isEditingValue:
                    _editingKey == entry.navigationKey &&
                    _editingField == 'value',
                editController: _editingKey == entry.navigationKey
                    ? _editController
                    : null,
                editingType:
                    _editingKey == entry.navigationKey &&
                        _editingField == 'value'
                    ? _editingType
                    : null,
                onTypeChanged: (t) => setState(() => _editingType = t),
                isEditValueValid:
                    _editingKey == entry.navigationKey &&
                        _editingField == 'value'
                    ? _pendingEditValid
                    : true,
                onValueChanged: (v, valid) => setState(() {
                  _pendingEditValue = v;
                  _pendingEditValid = valid;
                }),
                onStartEditKey: () => _startEditKey(entry),
                onStartEditValue: () => _startEditValue(entry),
                onSaveEditKey: () => _saveEditKey(entry),
                onSaveEditValue: () => _saveEditValue(entry),
                onDelete: () => _confirmDeleteEntry(entry),
                style: s,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _metaSection(JsonNode node, NodeDetailStyle s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _metaRow('Type', node.isArray ? 'Array' : 'Object', s),
        if (node.entries.isNotEmpty)
          _metaRow('Properties', '${node.entries.length}', s),
        if (node.children.isNotEmpty)
          _metaRow('Children', '${node.children.length}', s),
      ],
    );
  }

  Widget _propertiesHeader(NodeDetailStyle s) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Properties',
            style: TextStyle(
              color: s.propertiesLabelColor,
              fontSize: s.propertiesLabelFontSize,
              fontWeight: s.propertiesLabelFontWeight,
              letterSpacing: s.propertiesLabelLetterSpacing,
            ),
          ),
        ),
        IconButton(
          onPressed: _openAddEntryDialog,
          tooltip: 'Property 추가',
          icon: Icon(Icons.add, size: 20, color: s.propertiesLabelColor),
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }

  Widget _metaRow(String label, String value, NodeDetailStyle s) {
    return Padding(
      padding: EdgeInsets.only(bottom: s.metaRowBottomPadding),
      child: Row(
        children: [
          SizedBox(
            width: s.metaLabelWidth,
            child: Text(
              label,
              style: TextStyle(
                color: s.metaLabelColor,
                fontSize: s.metaLabelFontSize,
                fontFamily: s.fontFamily,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: s.metaValueColor,
                fontSize: s.metaValueFontSize,
                fontFamily: s.fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
