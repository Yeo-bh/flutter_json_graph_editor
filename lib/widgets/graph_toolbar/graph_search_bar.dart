import 'package:flutter/material.dart';
import '../../utils/node_searcher.dart';

/// 툴바 위에 표시되는 검색 입력창 + 필터 칩
class GraphSearchBar extends StatefulWidget {
  final SearchMode mode;
  final int matchCount;
  final ValueChanged<String> onQueryChanged;
  final ValueChanged<SearchMode> onModeChanged;
  final VoidCallback onClose;

  const GraphSearchBar({
    super.key,
    required this.mode,
    required this.matchCount,
    required this.onQueryChanged,
    required this.onModeChanged,
    required this.onClose,
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
    return Container(
      width: 340,
      padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
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
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF24292E),
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: '검색어 입력...',
                    hintStyle: TextStyle(
                      color: Color(0xFF6A737D),
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
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF0366D6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              IconButton(
                onPressed: _submit,
                tooltip: '검색',
                icon: const Icon(
                  Icons.search,
                  size: 14,
                  color: Color(0xFF0366D6),
                ),
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(4),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              IconButton(
                onPressed: widget.onClose,
                icon: const Icon(
                  Icons.close,
                  size: 14,
                  color: Color(0xFF6A737D),
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
                          ? const Color(0xFF0366D6)
                          : const Color(0xFFF1F3F4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      mode.label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: active
                            ? Colors.white
                            : const Color(0xFF586069),
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
