import 'package:flutter/material.dart';

import 'desktop_navbar.dart';
import 'mobile_navbar.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return DesktopNavBar();
      } else {
        return MobileNavBar();
      }
    });
  }
}
