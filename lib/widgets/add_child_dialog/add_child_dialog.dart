import 'package:flutter/material.dart';
import '../../models/add_child_dialog_style.dart';
import '../../models/child_node_type.dart';
import '../../models/json_node.dart';
import '../../state/editor_state.dart';

class AddChildDialog extends StatefulWidget {
  final JsonNode parentNode;
  final EditorState state;
  final AddChildDialogStyle style;

  const AddChildDialog({
    super.key,
    required this.parentNode,
    required this.state,
    this.style = const AddChildDialogStyle(),
  });

  @override
  State<AddChildDialog> createState() => _AddChildDialogState();
}

class _AddChildDialogState extends State<AddChildDialog> {
  late final TextEditingController _keyController;
  ChildNodeType _selectedType = ChildNodeType.object;
  String? _keyError;

  AddChildDialogStyle get s => widget.style;

  @override
  void initState() {
    super.initState();
    _keyController = TextEditingController(text: 'newKey');
  }

  @override
  void dispose() {
    _keyController.dispose();
    super.dispose();
  }

  void _submit() {
    final key = widget.parentNode.isArray ? null : _keyController.text.trim();
    if (key != null && key.isEmpty) return;
    if (key != null) {
      final existingKeys = {
        ...widget.parentNode.children.map((c) => c.label),
        ...widget.parentNode.entries.map((e) => e.key),
      };
      if (existingKeys.contains(key)) {
        setState(() => _keyError = '이미 존재하는 키입니다');
        return;
      }
    }
    widget.state.addChildToNode(
      widget.parentNode.path,
      key,
      _selectedType.defaultValue,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: s.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(s.borderRadius),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: s.maxWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Divider(height: 1, color: s.dividerColor),
            _buildBody(),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: s.headerPadding,
      child: Row(
        children: [
          Expanded(
            child: Text(
              '"${widget.parentNode.label}" ${s.titleSuffix}',
              style: TextStyle(
                color: s.titleColor,
                fontSize: s.titleFontSize,
                fontWeight: s.titleFontWeight,
                fontFamily: s.fontFamily,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.close,
              size: s.closeIconSize,
              color: s.closeIconColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final isArray = widget.parentNode.isArray;
    return Padding(
      padding: s.bodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isArray) ...[
            Text(
              '키',
              style: TextStyle(
                color: s.sectionLabelColor,
                fontSize: s.sectionLabelFontSize,
                fontWeight: FontWeight.w600,
                fontFamily: s.fontFamily,
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _keyController,
              autofocus: true,
              style: TextStyle(
                color: s.keyFieldTextColor,
                fontSize: s.keyFieldFontSize,
                fontFamily: s.fontFamily,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 9,
                ),
                errorText: _keyError,
                errorStyle: const TextStyle(fontSize: 11),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(s.keyFieldBorderRadius),
                  borderSide: BorderSide(color: s.keyFieldBorderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(s.keyFieldBorderRadius),
                  borderSide: BorderSide(color: s.keyFieldFocusedBorderColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(s.keyFieldBorderRadius),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(s.keyFieldBorderRadius),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
              onChanged: (_) {
                if (_keyError != null) setState(() => _keyError = null);
              },
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 16),
          ],
          Text(
            '타입',
            style: TextStyle(
              color: s.sectionLabelColor,
              fontSize: s.sectionLabelFontSize,
              fontWeight: FontWeight.w600,
              fontFamily: s.fontFamily,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children:
                ChildNodeType.values
                    .map(_buildChip)
                    .expand((w) => [w, const SizedBox(width: 6)])
                    .toList()
                  ..removeLast(),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(ChildNodeType type) {
    final active = _selectedType == type;
    return GestureDetector(
      onTap: () => setState(() => _selectedType = type),
      child: Container(
        padding: s.chipPadding,
        decoration: BoxDecoration(
          color: active
              ? s.chipActiveBackgroundColor
              : s.chipIdleBackgroundColor,
          borderRadius: BorderRadius.circular(s.chipBorderRadius),
          border: Border.all(
            color: active ? s.chipActiveBorderColor : s.dividerColor,
          ),
        ),
        child: Text(
          type.label,
          style: TextStyle(
            color: active ? s.chipActiveTextColor : s.chipIdleTextColor,
            fontSize: s.chipFontSize,
            fontWeight: active ? FontWeight.w600 : FontWeight.normal,
            fontFamily: s.fontFamily,
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: s.footerPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                '취소',
                style: TextStyle(
                  color: s.cancelTextColor,
                  fontSize: 13,
                  fontFamily: s.fontFamily,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _submit,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: s.confirmBackgroundColor,
                borderRadius: BorderRadius.circular(s.confirmBorderRadius),
              ),
              child: Text(
                '추가',
                style: TextStyle(
                  color: s.confirmTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: s.fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
