import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/node_detail_style.dart';
import '../../state/editor_state.dart';
import '../../utils/node_finder.dart';
import 'node_side_panel_body.dart';
import 'node_side_panel_header.dart';
import 'node_side_panel_toolbar.dart';

/// 그래프에서 노드 선택 시 우측에 슬라이드인되는 상세 패널.
/// 레이블 편집 상태를 관리하고, 본문은 NodeSidePanelBody에 위임한다.
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
    if (old.node.path.join('/') != widget.node.path.join('/')) {
      _nodePath = widget.node.path;
      _isEditingLabel = false;
      _labelController?.dispose();
      _labelController = null;
    }
  }

  void _onStateChanged() => setState(() {});

  @override
  void dispose() {
    widget.state.removeListener(_onStateChanged);
    _labelController?.dispose();
    super.dispose();
  }

  // 노드 path가 바뀌어도 최신 상태를 반영한 노드를 반환
  JsonNode get _node {
    final root = widget.state.rootNode;
    if (root == null) return widget.node;
    return findNodeByPath(root, _nodePath) ?? widget.node;
  }

  // List 인덱스 노드는 키 이름이 없으므로 rename 불가
  bool _canRenameNode(JsonNode node) =>
      node.path.isNotEmpty && int.tryParse(node.path.last) == null;

  void _startLabelEdit(JsonNode node) {
    setState(() {
      _isEditingLabel = true;
      _labelController?.dispose();
      _labelController = TextEditingController(text: node.label);
    });
  }

  // _nodePath를 새 키로 갱신해야 노드 선택 상태가 유지됨
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

  @override
  Widget build(BuildContext context) {
    final node = _node;
    final s = widget.style;
    return Container(
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
          NodeSidePanelHeader(
            node: node,
            style: s,
            isEditingLabel: _isEditingLabel,
            labelController: _labelController,
            onClose: widget.onClose,
            onStartEdit: _canRenameNode(node)
                ? () => _startLabelEdit(node)
                : null,
            onSaveEdit: _saveLabelEdit,
            onCancelEdit: _cancelLabelEdit,
          ),
          NodeSidePanelToolbar(
            jsonText: widget.state.jsonText,
            nodePath: _nodePath,
            style: s,
            onDelete: _nodePath.isNotEmpty
                ? () {
                    widget.state.deleteNode(_nodePath);
                    widget.onClose();
                  }
                : null,
          ),
          Divider(height: 1, color: s.dividerColor),
          Expanded(
            child: NodeSidePanelBody(
              key: ValueKey(_nodePath.join('/')),
              node: node,
              nodePath: _nodePath,
              state: widget.state,
              style: s,
            ),
          ),
        ],
      ),
    );
  }
}
