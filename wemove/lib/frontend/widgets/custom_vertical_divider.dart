import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final double? height;
  const CustomVerticalDivider({Key? key, this.height = 700}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: VerticalDivider(
        width: 0.5, // Set the width of the vertical line
        color: Colors.black54, // Set the color of the vertical line
      ),
    );
  }
}
