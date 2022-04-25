import 'package:flutter/material.dart';

class WordlesTextButton extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback onPressed;

  const WordlesTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 300.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(text.toUpperCase()),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
