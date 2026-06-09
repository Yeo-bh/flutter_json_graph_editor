import 'package:flutter/material.dart';
import '../models/split_view_style.dart';

class SplitView extends StatefulWidget {
  final Widget left;
  final Widget right;
  final double initialRatio;
  final SplitViewStyle style;

  const SplitView({
    super.key,
    required this.left,
    required this.right,
    this.initialRatio = 0.35,
    this.style = const SplitViewStyle(),
  });

  @override
  State<SplitView> createState() => SplitViewState();
}

class SplitViewState extends State<SplitView> {
  late double _ratio;
  double _savedRatio = 0.35;
  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();
    _ratio = widget.initialRatio;
    _savedRatio = widget.initialRatio;
  }

  void toggle() {
    setState(() {
      if (_isCollapsed) {
        _ratio = _savedRatio;
        _isCollapsed = false;
      } else {
        _savedRatio = _ratio;
        _ratio = 0;
        _isCollapsed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final total = constraints.maxWidth;
        final leftW = total * _ratio;
        final rightW = total - leftW - widget.style.dividerWidth;

        return Row(
          children: [
            if (!_isCollapsed) SizedBox(width: leftW, child: widget.left),
            GestureDetector(
              onHorizontalDragUpdate: _isCollapsed
                  ? null
                  : (d) {
                      setState(() {
                        _ratio = (_ratio + d.delta.dx / total).clamp(
                          widget.style.minRatio,
                          widget.style.maxRatio,
                        );
                      });
                    },
              child: MouseRegion(
                cursor: _isCollapsed
                    ? SystemMouseCursors.basic
                    : SystemMouseCursors.resizeColumn,
                child: Container(
                  width: widget.style.dividerWidth,
                  color: widget.style.dividerColor,
                ),
              ),
            ),
            SizedBox(width: rightW, child: widget.right),
          ],
        );
      },
    );
  }
}
