import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/json_editor_tab.dart';
import 'editor_state.dart';

class JsonEditorTabController extends ChangeNotifier {
  final List<JsonEditorTab> _tabs = [];
  final Map<String, EditorState> _states = {};
  final Map<String, VoidCallback> _listeners = {};
  int _activeIndex = 0;

  /// 특정 탭의 JSON이 유효하게 변경될 때마다 호출. tabId와 파싱된 dynamic 값 전달.
  void Function(String tabId, dynamic json)? onChanged;

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
    this.onChanged,
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
    _detachListener(tabId);
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
    final state = EditorState(initialJson: initialJson);
    _states[id] = state;
    void listener() => _onStateChanged(id);
    _listeners[id] = listener;
    state.addListener(listener);
  }

  void _onStateChanged(String tabId) {
    final cb = onChanged;
    if (cb == null) return;
    final state = _states[tabId];
    if (state == null || state.error != null) return;
    try {
      cb(tabId, jsonDecode(state.jsonText));
    } catch (_) {}
  }

  void _detachListener(String tabId) {
    final listener = _listeners.remove(tabId);
    if (listener != null) _states[tabId]?.removeListener(listener);
  }

  @override
  void dispose() {
    for (final tabId in _listeners.keys.toList()) {
      _detachListener(tabId);
    }
    for (final state in _states.values) {
      state.dispose();
    }
    super.dispose();
  }
}
