import '../models/json_node.dart';

/// JsonNode 트리의 collapse 상태를 관리하는 순수 함수 모음.
/// EditorState._parse()에서 재파싱 시 기존 UI 상태를 보존하는 데 사용.

// path 문자열을 키로 사용해 현재 상태를 저장 (재파싱 전 스냅샷)
typedef CollapseSnapshot
    = Map<String, ({bool isCollapsed, bool isEntriesCollapsed})>;

// 트리 전체를 DFS 순회하며 path → collapse 상태 맵 생성
void snapshotCollapse(JsonNode node, CollapseSnapshot snapshot) {
  snapshot[node.path.join('/')] = (
    isCollapsed: node.isCollapsed,
    isEntriesCollapsed: node.isEntriesCollapsed,
  );
  for (final child in node.children) {
    snapshotCollapse(child, snapshot);
  }
}

// 스냅샷에 있는 노드는 이전 상태 복원, 신규 노드(추가된 키)만 기본값 적용
void restoreCollapse(
  JsonNode node,
  CollapseSnapshot snapshot, {
  required bool isRoot,
  required bool collapseChildrenByDefault,
  required bool collapseEntriesByDefault,
}) {
  final saved = snapshot[node.path.join('/')];
  if (saved != null) {
    node.isCollapsed = saved.isCollapsed;
    node.isEntriesCollapsed = saved.isEntriesCollapsed;
  } else if (!isRoot) {
    // 새로 추가된 노드에만 기본값 적용 (루트는 항상 펼침)
    if (collapseChildrenByDefault) node.isCollapsed = true;
    if (collapseEntriesByDefault) node.isEntriesCollapsed = true;
  }
  for (final child in node.children) {
    restoreCollapse(
      child,
      snapshot,
      isRoot: false,
      collapseChildrenByDefault: collapseChildrenByDefault,
      collapseEntriesByDefault: collapseEntriesByDefault,
    );
  }
}

// 최초 파싱 시 root 직계 자식부터 전체 접힘 상태로 초기화
void collapseChildren(JsonNode node) {
  for (final child in node.children) {
    child.isCollapsed = true;
    collapseChildren(child);
  }
}

// root 제외한 모든 노드의 entries를 접힘 상태로 초기화
void collapseAllEntries(JsonNode root) {
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
