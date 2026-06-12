import '../../models/json_node.dart';

// 입력 문자열을 적절한 Dart 타입으로 변환
// 우선순위: null → bool → num → String
dynamic parseJsonInput(String input) {
  if (input == 'null') return null;
  if (input == 'true') return true;
  if (input == 'false') return false;
  final n = num.tryParse(input);
  if (n != null) return n;
  return input;
}

// 지정된 타입으로 강제 변환 — 자동 추론 없음
dynamic coerceToType(String input, EntryType type) {
  return switch (type) {
    EntryType.string => input,
    EntryType.number => num.tryParse(input) ?? 0,
    EntryType.boolean => input.trim().toLowerCase() == 'true',
    EntryType.nullValue => null,
  };
}
