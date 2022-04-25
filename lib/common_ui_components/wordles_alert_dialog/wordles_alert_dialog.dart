import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordles/common_ui_components/wordles_alert_dialog/wordles_alert_dialog_button.dart';
import 'package:wordles/values/colors.dart';

class WordlesAlertDialog extends StatelessWidget {
  final String? title;
  final String message;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final bool show;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final List<WordlesAlertDialogButton> extraButtons;

  const WordlesAlertDialog({
    Key? key,
    this.title,
    this.show = false,
    this.onPrimaryPressed,
    required this.message,
    this.primaryButtonText,
    this.onSecondaryPressed,
    this.secondaryButtonText,
    this.extraButtons = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return show
        ? kIsWeb || Platform.isAndroid
            ? _buildAndroid(context)
            : _buildiOS(context)
        : Container();
  }

  Widget _buildAndroid(BuildContext context) {
    final _textButtonsStyle = TextStyle(color: Theme.of(context).textTheme.bodyText1?.color);

    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: Text(message),
      actions: [
        primaryButtonText != null
            ? TextButton(
                onPressed: onPrimaryPressed,
                child: Text(primaryButtonText!.toUpperCase(), style: _textButtonsStyle),
              )
            : Container(),
        secondaryButtonText != null
            ? TextButton(
                onPressed: onSecondaryPressed,
                child: Text(secondaryButtonText!.toUpperCase(), style: _textButtonsStyle),
              )
            : Container(),
        ...extraButtons
            .map((e) => TextButton(
                  onPressed: e.onPressed,
                  child: Text(e.text.toUpperCase(), style: _textButtonsStyle),
                ))
            .toList(),
      ],
    );
  }

  Widget _buildiOS(BuildContext context) {
    const _textButtonsStyle = TextStyle(color: darkColor);

    return CupertinoAlertDialog(
      title: title != null ? Text(title!) : null,
      content: Text(message),
      actions: [
        primaryButtonText != null
            ? TextButton(
                onPressed: onPrimaryPressed,
                child: Text(primaryButtonText!.toUpperCase(), style: _textButtonsStyle),
              )
            : Container(),
        secondaryButtonText != null
            ? TextButton(
                onPressed: onSecondaryPressed,
                child: Text(secondaryButtonText!.toUpperCase(), style: _textButtonsStyle),
              )
            : Container(),
        ...extraButtons
            .map((e) => TextButton(
                  onPressed: e.onPressed,
                  child: Text(e.text.toUpperCase(), style: _textButtonsStyle),
                ))
            .toList(),
      ],
    );
  }
}
