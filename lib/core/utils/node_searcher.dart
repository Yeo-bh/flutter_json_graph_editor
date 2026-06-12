import '../../models/json_node.dart';

enum SearchMode {
  all,
  key,
  value;

  String get label => switch (this) {
    SearchMode.all => '전체',
    SearchMode.key => '키',
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
/// - all: 노드 label + entry key + entry value
/// - key: 노드 label만
/// - value: entry value만
/// 매칭 노드 + non-root 조상 노드 모두 highlightedIds에 포함
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

  final labelMatch = node.label.toLowerCase().contains(q);
  final entryKeyMatch = node.entries.any((e) => e.key.toLowerCase().contains(q));
  final valueMatch = node.entries.any((e) => e.displayValue.toLowerCase().contains(q));

  final isMatch = switch (mode) {
    SearchMode.all => labelMatch || entryKeyMatch || valueMatch,
    SearchMode.key => labelMatch,
    SearchMode.value => valueMatch,
  };

  if (isMatch) addMatch(node.id);

  final nextParents = node.path.isEmpty ? parentIds : [...parentIds, node.id];

  for (final child in node.children) {
    _traverse(child, q, mode, matched, highlighted, nextParents);
  }
}
