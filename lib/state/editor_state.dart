import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/json_node.dart';
import '../utils/json_parser.dart';
import '../utils/tree_layout.dart';

const _kDefaultJson = '''
{
  "name": "JSON Editor",
  "version": "1.0.0",
  "author": {
    "name": "Developer",
    "email": "dev@example.com"
  },
  "features": {
    "editor": true,
    "graph": true,
    "theme": "dark"
  },
  "tags": ["flutter", "web", "json"]
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
  void updateEntryAtPath(List<String> nodePath, String navigationKey, dynamic newValue) {
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

  void _parse(String text) {
    if (text.trim().isEmpty) {
      _rootNode = null;
      _error = null;
      return;
    }
    final node = parseJson(text);
    if (node != null) {
      if (collapseChildrenByDefault) _collapseChildren(node);
      if (collapseEntriesByDefault) _collapseAllEntries(node);
      _rootNode = node;
      layoutTree(node); // 파싱 성공 시 즉시 레이아웃 계산
      _error = null;
    } else {
      _error = 'Invalid JSON'; // 파싱 실패 → 이전 그래프 유지, 에러만 표시
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
