import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/style/node_card_style.dart';

// 노드 간 간격 상수 (카드 스타일과 무관한 레이아웃 전용 값)
const double kHGap = 100.0; // 부모-자식 카드 사이 가로 간격
const double kVGap = 20.0; // 형제 카드 사이 세로 간격

// edge_painter 호환용 상수 — NodeCardStyle.defaults.width와 동일한 값 유지
const double kNodeWidth = 210.0;

// 카드 자체의 픽셀 높이 (헤더 + entry 줄 수 * 줄 높이 + 상하 테두리)
// entries가 접혀있으면 헤더 높이만 사용
double nodeHeight(
  JsonNode node, [
  NodeCardStyle style = const NodeCardStyle(),
]) {
  final entryRows = node.isEntriesCollapsed ? 0 : node.entries.length;
  return style.headerHeight +
      entryRows * style.entryHeight +
      style.borderWidth * 2;
}

// 해당 노드의 서브트리 전체가 차지하는 세로 높이
// (펼쳐진 자식들을 포함한 총 높이, 레이아웃 계산에 사용)
double subtreeHeight(
  JsonNode node, [
  NodeCardStyle style = const NodeCardStyle(),
]) {
  if (node.isCollapsed || node.children.isEmpty) return nodeHeight(node, style);

  // 자식들의 subtreeHeight 합계 + 자식 간 간격
  double total = 0;
  for (int i = 0; i < node.children.length; i++) {
    if (i > 0) total += kVGap;
    total += subtreeHeight(node.children[i], style);
  }
  // 자식 총 높이가 부모 카드보다 작으면 부모 높이를 최솟값으로 보장
  return total < nodeHeight(node, style) ? nodeHeight(node, style) : total;
}

// 트리 전체 레이아웃 시작 (루트에서 시작, 약간의 패딩 포함)
void layoutTree(JsonNode root, [NodeCardStyle style = const NodeCardStyle()]) =>
    _layoutNode(root, 40.0, 40.0, style);

// 재귀적으로 각 노드의 position과 size를 계산
void _layoutNode(JsonNode node, double x, double y, NodeCardStyle style) {
  final double nh = nodeHeight(node, style);
  final double sh = subtreeHeight(node, style);

  // 부모 카드를 서브트리 높이 기준으로 수직 중앙 정렬
  node.position = Offset(x, y + (sh - nh) / 2);
  node.size = Size(style.width, nh);

  if (!node.isCollapsed && node.children.isNotEmpty) {
    // 자식은 부모 오른쪽(x + 카드너비 + 간격)에 배치
    double childX = x + style.width + kHGap;
    double childY = y;
    for (final child in node.children) {
      _layoutNode(child, childX, childY, style);
      childY += subtreeHeight(child, style) + kVGap; // 다음 자식은 이전 자식 아래에
    }
  }
}
