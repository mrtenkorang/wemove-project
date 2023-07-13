import 'package:flutter/material.dart';
import 'package:wemove/frontend/widgets/text_button.dart';

import '../widgets/big_text.dart';

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigText(
            text: 'WEMOVE',
            fontWeight: FontWeight.w900,
            size: 50,
            color: Colors.green,
          ),
          Row(
            children: [
              AppTextButton(
                text: 'Tickets',
                size: 25,
                color: Colors.black,
              ),
              AppTextButton(
                text: 'Complain',
                size: 25,
                color: Colors.black,
              ),
              AppTextButton(
                text: 'Profile',
                size: 25,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
