import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight? fontWeight;
  final double? textHeight;
  const BigText(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      this.fontWeight,
      this.textHeight = 1.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
