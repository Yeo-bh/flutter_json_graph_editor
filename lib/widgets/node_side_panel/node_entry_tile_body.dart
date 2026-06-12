import 'package:flutter/material.dart';
import '../../models/json_node.dart';
import '../../models/style/node_detail_style.dart';

/// 엔트리 값의 표시·편집 위젯. 타입별로 UI가 다르다.
/// - string: TextField (항상 유효)
/// - int64: TextField + 정수 유효성 검사
/// - double_: TextField + 실수 유효성 검사
/// - boolean: True / False 토글 버튼
/// - timestamp: TextField + 달력 아이콘 (DateTimePicker)
/// - nullValue: "null" 표시 전용
class NodeEntryTileBody extends StatefulWidget {
  final EntryType type;

  /// Raw 값: string은 따옴표 없이, bool은 bool, num은 num, timestamp는 ISO 문자열
  final dynamic initialValue;

  final bool isEditing;
  final NodeDetailStyle style;

  /// 값 또는 유효성이 바뀔 때마다 (value, isValid) 콜백
  final void Function(dynamic value, bool isValid)? onChanged;

  /// TextField에서 Enter 입력 시 저장 트리거
  final VoidCallback? onSave;

  const NodeEntryTileBody({
    super.key,
    required this.type,
    required this.initialValue,
    required this.style,
    this.isEditing = false,
    this.onChanged,
    this.onSave,
  });

  @override
  State<NodeEntryTileBody> createState() => _NodeEntryTileBodyState();
}

class _NodeEntryTileBodyState extends State<NodeEntryTileBody> {
  late TextEditingController _controller;
  late bool _boolValue;
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _boolValue = widget.initialValue == true;
    _controller = TextEditingController(text: _toText(widget.initialValue));
    _isValid = _validate(_controller.text);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged?.call(_currentValue(_controller.text), _isValid);
    });
  }

  @override
  void didUpdateWidget(NodeEntryTileBody old) {
    super.didUpdateWidget(old);
    if (old.type != widget.type) {
      final def = _defaultFor(widget.type);
      _boolValue = def == true;
      _controller.text = _toText(def);
      _isValid = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged?.call(def, true);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static dynamic _defaultFor(EntryType type) => switch (type) {
    EntryType.string => '',
    EntryType.int64 => 0,
    EntryType.double_ => 0.0,
    EntryType.boolean => false,
    EntryType.timestamp => '',
    EntryType.nullValue => null,
  };

  String _toText(dynamic value) => value?.toString() ?? '';

  bool _validate(String text) => switch (widget.type) {
    EntryType.int64 => int.tryParse(text) != null,
    EntryType.double_ => double.tryParse(text) != null,
    _ => true,
  };

  dynamic _currentValue(String text) => switch (widget.type) {
    EntryType.string => text,
    EntryType.int64 => int.tryParse(text) ?? 0,
    EntryType.double_ => double.tryParse(text) ?? 0.0,
    EntryType.timestamp => text,
    EntryType.boolean => _boolValue,
    EntryType.nullValue => null,
  };

  void _onTextChanged(String text) {
    final valid = _validate(text);
    setState(() => _isValid = valid);
    widget.onChanged?.call(_currentValue(text), valid);
  }

  void _setBool(bool value) {
    setState(() => _boolValue = value);
    widget.onChanged?.call(value, true);
  }

  Future<void> _pickDateTime() async {
    final c = widget.style.headerBadgeTextColor;
    final colorScheme = Theme.of(context).colorScheme.copyWith(
      primary: c,
      onPrimary: Colors.white,
      primaryContainer: c,
      onPrimaryContainer: Colors.white,
      secondary: c,
      onSecondary: Colors.white,
      secondaryContainer: c,
      onSecondaryContainer: Colors.white,
    );
    Widget wrap(Widget? child) => Theme(
      data: Theme.of(context).copyWith(
        colorScheme: colorScheme,
        timePickerTheme: TimePickerThemeData(
          dayPeriodColor: WidgetStateColor.resolveWith(
            (states) =>
                states.contains(WidgetState.selected) ? c : Colors.transparent,
          ),
          dayPeriodTextColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? Colors.white
                : colorScheme.onSurface,
          ),
        ),
      ),
      child: child!,
    );

    DateTime initial = DateTime.now();
    if (_controller.text.isNotEmpty) {
      initial = DateTime.tryParse(_controller.text) ?? initial;
    }
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
      builder: (_, child) => wrap(child),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
      builder: (_, child) => wrap(child),
    );
    if (!mounted) return;
    final combined = time == null
        ? date
        : DateTime(date.year, date.month, date.day, time.hour, time.minute);
    final iso = combined.toIso8601String();
    setState(() => _controller.text = iso);
    widget.onChanged?.call(iso, true);
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isEditing) return _buildDisplay();
    return switch (widget.type) {
      EntryType.boolean => _buildBoolEditor(),
      EntryType.timestamp => _buildTimestampEditor(),
      _ => _buildTextField(),
    };
  }

  Widget _buildDisplay() {
    final s = widget.style;
    final Color valueColor = switch (widget.type) {
      EntryType.string => s.stringValueColor,
      EntryType.int64 => s.numberValueColor,
      EntryType.double_ => s.numberValueColor,
      EntryType.boolean => s.booleanValueColor,
      EntryType.timestamp => s.stringValueColor,
      EntryType.nullValue => s.nullValueColor,
    };
    final display = widget.type == EntryType.string
        ? '"${widget.initialValue}"'
        : _toText(widget.initialValue);
    return Text(
      display,
      style: TextStyle(
        color: valueColor,
        fontSize: s.entryValueFontSize,
        fontFamily: s.fontFamily,
      ),
    );
  }

  Widget _buildTextField() {
    final s = widget.style;
    final needsValidation =
        widget.type == EntryType.int64 || widget.type == EntryType.double_;
    final errorMsg = widget.type == EntryType.int64
        ? '정수를 입력하세요 (예: 42)'
        : '실수를 입력하세요 (예: 3.14)';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _controller,
          autofocus: true,
          maxLines: needsValidation ? 1 : null,
          keyboardType: widget.type == EntryType.int64
              ? TextInputType.number
              : widget.type == EntryType.double_
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.multiline,
          style: TextStyle(
            color: s.metaValueColor,
            fontFamily: s.fontFamily,
            fontSize: s.entryValueFontSize,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: needsValidation && !_isValid
                    ? const Color(0xFFF44336)
                    : s.dividerColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: needsValidation && !_isValid
                    ? const Color(0xFFF44336)
                    : s.headerBadgeTextColor,
              ),
            ),
          ),
          onChanged: _onTextChanged,
          onSubmitted: _isValid ? (_) => widget.onSave?.call() : null,
        ),
        if (needsValidation && !_isValid)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              errorMsg,
              style: TextStyle(
                color: const Color(0xFFF44336),
                fontSize: 10,
                fontFamily: s.fontFamily,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBoolEditor() {
    final s = widget.style;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _boolBtn(
          'True',
          isActive: _boolValue,
          onTap: () => _setBool(true),
          s: s,
        ),
        const SizedBox(width: 6),
        _boolBtn(
          'False',
          isActive: !_boolValue,
          onTap: () => _setBool(false),
          s: s,
        ),
      ],
    );
  }

  Widget _boolBtn(
    String label, {
    required bool isActive,
    required VoidCallback onTap,
    required NodeDetailStyle s,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: s.typeBadgePadding,
        decoration: BoxDecoration(
          color: isActive
              ? s.headerBadgeBackgroundColor
              : s.entryTileBackgroundColor,
          borderRadius: BorderRadius.circular(s.typeBadgeBorderRadius),
          border: Border.all(
            color: isActive
                ? s.headerBadgeTextColor.withValues(alpha: 0.6)
                : s.dividerColor,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? s.headerBadgeTextColor : s.metaLabelColor,
            fontSize: s.entryValueFontSize,
            fontFamily: s.fontFamily,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildTimestampEditor() {
    final s = widget.style;
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            autofocus: true,
            style: TextStyle(
              color: s.metaValueColor,
              fontFamily: s.fontFamily,
              fontSize: s.entryValueFontSize,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              hintText: 'ISO 8601 (예: 2024-01-15T10:30:00)',
              hintStyle: TextStyle(
                color: s.metaLabelColor,
                fontSize: s.entryValueFontSize,
                fontFamily: s.fontFamily,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: s.dividerColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: s.headerBadgeTextColor),
              ),
            ),
            onChanged: _onTextChanged,
            onSubmitted: (_) => widget.onSave?.call(),
          ),
        ),
        IconButton(
          onPressed: _pickDateTime,
          tooltip: '날짜/시간 선택',
          icon: Icon(
            Icons.calendar_today_outlined,
            size: 16,
            color: s.metaLabelColor,
          ),
          padding: const EdgeInsets.all(4),
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}
