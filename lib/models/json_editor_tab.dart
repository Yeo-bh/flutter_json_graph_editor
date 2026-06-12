class JsonEditorTab {
  final String id;
  final String name;

  const JsonEditorTab({required this.id, required this.name});

  JsonEditorTab copyWith({String? name}) =>
      JsonEditorTab(id: id, name: name ?? this.name);
}
