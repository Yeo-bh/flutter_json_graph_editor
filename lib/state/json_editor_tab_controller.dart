import 'package:flutter/foundation.dart';
import '../models/json_editor_tab.dart';
import 'editor_state.dart';

class JsonEditorTabController extends ChangeNotifier {
  final List<JsonEditorTab> _tabs = [];
  final Map<String, EditorState> _states = {};
  int _activeIndex = 0;

  List<JsonEditorTab> get tabs => List.unmodifiable(_tabs);
  int get activeIndex => _activeIndex;
  JsonEditorTab? get activeTab => _tabs.isEmpty ? null : _tabs[_activeIndex];

  EditorState? stateFor(String tabId) => _states[tabId];
  EditorState? get activeState =>
      activeTab == null ? null : _states[activeTab!.id];

  String? getJsonText(String tabId) => _states[tabId]?.jsonText;
  String? get activeJsonText => activeState?.jsonText;

  JsonEditorTabController({
    List<({String name, String? initialJson})> initialTabs = const [],
  }) {
    if (initialTabs.isEmpty) {
      _addTabInternal(name: 'Tab 1');
    } else {
      for (final t in initialTabs) {
        _addTabInternal(name: t.name, initialJson: t.initialJson);
      }
    }
  }

  void addTab({String? name, String? initialJson}) {
    _addTabInternal(
      name: name ?? 'Tab${_tabs.length + 1}.json',
      initialJson: initialJson,
    );
    _activeIndex = _tabs.length - 1;
    notifyListeners();
  }

  void removeTab(String tabId) {
    final idx = _tabs.indexWhere((t) => t.id == tabId);
    if (idx == -1 || _tabs.length == 1) return;
    _tabs.removeAt(idx);
    _states.remove(tabId);
    if (_activeIndex >= _tabs.length) _activeIndex = _tabs.length - 1;
    notifyListeners();
  }

  void setActive(int index) {
    if (index < 0 || index >= _tabs.length || index == _activeIndex) return;
    _activeIndex = index;
    notifyListeners();
  }

  void renameTab(String tabId, String newName) {
    final idx = _tabs.indexWhere((t) => t.id == tabId);
    if (idx == -1) return;
    _tabs[idx] = _tabs[idx].copyWith(name: newName);
    notifyListeners();
  }

  void _addTabInternal({required String name, String? initialJson}) {
    final id = '${DateTime.now().microsecondsSinceEpoch}_${_tabs.length}';
    _tabs.add(JsonEditorTab(id: id, name: name));
    _states[id] = EditorState(initialJson: initialJson);
  }

  @override
  void dispose() {
    for (final state in _states.values) {
      state.dispose();
    }
    super.dispose();
  }
}
