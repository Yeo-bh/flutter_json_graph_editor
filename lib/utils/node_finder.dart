import '../models/json_node.dart';

JsonNode? findNodeById(JsonNode node, String id) {
  if (node.id == id) return node;
  for (final child in node.children) {
    final found = findNodeById(child, id);
    if (found != null) return found;
  }
  return null;
}

JsonNode? findNodeByPath(JsonNode node, List<String> target) {
  if (_pathEquals(node.path, target)) return node;
  for (final child in node.children) {
    final found = findNodeByPath(child, target);
    if (found != null) return found;
  }
  return null;
}

bool _pathEquals(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
