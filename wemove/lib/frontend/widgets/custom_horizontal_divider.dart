import 'package:flutter/material.dart';

class CustomHorizontalDivider extends StatelessWidget {
  final double? width;
  const CustomHorizontalDivider({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 2,
      child: Divider(
        thickness: 1.0,
        color: Colors.black54, // Set the color of the vertical line
      ),
    );
  }
}
