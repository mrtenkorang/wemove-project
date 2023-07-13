import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';

class DesktopBookPage extends StatelessWidget {
  final double? width;
  const DesktopBookPage(
    this.width, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 80),
      child: Form(
        child: Column(
          children: [
            Container(
              child: BigText(
                text: 'BOOK TICKET',
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
