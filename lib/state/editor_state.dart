import 'package:flutter/material.dart';
import '../models/json_node.dart';
import '../utils/collapse_manager.dart';
import '../utils/default_json.dart';
import '../utils/json_mutator.dart';
import '../utils/json_parser.dart';
import '../utils/node_finder.dart';
import '../utils/tree_layout.dart';

// 앱 전체 상태를 관리하는 클래스 (Provider로 위젯 트리에 공유)
// ChangeNotifier: 상태가 바뀔 때 notifyListeners() 호출 → 구독 위젯 리빌드
// JSON 뮤테이션/탐색/collapse 로직은 utils로 위임, 이 클래스는 조율만 담당
class EditorState extends ChangeNotifier {
  String _jsonText = '';
  JsonNode? _rootNode; // 파싱 성공 시 그래프에 표시되는 트리
  String? _error; // 파싱 실패 시 에러 메시지
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

  // 에디터 텍스트가 바뀔 때마다 호출 (실시간 파싱)
  void updateText(String text) {
    _jsonText = text;
    _parse(text);
    notifyListeners();
  }

  // 노드 카드의 접기/펼치기 버튼 클릭 시 호출
  void toggleCollapse(String nodeId) {
    if (_rootNode == null) return;
    final node = findNodeById(_rootNode!, nodeId);
    if (node != null) {
      node.isCollapsed = !node.isCollapsed;
      layoutTree(_rootNode!);
      notifyListeners();
    }
  }

  // 카드 내부 entries 접기/펼치기
  void toggleEntriesCollapse(String nodeId) {
    if (_rootNode == null) return;
    final node = findNodeById(_rootNode!, nodeId);
    if (node != null) {
      node.isEntriesCollapsed = !node.isEntriesCollapsed;
      layoutTree(_rootNode!);
      notifyListeners();
    }
  }

  // 노드 경로에 새 key-value 추가 (primitive → entry, object/array → child 노드)
  // key가 null이면 배열에 append
  void addChildToNode(
    List<String> nodePath,
    String? key,
    dynamic defaultValue,
  ) {
    final newText = addChildToJson(_jsonText, nodePath, key, defaultValue);
    if (newText != null) updateText(newText);
  }

  // 특정 노드의 entry 값을 수정하고 JSON 텍스트를 재생성
  void updateEntryAtPath(
    List<String> nodePath,
    String navigationKey,
    dynamic newValue,
  ) {
    final newText = updateEntryInJson(_jsonText, nodePath, navigationKey, newValue);
    if (newText != null) updateText(newText);
  }

  // 노드의 키를 변경하고 JSON을 재생성
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

    // 재파싱 전 사용자가 변경한 collapse 상태를 path 키로 스냅샷
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
