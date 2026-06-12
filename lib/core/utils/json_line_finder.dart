/// 2-space 들여쓰기 JSON에서 path에 해당하는 노드의 라인 범위를 반환.
/// 반환값: (시작 라인 인덱스, 끝 라인 인덱스). 찾지 못하면 null.
(int start, int end)? findNodeLineRange(String jsonText, List<String> path) {
  if (path.isEmpty) return null;
  final lines = jsonText.split('\n');
  int lineIdx = 0;

  for (int pi = 0; pi < path.length; pi++) {
    final segment = path[pi];
    final targetIndent = (pi + 1) * 2;
    final prefix = ' ' * targetIndent;
    final isArrayIndex = int.tryParse(segment) != null;

    bool found = false;
    if (isArrayIndex) {
      // 배열 원소: targetIndent에서 {나 [로 시작하는 라인을 인덱스 순서로 탐색
      int elementCount = 0;
      final targetIndex = int.parse(segment);
      for (int i = lineIdx; i < lines.length; i++) {
        final line = lines[i];
        if (!_isExactIndent(line, targetIndent, prefix)) continue;
        final trimmed = line.trimLeft();
        if (trimmed.startsWith('{') || trimmed.startsWith('[')) {
          if (elementCount == targetIndex) {
            lineIdx = i;
            found = true;
            break;
          }
          elementCount++;
        }
      }
    } else {
      // 객체 키: `"segment":` 패턴 탐색
      for (int i = lineIdx; i < lines.length; i++) {
        final line = lines[i];
        if (!_isExactIndent(line, targetIndent, prefix)) continue;
        if (line.trimLeft().startsWith('"$segment":')) {
          lineIdx = i;
          found = true;
          break;
        }
      }
    }
    if (!found) return null;
  }

  final startLine = lineIdx;
  final endLine = _findClosingLine(lines, startLine);
  return (startLine, endLine);
}

// 라인이 정확히 targetIndent만큼 들여쓰여 있는지 확인 (더 깊으면 false)
bool _isExactIndent(String line, int targetIndent, String prefix) {
  if (!line.startsWith(prefix)) return false;
  if (line.length > targetIndent && line[targetIndent] == ' ') return false;
  return true;
}

// startLine에서 시작하는 블록의 닫는 괄호/중괄호가 있는 라인 반환.
// 문자열 내부의 괄호는 무시 (이스케이프 처리 포함).
int _findClosingLine(List<String> lines, int startLine) {
  int depth = 0;
  bool inString = false;
  bool escaped = false;

  for (int i = startLine; i < lines.length; i++) {
    for (final ch in lines[i].codeUnits) {
      if (escaped) {
        escaped = false;
        continue;
      }
      if (ch == 92 && inString) { // backslash
        escaped = true;
        continue;
      }
      if (ch == 34) { // double quote
        inString = !inString;
        continue;
      }
      if (inString) continue;
      if (ch == 123 || ch == 91) { depth++; }   // { or [
      else if (ch == 125 || ch == 93) {     // } or ]
        depth--;
        if (depth == 0) return i;
      }
    }
  }
  return startLine;
}
