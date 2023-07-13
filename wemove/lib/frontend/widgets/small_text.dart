import 'package:flutter/material.dart';

class AppSmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;
  const AppSmallText({
    Key? key,
    required this.text,
    required this.size,
    this.color,
    this.fontWeight = FontWeight.w300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
    );
  }
}
