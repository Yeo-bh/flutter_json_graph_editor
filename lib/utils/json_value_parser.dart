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
