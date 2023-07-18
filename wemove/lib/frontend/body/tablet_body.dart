import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/widgets/big_text.dart';

import '../../backend/models/users_model.dart';
import '../popups/authenticatons/login_popup.dart';
import '../widgets/button.dart';
import '../widgets/small_text.dart';

class TabletBody extends StatelessWidget {
  final double? width;
  const TabletBody(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BigText(
          text: 'Transportation made easy',
          bigTextSize: 50,
          textColor: Colors.black,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              onPressed: () {
                user == null
                    ? showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LoginPopup();
                        },
                      )
                    : Beamer.of(context).beamToNamed('/book-ticket');
              },
              buttonLabelText: 'Book Ticket',
              textSize: 20,
              textColor: Colors.green,
              buttonHeight: 70,
              backgroundColor: Colors.white,
              borderColor: Colors.green,
              buttonRadius: 50,
            ),
            SizedBox(
              width: 30,
            ),
            AppButton(
              onPressed: () {
                user == null
                    ? showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LoginPopup();
                        },
                      )
                    : Beamer.of(context).beamToNamed('/book-ticket');
              },
              buttonLabelText: 'Book Ticket',
              textSize: 20,
              textColor: Colors.white,
              buttonHeight: 70,
              backgroundColor: Colors.green,
              borderColor: Colors.green,
              buttonRadius: 50,
            ),
          ],
        ),
        SizedBox(
          height: 20,
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
