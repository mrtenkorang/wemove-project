import 'package:flutter/material.dart';
import 'package:wemove/frontend/pages/complain/file_complain.dart';

class Complain extends StatelessWidget {
  const Complain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200 ||
              (constraints.maxWidth > 800 && constraints.maxWidth < 1200)) {
            return FileComplainForm(
              constraints.biggest.width,
            );
          } else {
            return FileComplainForm(
              mobile: true,
              constraints.biggest.width,
            );
          }
        },
      ),
    );
  }
}
