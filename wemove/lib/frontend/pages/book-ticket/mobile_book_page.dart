import 'package:flutter/material.dart';

class MobileBookPage extends StatelessWidget {
  final double? width;
  const MobileBookPage(
    this.width, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      child: Form(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
