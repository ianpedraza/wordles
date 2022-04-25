import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WordlesModal {
  static Future<T?> showModal<T>({
    required BuildContext context,
    required Widget child,
  }) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        constraints: const BoxConstraints(
          maxWidth: kIsWeb ? 380.0 : 480.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 32.0,
              ),
              child: child,
            ));
  }
}
