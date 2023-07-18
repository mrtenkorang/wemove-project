import 'package:flutter/material.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

class SnackMessenger {
  void showCustomSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Center(
        child: AppSmallText(
          text: text,
          size: 20,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
