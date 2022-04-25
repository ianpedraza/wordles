import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordles/styles/text_styles.dart';
import 'package:wordles/utils/types.dart';
import 'package:wordles/values/colors.dart';

class WordlesTextField extends StatelessWidget {
  final int? maxLenght;
  final String? hint;
  final String? error;
  final String? helper;
  final bool enabled;
  final bool readOnly;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final DataCallback<String>? onChange;
  final VoidCallback? onEditingComplete;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  const WordlesTextField({
    Key? key,
    this.controller,
    this.hint,
    this.helper,
    this.error,
    this.onTap,
    this.maxLenght,
    this.onChange,
    this.focusNode,
    this.onEditingComplete,
    this.inputFormatters,
    this.readOnly = false,
    this.enabled = true,
    this.padding = const EdgeInsets.all(0.0),
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: TextField(
        enabled: enabled,
        readOnly: readOnly,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChange,
        onTap: onTap,
        maxLength: maxLenght,
        textCapitalization: textCapitalization,
        style: TextStyles(context).baseRegular16Text,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          isDense: true,
          counterText: emptyString,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          labelText: hint,
          labelStyle: TextStyles(context).baseRegular16Text,
          hintText: hint,
          hintStyle: TextStyles(context).baseRegular16Text.apply(color: wordleGrey),
          errorText: error,
          errorStyle: TextStyles(context).baseRegular14Text.apply(color: red),
          helperText: helper,
          helperMaxLines: 2,
          helperStyle: TextStyles(context).baseRegular14Text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              width: 0.6,
              color: Theme.of(context).textTheme.bodyText1?.color ?? wordleGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              width: 1.0,
              color: Theme.of(context).textTheme.bodyText1?.color ?? wordleGrey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              width: 0.6,
              color: Theme.of(context).textTheme.bodyText1?.color ?? wordleGrey,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              width: 0.6,
              color: wordleGrey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: red,
              width: 0.6,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: red,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
