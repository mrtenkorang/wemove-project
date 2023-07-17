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
            bigTextSize: 30,
            textColor: Colors.green,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextButton(
                onPressed: () {},
                text: 'Tickets',
                size: 20,
                color: Colors.green,
              ),
              AppTextButton(
                onPressed: () {},
                text: 'Complain',
                size: 20,
                color: Colors.green,
              ),
              AppTextButton(
                onPressed: () {},
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
