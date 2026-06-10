import 'package:flutter/material.dart';
import '../models/json_node.dart';
import '../utils/collapse_manager.dart';
import '../utils/default_json.dart';
import '../utils/json_mutator.dart';
import '../utils/json_parser.dart';
import '../utils/node_finder.dart';
import '../utils/tree_layout.dart';

class EditorState extends ChangeNotifier {
  String _jsonText = '';
  JsonNode? _rootNode;
  String? _error;
  final bool collapseChildrenByDefault;
  final bool collapseEntriesByDefault;

  String get jsonText => _jsonText;
  JsonNode? get rootNode => _rootNode;
  String? get error => _error;

  EditorState({
    String? initialJson,
    this.collapseChildrenByDefault = true,
    this.collapseEntriesByDefault = true,
  }) {
    final json = initialJson ?? kDefaultJson;
    _jsonText = json;
    _parse(json);
  }

  void updateText(String text) {
    _jsonText = text;
    _parse(text);
    notifyListeners();
  }

  void toggleCollapse(String nodeId) {
    if (_rootNode == null) return;
    final node = findNodeById(_rootNode!, nodeId);
    if (node != null) {
      node.isCollapsed = !node.isCollapsed;
      layoutTree(_rootNode!);
      notifyListeners();
    }
  }

  void toggleEntriesCollapse(String nodeId) {
    if (_rootNode == null) return;
    final node = findNodeById(_rootNode!, nodeId);
    if (node != null) {
      node.isEntriesCollapsed = !node.isEntriesCollapsed;
      layoutTree(_rootNode!);
      notifyListeners();
    }
  }

  void addChildToNode(
    List<String> nodePath,
    String? key,
    dynamic defaultValue,
  ) {
    final newText = addChildToJson(_jsonText, nodePath, key, defaultValue);
    if (newText != null) updateText(newText);
  }

  void updateEntryAtPath(
    List<String> nodePath,
    String navigationKey,
    dynamic newValue,
  ) {
    final newText = updateEntryInJson(_jsonText, nodePath, navigationKey, newValue);
    if (newText != null) updateText(newText);
  }

  void renameNodeKey(List<String> nodePath, String newKey) {
    final newText = renameKeyInJson(_jsonText, nodePath, newKey);
    if (newText != null) updateText(newText);
  }

  void _parse(String text) {
    if (text.trim().isEmpty) {
      _rootNode = null;
      _error = null;
      return;
    }

    final snapshot = <String, ({bool isCollapsed, bool isEntriesCollapsed})>{};
    if (_rootNode != null) snapshotCollapse(_rootNode!, snapshot);

    final node = parseJson(text);
    if (node != null) {
      if (snapshot.isEmpty) {
        if (collapseChildrenByDefault) collapseChildren(node);
        if (collapseEntriesByDefault) collapseAllEntries(node);
      } else {
        restoreCollapse(
          node,
          snapshot,
          isRoot: true,
          collapseChildrenByDefault: collapseChildrenByDefault,
          collapseEntriesByDefault: collapseEntriesByDefault,
        );
      }
      _rootNode = node;
      layoutTree(node);
      _error = null;
    } else {
      _error = 'Invalid JSON';
    }
  }
}
