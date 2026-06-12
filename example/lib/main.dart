import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:json_graph_editor/json_graph_editor.dart';

void main() {
  runApp(const JsonEditorApp());
}

class JsonEditorApp extends StatelessWidget {
  const JsonEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Editor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFAFBFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F8FA),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Color(0xFF24292E),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  final _tabController = JsonEditorTabController(
    initialTabs: [
      (name: 'sample.json', initialJson: null),
      (name: 'config.json', initialJson: '{"env":"production","debug":false}'),
    ],
    onChanged: (String tabId, dynamic json) {
      dev.log('[$tabId] $json', name: 'onChanged');
    },
  );

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.account_tree_outlined, size: 18, color: Color(0xFF0366D6)),
            SizedBox(width: 8),
            Text('JSON Editor'),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xFFE1E4E8)),
        ),
      ),
      body: JsonEditorTabView(
        controller: _tabController,
        extraActions: [
          GraphToolbarAction(
            icon: Icons.save_outlined,
            tooltip: 'Save',
            onTap: (ctx) {
              final json = ctx.read<EditorState>().jsonText;
              _onSave(ctx, json);
            },
          ),
        ],
      ),
    );
  }

  void _onSave(BuildContext context, String json) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Saved (${json.length} chars)',
          style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
        ),
        backgroundColor: const Color(0xFF1F6FEB),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        width: 240,
      ),
    );
  }
}
