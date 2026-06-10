import 'package:flutter/material.dart';

// 노드 안에 표시되는 값의 타입 (문자열/숫자/불리언/null)
enum EntryType { string, number, boolean, nullValue }

// 노드 카드 안에 표시되는 한 줄의 key-value 쌍
class NodeEntry {
  final String key;           // 화면에 표시할 키 (배열은 "[0]" 형식)
  final String navigationKey; // JSON 탐색용 실제 키 (배열은 "0", 객체는 key 그대로)
  final String displayValue;  // 화면에 표시할 값 문자열 (string은 따옴표 포함)
  final EntryType type;

  const NodeEntry({
    required this.key,
    required this.navigationKey,
    required this.displayValue,
    required this.type,
  });
}

// 그래프에서 하나의 카드(노드)를 나타내는 데이터 모델
// - entries: 카드 안에 바로 표시되는 primitive 값들
// - children: 별도 카드로 분리되는 중첩 object/array
class JsonNode {
  final String id; // 레이아웃/상태에서 노드를 찾을 때 사용하는 고유 ID
  final String label; // 카드 헤더에 표시되는 키 이름
  final bool isArray; // true면 [ ], false면 { } 아이콘
  final List<NodeEntry> entries; // 카드 내부 행들
  final List<JsonNode> children; // 연결선으로 이어지는 자식 노드들
  final List<String> path; // 루트에서 이 노드까지의 JSON 탐색 경로 (updateEntryAtPath에 사용)
  bool isCollapsed; // 자식 숨김 여부
  bool isEntriesCollapsed; // 카드 내부 entries 숨김 여부
  Offset position; // 그래프 캔버스 상의 좌표 (layout 계산 후 채워짐)
  Size size; // 카드 크기 (layout 계산 후 채워짐)

  JsonNode({
    required this.id,
    required this.label,
    this.isArray = false,
    List<NodeEntry>? entries,
    List<JsonNode>? children,
    List<String>? path,
    this.isCollapsed = false,
    this.isEntriesCollapsed = false,
    this.position = Offset.zero,
    this.size = Size.zero,
  })  : entries = entries ?? [],
        children = children ?? [],
        path = path ?? [];
}
