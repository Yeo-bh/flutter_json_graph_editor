import 'package:flutter/material.dart';
import '../../models/style/graph_toolbar_style.dart';
import '../../core/utils/node_searcher.dart';

/// 툴바 위에 표시되는 검색 입력창 + 필터 칩
class GraphSearchBar extends StatefulWidget {
  final SearchMode mode;
  final int matchCount;
  final ValueChanged<String> onQueryChanged;
  final ValueChanged<SearchMode> onModeChanged;
  final VoidCallback onClose;
  final GraphToolbarStyle style;

  const GraphSearchBar({
    super.key,
    required this.mode,
    required this.matchCount,
    required this.onQueryChanged,
    required this.onModeChanged,
    required this.onClose,
    this.style = const GraphToolbarStyle(),
  });

  @override
  State<GraphSearchBar> createState() => _GraphSearchBarState();
}

class _GraphSearchBarState extends State<GraphSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() => widget.onQueryChanged(_controller.text);

  @override
  Widget build(BuildContext context) {
    final s = widget.style;
    return Container(
      width: 340,
      padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
      decoration: BoxDecoration(
        color: s.searchBarBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: s.searchBarShadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 13,
                    color: s.searchBarTextColor,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: '검색어 입력...',
                    hintStyle: TextStyle(
                      color: s.searchBarHintColor,
                      fontSize: 13,
                    ),
                  ),
                  onSubmitted: (_) => _submit(),
                  textInputAction: TextInputAction.search,
                ),
              ),
              if (widget.matchCount > 0)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    '${widget.matchCount}개',
                    style: TextStyle(
                      fontSize: 11,
                      color: s.activeIconColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              IconButton(
                onPressed: _submit,
                tooltip: '검색',
                icon: Icon(
                  Icons.search,
                  size: 14,
                  color: s.activeIconColor,
                ),
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(4),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              IconButton(
                onPressed: widget.onClose,
                icon: Icon(
                  Icons.close,
                  size: 14,
                  color: s.searchBarHintColor,
                ),
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(4),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: SearchMode.values.map((mode) {
              final active = widget.mode == mode;
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: GestureDetector(
                  onTap: () => widget.onModeChanged(mode),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: active
                          ? s.activeIconColor
                          : s.chipIdleBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      mode.label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: active
                            ? s.chipActiveTextColor
                            : s.chipIdleTextColor,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
