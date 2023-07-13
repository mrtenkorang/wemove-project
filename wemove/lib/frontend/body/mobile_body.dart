import 'package:flutter/material.dart';
import 'package:wemove/frontend/widgets/big_text.dart';

import '../widgets/button.dart';
import '../widgets/small_text.dart';

class MobileBody extends StatelessWidget {
  final double? width;
  const MobileBody(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigText(
          text: 'Transportation\nmade easy',
          size: 50,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: 10,
        ),
        AppSmallText(
          text:
              'The leading transportation agency in Ghana.\nTravel with us to experience the world of comfort.',
          size: 18,
        ),
        SizedBox(
          height: 20,
        ),
        AppButton(
          onPressed: () {},
          buttonLabelText: 'Book Ticket',
          textSize: 20,
          textColor: Colors.white,
          buttonHeight: 70,
          backgroundColor: Colors.green,
          borderColor: Colors.green,
          buttonRadius: 50,
        ),
        SizedBox(
          height: 10,
        ),
        Image(
          image: AssetImage('assets/images/bus-blue.png'),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
