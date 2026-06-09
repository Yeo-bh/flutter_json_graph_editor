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
  State<SplitView> createState() => _SplitViewState();
}

class _SplitViewState extends State<SplitView> {
  late double _ratio;

  @override
  void initState() {
    super.initState();
    _ratio = widget.initialRatio;
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
            SizedBox(width: leftW, child: widget.left),
            GestureDetector(
              onHorizontalDragUpdate: (d) {
                setState(() {
                  _ratio = (_ratio + d.delta.dx / total).clamp(
                    widget.style.minRatio,
                    widget.style.maxRatio,
                  );
                });
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeColumn,
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
