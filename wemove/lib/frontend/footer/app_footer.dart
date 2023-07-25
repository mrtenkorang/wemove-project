import 'package:flutter/material.dart';
import 'package:wemove/frontend/widgets/big_text.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 110,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: const Center(
        child: Column(
          children: [
            BigText(
              text: 'Coming Soon',
              textColor: Colors.white,
              bigTextSize: 20,
            ),
            AppSmallText(
              text: '1. Rent Bus',
              color: Colors.white,
              size: 15,
            ),
            AppSmallText(
              text: '2. Testimony',
              color: Colors.white,
              size: 15,
            ),
            SizedBox(
              height: 10,
            ),
            AppSmallText(
              text: "2018 \u00a9 wemove",
              color: Colors.white,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
