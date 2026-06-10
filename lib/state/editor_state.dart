import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/json_node.dart';
import '../utils/json_parser.dart';
import '../utils/tree_layout.dart';

const _kDefaultJson = '''
{
  "project": {
    "id": "proj_20260609_001",
    "name": "Advanced JSON Graph Editor",
    "description": "A visual editor for exploring, editing, and managing large nested JSON documents with real-time graph rendering and node interaction support.",
    "version": "2.4.1",
    "isActive": true,
    "createdAt": "2026-06-09T09:30:00Z"
  },
  "owner": {
    "name": "Young Beom Hui",
    "email": "ybh@example.com",
    "role": "administrator",
    "lastLogin": "2026-06-08T23:14:42Z",
    "preferences": {
      "theme": "dark",
      "language": "ko-KR",
      "autoSave": true,
      "fontSize": 14
    }
  },
  "statistics": {
    "totalNodes": 142,
    "expandedNodes": 37,
    "collapsedNodes": 18,
    "memoryUsageMb": 48.72,
    "renderTimeMs": 12.4
  },
  "features": {
    "graphView": true,
    "jsonEditor": true,
    "nodeSearch": true,
    "undoRedo": false,
    "experimental": {
      "aiSuggestions": false,
      "schemaGeneration": true,
      "liveCollaboration": null
    }
  },
  "environments": [
    {
      "name": "development",
      "url": "https://dev.api.example.com",
      "enabled": true
    },
    {
      "name": "staging",
      "url": "https://stg.api.example.com",
      "enabled": true
    },
    {
      "name": "production",
      "url": "https://api.example.com",
      "enabled": false
    }
  ],
  "team": [
    {
      "id": 1001,
      "name": "Alice",
      "position": "Frontend Developer"
    },
    {
      "id": 1002,
      "name": "Bob",
      "position": "Backend Developer"
    },
    {
      "id": 1003,
      "name": "Charlie",
      "position": "Product Designer"
    }
  ],
  "tags": [
    "flutter",
    "json",
    "editor",
    "graph",
    "visualization",
    "developer-tools",
    "open-source"
  ],
  "metadata": {
    "repository": "https://github.com/example/json-graph-editor",
    "license": "MIT",
    "maintainers": [
      "alice@example.com",
      "bob@example.com"
    ],
    "notes": "This sample document intentionally contains multiple nesting levels, arrays, primitive values, long strings, booleans, numbers and null values for graph rendering tests."
  }
}
''';

// 앱 전체 상태를 관리하는 클래스 (Provider로 위젯 트리에 공유)
// ChangeNotifier: 상태가 바뀔 때 notifyListeners() 호출 → 구독 위젯 리빌드
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
    final json = initialJson ?? _kDefaultJson;
    _jsonText = json;
    _parse(json); // 초기 JSON으로 그래프 미리 표시
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
    final node = _findNode(_rootNode!, nodeId);
    if (node != null) {
      node.isCollapsed = !node.isCollapsed;
      layoutTree(_rootNode!); // 접기 상태 바뀌면 레이아웃 재계산
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
    try {
      final dynamic decoded = jsonDecode(_jsonText);
      dynamic current = decoded;
      for (final k in nodePath) {
        current = current is List ? current[int.parse(k)] : current[k];
      }
      if (current is Map) {
        current[key!] = defaultValue;
      } else if (current is List) {
        current.add(defaultValue);
      }
      final newText = const JsonEncoder.withIndent('  ').convert(decoded);
      updateText(newText);
    } catch (_) {}
  }

  // 카드 내부 entries 접기/펼치기
  void toggleEntriesCollapse(String nodeId) {
    if (_rootNode == null) return;
    final node = _findNode(_rootNode!, nodeId);
    if (node != null) {
      node.isEntriesCollapsed = !node.isEntriesCollapsed;
      layoutTree(_rootNode!);
      notifyListeners();
    }
  }

  // 특정 노드의 entry 값을 수정하고 JSON 텍스트를 재생성
  // nodePath: 루트에서 해당 노드까지의 경로 (JsonNode.path)
  // navigationKey: 수정할 entry의 실제 키 (NodeEntry.navigationKey)
  // newValue: 새 값 (null/bool/num/String 중 하나)
  void updateEntryAtPath(
    List<String> nodePath,
    String navigationKey,
    dynamic newValue,
  ) {
    try {
      final dynamic decoded = jsonDecode(_jsonText);
      // 경로를 따라 대상 객체/배열까지 탐색
      dynamic current = decoded;
      for (final key in nodePath) {
        current = current is List ? current[int.parse(key)] : current[key];
      }
      // 실제 값 업데이트
      if (current is List) {
        current[int.parse(navigationKey)] = newValue;
      } else if (current is Map) {
        current[navigationKey] = newValue;
      }
      // 수정된 구조를 포맷팅된 JSON 문자열로 재직렬화
      final newText = const JsonEncoder.withIndent('  ').convert(decoded);
      updateText(newText);
    } catch (_) {
      // 경로 탐색 실패 시 조용히 무시 (JSON 구조가 바뀐 경우)
    }
  }

  // 노드의 키를 변경하고 JSON을 재생성.
  // nodePath: 변경할 노드의 경로 (JsonNode.path). 비어있으면 루트라 불가.
  // newKey: 새 키 이름. 중복이거나 부모가 배열이면 조용히 무시.
  void renameNodeKey(List<String> nodePath, String newKey) {
    if (nodePath.isEmpty) return;
    final oldKey = nodePath.last;
    if (oldKey == newKey || newKey.trim().isEmpty) return;
    try {
      final dynamic decoded = jsonDecode(_jsonText);
      final parentPath = nodePath.sublist(0, nodePath.length - 1);

      dynamic parent = decoded;
      for (final k in parentPath) {
        parent = parent is List ? parent[int.parse(k)] : parent[k];
      }
      if (parent is! Map) return;
      if (parent.containsKey(newKey)) return;

      // 키 순서 보존하며 재구성
      final rebuilt = <String, dynamic>{};
      for (final e in (parent as Map<String, dynamic>).entries) {
        rebuilt[e.key == oldKey ? newKey : e.key] = e.value;
      }

      dynamic newDecoded;
      if (parentPath.isEmpty) {
        newDecoded = rebuilt;
      } else {
        dynamic gp = decoded;
        for (final k in parentPath.sublist(0, parentPath.length - 1)) {
          gp = gp is List ? gp[int.parse(k)] : gp[k];
        }
        final pk = parentPath.last;
        if (gp is List) {
          gp[int.parse(pk)] = rebuilt;
        } else {
          (gp as Map)[pk] = rebuilt;
        }
        newDecoded = decoded;
      }
      updateText(const JsonEncoder.withIndent('  ').convert(newDecoded));
    } catch (_) {}
  }

  void _parse(String text) {
    if (text.trim().isEmpty) {
      _rootNode = null;
      _error = null;
      return;
    }

    // 재파싱 전 사용자가 변경한 collapse 상태를 path 키로 스냅샷
    final snapshot = <String, ({bool isCollapsed, bool isEntriesCollapsed})>{};
    if (_rootNode != null) _snapshotCollapse(_rootNode!, snapshot);

    final node = parseJson(text);
    if (node != null) {
      if (snapshot.isEmpty) {
        // 최초 파싱: 기본값 적용
        if (collapseChildrenByDefault) _collapseChildren(node);
        if (collapseEntriesByDefault) _collapseAllEntries(node);
      } else {
        // 재파싱: 기존 노드는 저장 상태 복원, 신규 노드만 기본값 적용
        _restoreCollapse(node, snapshot, isRoot: true);
      }
      _rootNode = node;
      layoutTree(node);
      _error = null;
    } else {
      _error = 'Invalid JSON';
    }
  }

  // 트리 전체의 collapse 상태를 path → 상태 맵으로 저장
  void _snapshotCollapse(
    JsonNode node,
    Map<String, ({bool isCollapsed, bool isEntriesCollapsed})> snapshot,
  ) {
    snapshot[node.path.join('/')] = (
      isCollapsed: node.isCollapsed,
      isEntriesCollapsed: node.isEntriesCollapsed,
    );
    for (final child in node.children) {
      _snapshotCollapse(child, snapshot);
    }
  }

  // 스냅샷에 있는 노드는 상태 복원, 신규 노드는 기본값 적용
  void _restoreCollapse(
    JsonNode node,
    Map<String, ({bool isCollapsed, bool isEntriesCollapsed})> snapshot, {
    required bool isRoot,
  }) {
    final saved = snapshot[node.path.join('/')];
    if (saved != null) {
      node.isCollapsed = saved.isCollapsed;
      node.isEntriesCollapsed = saved.isEntriesCollapsed;
    } else if (!isRoot) {
      if (collapseChildrenByDefault) node.isCollapsed = true;
      if (collapseEntriesByDefault) node.isEntriesCollapsed = true;
    }
    for (final child in node.children) {
      _restoreCollapse(child, snapshot, isRoot: false);
    }
  }

  // root 직계 자식부터 모든 하위 노드를 접힌 상태로 초기화
  void _collapseChildren(JsonNode node) {
    for (final child in node.children) {
      child.isCollapsed = true;
      _collapseChildren(child);
    }
  }

  // root 제외, 모든 하위 노드의 entries를 접힌 상태로 초기화
  void _collapseAllEntries(JsonNode root) {
    for (final child in root.children) {
      _collapseEntriesRecursive(child);
    }
  }

  void _collapseEntriesRecursive(JsonNode node) {
    node.isEntriesCollapsed = true;
    for (final child in node.children) {
      _collapseEntriesRecursive(child);
    }
  }

  // ID로 트리에서 노드를 찾는 DFS 탐색
  JsonNode? _findNode(JsonNode node, String id) {
    if (node.id == id) return node;
    for (final child in node.children) {
      final found = _findNode(child, id);
      if (found != null) return found;
    }
    return null;
  }
}
