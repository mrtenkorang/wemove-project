import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? buttonColor;
  final double? size;
  final VoidCallback? onPressed;
  const AppTextButton(
      {Key? key,
      required this.text,
      this.color,
      this.size,
      required this.onPressed,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: buttonColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: size),
      ),
    );
  }
}
