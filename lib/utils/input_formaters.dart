import 'package:flutter/services.dart';

class InputFormatters {
  static final onlyUppercased = [
    UpperCaseTextFormatter(),
    FilteringTextInputFormatter.allow(RegExp("[a-zA-ZñÑ]")),
  ];

  static final onlySpanishCharacters = [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-ZñÑ]")),
  ];

  static final capitalizeFirst = [
    CapitalizeFirtsTextFormatter(),
  ];
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class CapitalizeFirtsTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.length > 1
          ? '${newValue.text[0].toUpperCase()}${newValue.text.substring(1).toLowerCase()}'
          : newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
