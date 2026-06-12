import 'dart:convert';

/// JSON 텍스트에 대한 순수 뮤테이션 함수 모음.
/// 각 함수는 성공 시 새 JSON 문자열, 실패(경로 오류·타입 불일치)시 null 반환.
/// EditorState가 null 체크 후 updateText() 호출하는 패턴으로 사용.

// 노드 경로 끝 대상에 자식 추가 (Map이면 key 필수, List면 key 무시하고 append)
String? addChildToJson(
  String jsonText,
  List<String> nodePath,
  String? key,
  dynamic defaultValue,
) {
  try {
    final dynamic decoded = jsonDecode(jsonText);
    dynamic current = decoded;
    for (final k in nodePath) {
      current = current is List ? current[int.parse(k)] : current[k];
    }
    if (current is Map) {
      current[key!] = defaultValue;
    } else if (current is List) {
      current.add(defaultValue);
    }
    return const JsonEncoder.withIndent('  ').convert(decoded);
  } catch (_) {
    return null;
  }
}

// nodePath로 탐색한 Map/List에서 navigationKey에 해당하는 primitive 값 교체
String? updateEntryInJson(
  String jsonText,
  List<String> nodePath,
  String navigationKey,
  dynamic newValue,
) {
  try {
    final dynamic decoded = jsonDecode(jsonText);
    dynamic current = decoded;
    for (final key in nodePath) {
      current = current is List ? current[int.parse(key)] : current[key];
    }
    if (current is List) {
      current[int.parse(navigationKey)] = newValue;
    } else if (current is Map) {
      current[navigationKey] = newValue;
    }
    return const JsonEncoder.withIndent('  ').convert(decoded);
  } catch (_) {
    return null;
  }
}

// Map의 키 이름 변경. 키 순서 보존을 위해 전체 재구성.
// 부모가 List면 인덱스라 키 개념이 없으므로 null 반환.
// 중복 키나 빈 문자열은 조용히 무시.
String? renameKeyInJson(String jsonText, List<String> nodePath, String newKey) {
  if (nodePath.isEmpty) return null;
  final oldKey = nodePath.last;
  if (oldKey == newKey || newKey.trim().isEmpty) return null;
  try {
    final dynamic decoded = jsonDecode(jsonText);
    final parentPath = nodePath.sublist(0, nodePath.length - 1);

    dynamic parent = decoded;
    for (final k in parentPath) {
      parent = parent is List ? parent[int.parse(k)] : parent[k];
    }
    if (parent is! Map) return null;
    if (parent.containsKey(newKey)) return null;

    // 기존 순서 유지하며 키만 교체
    final rebuilt = <String, dynamic>{};
    for (final e in (parent as Map<String, dynamic>).entries) {
      rebuilt[e.key == oldKey ? newKey : e.key] = e.value;
    }

    if (parentPath.isEmpty) {
      return const JsonEncoder.withIndent('  ').convert(rebuilt);
    }

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
    return const JsonEncoder.withIndent('  ').convert(decoded);
  } catch (_) {
    return null;
  }
}

// nodePath 노드 내부의 entry 키 이름 변경. 키 순서 보존.
String? renameEntryKeyInJson(
  String jsonText,
  List<String> nodePath,
  String oldKey,
  String newKey,
) {
  if (oldKey == newKey || newKey.trim().isEmpty) return null;
  try {
    final dynamic decoded = jsonDecode(jsonText);
    dynamic node = decoded;
    for (final k in nodePath) {
      node = node is List ? node[int.parse(k)] : node[k];
    }
    if (node is! Map) return null;
    if ((node).containsKey(newKey)) return null;

    final rebuilt = <String, dynamic>{};
    for (final e in (node as Map<String, dynamic>).entries) {
      rebuilt[e.key == oldKey ? newKey : e.key] = e.value;
    }

    if (nodePath.isEmpty) {
      return const JsonEncoder.withIndent('  ').convert(rebuilt);
    }

    dynamic parent = decoded;
    for (final k in nodePath.sublist(0, nodePath.length - 1)) {
      parent = parent is List ? parent[int.parse(k)] : parent[k];
    }
    final lastKey = nodePath.last;
    if (parent is List) {
      parent[int.parse(lastKey)] = rebuilt;
    } else {
      (parent as Map)[lastKey] = rebuilt;
    }
    return const JsonEncoder.withIndent('  ').convert(decoded);
  } catch (_) {
    return null;
  }
}

// nodePath의 대상 노드를 부모에서 제거. 루트(빈 path)는 삭제 불가.
String? deleteNodeAtPath(String jsonText, List<String> nodePath) {
  if (nodePath.isEmpty) return null;
  try {
    final dynamic decoded = jsonDecode(jsonText);
    final parentPath = nodePath.sublist(0, nodePath.length - 1);

    dynamic parent = decoded;
    for (final k in parentPath) {
      parent = parent is List ? parent[int.parse(k)] : parent[k];
    }
    final lastKey = nodePath.last;
    if (parent is Map) {
      parent.remove(lastKey);
    } else if (parent is List) {
      parent.removeAt(int.parse(lastKey));
    }
    return const JsonEncoder.withIndent('  ').convert(decoded);
  } catch (_) {
    return null;
  }
}
