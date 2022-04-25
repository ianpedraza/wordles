import 'package:flutter/material.dart';
import 'package:wordles/common_ui_components/keyboard/key_model.dart';
import 'package:wordles/common_ui_components/keyboard/keyboard_key.dart';
import 'package:wordles/common_ui_components/keyboard/keyboard_model.dart';
import 'package:wordles/utils/types.dart';
import 'package:wordles/values/strings.dart';

class Keyboard extends StatelessWidget {
  final DataCallback<String>? onKeyPressed;
  final VoidCallback? onDelete;
  final VoidCallback? onEnter;
  final KeyboardModel keyboardModel;

  const Keyboard({
    Key? key,
    required this.keyboardModel,
    this.onKeyPressed,
    this.onDelete,
    this.onEnter,
  }) : super(key: key);

  // final row1 = const ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"];
  // final row2 = const ["A", "S", "D", "F", "G", "H", "J", "K", "L", "Ñ"];
  // final row3 = const [enterKey, "Z", "X", "C", "V", "B", "N", "M", deleteKey];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        constraints: const BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
        child: Column(
          children: [
            _buildRow(keyboardModel.row1),
            _buildRow(keyboardModel.row2),
            _buildRow(keyboardModel.row3),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(List<KeyModel> values) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: values
            .map((key) => KeyboardKey(
                  keyboardKey: key,
                  onKeyPressed: _onKeyPressed,
                ))
            .toList(),
      ),
    );
  }

  void _onKeyPressed(String value) {
    if (value == deleteKey && onDelete != null) {
      onDelete!();
    } else if (value == enterKey && onEnter != null) {
      onEnter!();
    } else if (onKeyPressed != null) {
      onKeyPressed!(value);
    }
  }
}
