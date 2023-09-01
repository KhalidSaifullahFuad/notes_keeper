import 'package:flutter/material.dart';

class LinkTextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final void Function()? onPressed;

  const LinkTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
