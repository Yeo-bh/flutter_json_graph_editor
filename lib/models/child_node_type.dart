/// 그래프에서 자식 노드로 추가 가능한 타입 (primitive 값 제외)
enum ChildNodeType { object, array }

extension ChildNodeTypeExt on ChildNodeType {
  String get label => switch (this) {
        ChildNodeType.object => 'Object { }',
        ChildNodeType.array => 'Array [ ]',
      };

  dynamic get defaultValue => switch (this) {
        ChildNodeType.object => <String, dynamic>{},
        ChildNodeType.array => <dynamic>[],
      };
}
