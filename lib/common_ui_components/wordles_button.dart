import 'package:flutter/material.dart';

class WordlesButton extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback? onPressed;

  const WordlesButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(text.toUpperCase()),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
