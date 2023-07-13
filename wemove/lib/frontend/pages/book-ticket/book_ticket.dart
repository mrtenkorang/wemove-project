import 'package:flutter/material.dart';

import 'desktop_book_page.dart';
import 'mobile_book_page.dart';

class BookTicket extends StatelessWidget {
  const BookTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopBookPage(constraints.biggest.width / 2);
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return DesktopBookPage(constraints
            .biggest.width); // uses the same nav bar with the desktopview
      } else {
        return MobileBookPage(constraints.biggest.width);
      }
    });
  }
}
