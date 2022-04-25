import 'package:flutter/material.dart';
import 'package:wordles/common_ui_components/keyboard/key_model.dart';
import 'package:wordles/styles/text_styles.dart';
import 'package:wordles/utils/icons.dart';
import 'package:wordles/utils/types.dart';
import 'package:wordles/values/colors.dart';
import 'package:wordles/model/character_status.dart';

class KeyboardKey extends StatelessWidget {
  final DataCallback<String>? onKeyPressed;
  final KeyModel keyboardKey;

  const KeyboardKey({
    Key? key,
    required this.keyboardKey,
    this.onKeyPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: keyboardKey.flex,
      child: Container(
        height: 46,
        padding: const EdgeInsets.all(2.0),
        child: RawMaterialButton(
          elevation: 0.0,
          fillColor: keyboardKey.status?.color ?? keyboardGrey,
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          onPressed: () {
            if (onKeyPressed != null) {
              onKeyPressed!(keyboardKey.value);
            }
          },
          child: keyboardKey.icon != null
              ? getIcon(keyboardKey.icon!, color: darkColor)
              : Text(
                  keyboardKey.value,
                  style: TextStyles(context).keyboardRegular16Text.apply(
                        color: keyboardKey.status?.color != null ? lightColor : darkColor,
                      ),
                ),
        ),
      ),
    );
  }
}
