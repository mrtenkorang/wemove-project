import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonLabelText;
  final double textSize;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color? backgroundColor;
  final Color textColor;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonRadius;
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.buttonLabelText,
    this.textSize = 15,
    this.borderColor = Colors.green,
    this.backgroundColor,
    this.textColor = Colors.black,
    this.buttonHeight = 100.0,
    this.buttonWidth = 200.0,
    this.buttonRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
            side: BorderSide(color: borderColor, width: 2.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonLabelText,
        style: TextStyle(fontSize: textSize, color: textColor),
      ),
    );
  }
}
