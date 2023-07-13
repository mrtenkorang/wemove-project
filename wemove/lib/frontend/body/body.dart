import 'package:flutter/material.dart';
import 'package:wemove/frontend/body/tablet_body.dart';

import 'desktop_body.dart';
import 'mobile_body.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopBody(constraints.biggest.width / 2);
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return TabletBody(constraints
            .biggest.width); // uses the same nav bar with the desktopview
      } else {
        return MobileBody(constraints.biggest.width);
      }
    });
  }
}
