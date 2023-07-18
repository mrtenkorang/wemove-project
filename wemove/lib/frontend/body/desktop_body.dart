import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/pages/complain/complains.dart';
import 'package:wemove/frontend/popups/authenticatons/login_popup.dart';
import 'package:wemove/frontend/widgets/big_text.dart';
import 'package:wemove/frontend/widgets/button.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

import '../../backend/models/users_model.dart';

class DesktopBody extends StatelessWidget {
  final double? width;
  const DesktopBody(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: 'Transportation\nmade easy',
                    bigTextSize: 50,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                  AppSmallText(
                    text:
                        'The leading transportation agency in Ghana.\nTravel with us to experience the world of comfort.',
                    size: 18,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
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
                        textColor: Colors.white,
                        buttonHeight: 70,
                        backgroundColor: Colors.green,
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
                                    return Complain();
                                  },
                                )
                              : Beamer.of(context).beamToNamed('/complain');
                        },
                        buttonLabelText: 'Complaint',
                        textSize: 20,
                        textColor: Colors.green,
                        buttonHeight: 70,
                        backgroundColor: Colors.white,
                        borderColor: Colors.green,
                        buttonRadius: 50,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: width,
                child: Image(
                  image: AssetImage(
                    'assets/images/bus-blue.png',
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
