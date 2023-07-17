import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final double bigTextSize;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlign textAlign;
  const BigText({
    Key? key,
    required this.text,
    this.bigTextSize = 30.0,
    this.fontWeight = FontWeight.w700,
    this.textColor = Colors.black,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: bigTextSize,
        fontWeight: fontWeight,
        fontFamily: 'Poppins',
        color: textColor,
        height: 1,
      ),
    );
  }
}
