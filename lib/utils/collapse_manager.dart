import '../models/json_node.dart';

typedef CollapseSnapshot
    = Map<String, ({bool isCollapsed, bool isEntriesCollapsed})>;

void snapshotCollapse(JsonNode node, CollapseSnapshot snapshot) {
  snapshot[node.path.join('/')] = (
    isCollapsed: node.isCollapsed,
    isEntriesCollapsed: node.isEntriesCollapsed,
  );
  for (final child in node.children) {
    snapshotCollapse(child, snapshot);
  }
}

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

void collapseChildren(JsonNode node) {
  for (final child in node.children) {
    child.isCollapsed = true;
    collapseChildren(child);
  }
}

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
