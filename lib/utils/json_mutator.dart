import 'dart:convert';

/// Pure JSON mutation helpers. Each function returns new formatted JSON text,
/// or null if the operation fails or is a no-op.

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

String? renameKeyInJson(
  String jsonText,
  List<String> nodePath,
  String newKey,
) {
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
