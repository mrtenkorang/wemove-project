import 'package:flutter/material.dart';

import '../widgets/big_text.dart';
import '../widgets/text_button.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        children: [
          BigText(
            text: 'WEMOVE',
            fontWeight: FontWeight.w900,
            size: 30,
            color: Colors.green,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextButton(
                text: 'Tickets',
                size: 20,
                color: Colors.green,
              ),
              AppTextButton(
                text: 'Complain',
                size: 20,
                color: Colors.green,
              ),
              AppTextButton(
                text: 'Profile',
                size: 20,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
