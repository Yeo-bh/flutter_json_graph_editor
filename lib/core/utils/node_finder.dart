import '../../models/json_node.dart';

// ID 기반 탐색: 위젯 이벤트(toggleCollapse 등)에서 사용
JsonNode? findNodeById(JsonNode node, String id) {
  if (node.id == id) return node;
  for (final child in node.children) {
    final found = findNodeById(child, id);
    if (found != null) return found;
  }
  return null;
}

// path 기반 탐색: 재파싱 후 사이드 패널이 같은 노드를 다시 찾을 때 사용
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
