import '../models/json_node.dart';

enum SearchMode {
  key,
  entryKey,
  value;

  String get label => switch (this) {
    SearchMode.key => '키',
    SearchMode.entryKey => 'Entry 키',
    SearchMode.value => 'Value',
  };
}

class SearchResult {
  /// 직접 매칭된 노드 ID (count 표시용)
  final Set<String> matchedIds;

  /// matchedIds + non-root 조상 ID (하이라이트용)
  final Set<String> highlightedIds;

  const SearchResult({required this.matchedIds, required this.highlightedIds});

  static const empty = SearchResult(matchedIds: {}, highlightedIds: {});
}

/// 트리 전체를 탐색해 [mode]에 따라 [query]와 일치하는 노드를 찾는다.
///
/// - key: 노드 label 포함 여부
/// - entryKey: 노드 entries의 key 포함 여부
/// - value: 노드 entries의 값 포함 여부
SearchResult searchNodes(JsonNode root, String query, SearchMode mode) {
  if (query.isEmpty) return SearchResult.empty;
  final q = query.toLowerCase();
  final matched = <String>{};
  final highlighted = <String>{};
  _traverse(root, q, mode, matched, highlighted, const []);
  return SearchResult(matchedIds: matched, highlightedIds: highlighted);
}

void _traverse(
  JsonNode node,
  String q,
  SearchMode mode,
  Set<String> matched,
  Set<String> highlighted,
  List<String> parentIds,
) {
  void addMatch(String id) {
    matched.add(id);
    highlighted.add(id);
    highlighted.addAll(parentIds);
  }

  switch (mode) {
    case SearchMode.key:
      if (node.label.toLowerCase().contains(q)) addMatch(node.id);
    case SearchMode.entryKey:
      if (node.entries.any((e) => e.key.toLowerCase().contains(q))) {
        addMatch(node.id);
      }
    case SearchMode.value:
      if (node.entries.any((e) => e.displayValue.toLowerCase().contains(q))) {
        addMatch(node.id);
      }
  }

  // root(path 비어있음)는 parentIds에 추가 안 함
  final nextParents = node.path.isEmpty ? parentIds : [...parentIds, node.id];

  for (final child in node.children) {
    _traverse(child, q, mode, matched, highlighted, nextParents);
  }
}
