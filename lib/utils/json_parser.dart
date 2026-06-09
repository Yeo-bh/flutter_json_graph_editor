import 'dart:convert';
import '../models/json_node.dart';

// 파싱할 때마다 새로운 ID를 부여하기 위한 카운터
int _idCounter = 0;

String _nextId() => 'node_${_idCounter++}';

// JSON 문자열을 받아 JsonNode 트리로 변환
// 파싱 실패 시 null 반환 (에디터에서 에러 표시용)
JsonNode? parseJson(String jsonText) {
  _idCounter = 0; // 파싱 시작할 때마다 ID 리셋
  try {
    final dynamic decoded = jsonDecode(jsonText);
    return _parseValue(decoded, 'root', []);
  } catch (_) {
    return null;
  }
}

// 타입에 따라 알맞은 파서로 분기
JsonNode? _parseValue(dynamic value, String label, List<String> path) {
  if (value is Map<String, dynamic>) return _parseObject(value, label, path);
  if (value is List) return _parseArray(value, label, path);
  // 루트 자체가 primitive인 경우 (드문 케이스)
  return JsonNode(
    id: _nextId(),
    label: label,
    path: path,
    entries: [_makeEntry('value', 'value', value)],
  );
}

// Object 파싱: primitive 값은 entries에, 중첩 object/array는 children에 분리
JsonNode _parseObject(Map<String, dynamic> obj, String label, List<String> path) {
  final entries = <NodeEntry>[];
  final children = <JsonNode>[];

  for (final e in obj.entries) {
    if (e.value is Map || e.value is List) {
      // 중첩 구조 → 별도 카드(자식 노드)로 분리, path에 현재 키 추가
      final child = _parseValue(e.value, e.key, [...path, e.key]);
      if (child != null) children.add(child);
    } else {
      // primitive → 현재 카드 안에 한 줄로 표시
      // navigationKey = e.key (객체는 키 그대로 사용)
      entries.add(_makeEntry(e.key, e.key, e.value));
    }
  }

  return JsonNode(
    id: _nextId(),
    label: label,
    isArray: false,
    path: path,
    entries: entries,
    children: children,
  );
}

// Array 파싱: 인덱스를 key로 사용 ([0], [1], ...)
JsonNode _parseArray(List<dynamic> arr, String label, List<String> path) {
  final entries = <NodeEntry>[];
  final children = <JsonNode>[];

  for (int i = 0; i < arr.length; i++) {
    final value = arr[i];
    if (value is Map || value is List) {
      // path에 배열 인덱스(숫자 문자열) 추가
      final child = _parseValue(value, '[$i]', [...path, '$i']);
      if (child != null) children.add(child);
    } else {
      // key는 "[0]" 형식으로 표시, navigationKey는 "0" (실제 인덱스)
      entries.add(_makeEntry('[$i]', '$i', value));
    }
  }

  return JsonNode(
    id: _nextId(),
    label: label,
    isArray: true,
    path: path,
    entries: entries,
    children: children,
  );
}

// JSON 파싱 후 2칸 들여쓰기로 재포맷, 파싱 실패 시 null 반환
String? formatJson(String text) {
  try {
    final decoded = jsonDecode(text);
    return const JsonEncoder.withIndent('  ').convert(decoded);
  } catch (_) {
    return null;
  }
}

// 값을 NodeEntry로 변환 (타입 판별 + 표시 문자열 생성)
NodeEntry _makeEntry(String key, String navigationKey, dynamic value) {
  if (value == null) {
    return NodeEntry(key: key, navigationKey: navigationKey, displayValue: 'null', type: EntryType.nullValue);
  } else if (value is bool) {
    return NodeEntry(key: key, navigationKey: navigationKey, displayValue: value.toString(), type: EntryType.boolean);
  } else if (value is num) {
    return NodeEntry(key: key, navigationKey: navigationKey, displayValue: value.toString(), type: EntryType.number);
  } else {
    return NodeEntry(key: key, navigationKey: navigationKey, displayValue: '"$value"', type: EntryType.string);
  }
}
