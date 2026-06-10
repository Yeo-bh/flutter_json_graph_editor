import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/node_detail_style.dart';
import '../../state/editor_state.dart';
import '../../utils/json_value_parser.dart';
import 'node_entry_tile.dart';

/// 그래프 패널 우측에 오버레이되는 노드 상세 사이드 패널.
/// [NodeDetailStyle.panelWidth]로 너비를 조절한다.
class NodeSidePanel extends StatefulWidget {
  final JsonNode node;
  final EditorState state;
  final VoidCallback onClose;
  final NodeDetailStyle style;

  const NodeSidePanel({
    super.key,
    required this.node,
    required this.state,
    required this.onClose,
    this.style = const NodeDetailStyle(),
  });

  @override
  State<NodeSidePanel> createState() => _NodeSidePanelState();
}

class _NodeSidePanelState extends State<NodeSidePanel> {
  late List<String> _nodePath;
  String? _editingKey;
  TextEditingController? _editController;

  bool _isEditingLabel = false;
  TextEditingController? _labelController;

  @override
  void initState() {
    super.initState();
    _nodePath = widget.node.path;
    widget.state.addListener(_onStateChanged);
  }

  @override
  void didUpdateWidget(NodeSidePanel old) {
    super.didUpdateWidget(old);
    // 다른 노드로 교체될 때 편집 상태 초기화 및 path 갱신
    if (old.node.path.join('/') != widget.node.path.join('/')) {
      _nodePath = widget.node.path;
      _editingKey = null;
      _editController?.dispose();
      _editController = null;
      _isEditingLabel = false;
      _labelController?.dispose();
      _labelController = null;
    }
  }

  void _onStateChanged() => setState(() {});

  @override
  void dispose() {
    widget.state.removeListener(_onStateChanged);
    _editController?.dispose();
    _labelController?.dispose();
    super.dispose();
  }

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

  void _startLabelEdit(JsonNode node) {
    setState(() {
      _isEditingLabel = true;
      _labelController?.dispose();
      _labelController = TextEditingController(text: node.label);
    });
  }

  void _saveLabelEdit() {
    final newKey = _labelController?.text.trim() ?? '';
    final oldPath = List<String>.from(_nodePath);
    setState(() {
      _isEditingLabel = false;
      _labelController?.dispose();
      _labelController = null;
    });
    if (newKey.isNotEmpty && newKey != _node.label) {
      _nodePath = [...oldPath.sublist(0, oldPath.length - 1), newKey];
      widget.state.renameNodeKey(oldPath, newKey);
    }
  }

  void _cancelLabelEdit() {
    setState(() {
      _isEditingLabel = false;
      _labelController?.dispose();
      _labelController = null;
    });
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
    _editingKey = null;
    _editController?.dispose();
    _editController = null;
  }

  @override
  Widget build(BuildContext context) {
    final node = _node;
    final s = widget.style;
    return Container(
      width: s.panelWidth,
      decoration: BoxDecoration(
        color: s.backgroundColor,
        border: Border(left: BorderSide(color: s.dividerColor)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(-4, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, node),
          Divider(height: 1, color: s.dividerColor),
          Expanded(
            child: SingleChildScrollView(
              padding: s.bodyPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _metaRow('Type', node.isArray ? 'Array' : 'Object'),
                  // _metaRow('Key', node.label),
                  if (node.children.isNotEmpty)
                    _metaRow('Children', '${node.children.length}'),
                  if (node.entries.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildPropertiesLabel(),
                    const SizedBox(height: 8),
                    ...node.entries.map(
                      (entry) => NodeEntryTile(
                        entry: entry,
                        isEditing: _editingKey == entry.navigationKey,
                        editController: _editingKey == entry.navigationKey
                            ? _editController
                            : null,
                        onStartEdit: () => _startEdit(entry),
                        onSaveEdit: () => _saveEdit(entry),
                        style: s,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, JsonNode node) {
    final s = widget.style;
    final canEditLabel = node.path.isNotEmpty;

    final Widget labelWidget = _isEditingLabel
        ? TextField(
            controller: _labelController,
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
            onSubmitted: (_) => _saveLabelEdit(),
            onTapOutside: (_) => _cancelLabelEdit(),
          )
        : GestureDetector(
            onDoubleTap: canEditLabel ? () => _startLabelEdit(node) : null,
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
            onPressed: widget.onClose,
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

  Widget _buildPropertiesLabel() {
    final s = widget.style;
    return Text(
      'Properties',
      style: TextStyle(
        color: s.propertiesLabelColor,
        fontSize: s.propertiesLabelFontSize,
        fontWeight: s.propertiesLabelFontWeight,
        letterSpacing: s.propertiesLabelLetterSpacing,
      ),
    );
  }

  Widget _metaRow(String label, String value) {
    final s = widget.style;
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
