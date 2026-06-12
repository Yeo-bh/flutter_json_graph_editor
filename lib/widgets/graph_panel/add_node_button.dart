import 'package:flutter/material.dart';
import '../../models/style/add_child_dialog_style.dart';
import '../../models/json_node.dart';
import '../../models/style/node_card_style.dart';
import '../../state/editor_state.dart';
import '../add_child_dialog/add_child_dialog.dart';

class AddNodeButton extends StatelessWidget {
  final JsonNode node;
  final EditorState state;
  final NodeCardStyle cardStyle;
  final AddChildDialogStyle dialogStyle;

  const AddNodeButton({
    super.key,
    required this.node,
    required this.state,
    required this.cardStyle,
    required this.dialogStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (_) => AddChildDialog(
            parentNode: node,
            state: state,
            style: dialogStyle,
          ),
        ),
        child: Container(
          width: cardStyle.addButtonSize,
          height: cardStyle.addButtonSize,
          decoration: BoxDecoration(
            color: cardStyle.addButtonBackgroundColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: cardStyle.addButtonColor,
              width: cardStyle.addButtonBorderWidth,
            ),
          ),
          child: Icon(
            Icons.add,
            size: cardStyle.addButtonIconSize,
            color: cardStyle.addButtonColor,
          ),
        ),
      ),
    );
  }
}
