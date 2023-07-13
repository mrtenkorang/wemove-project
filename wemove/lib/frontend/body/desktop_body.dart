import 'package:flutter/material.dart';
import 'package:wemove/frontend/widgets/big_text.dart';
import 'package:wemove/frontend/widgets/button.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

class DesktopBody extends StatelessWidget {
  final double? width;
  const DesktopBody(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    size: 50,
                    color: Colors.black,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: AppButton(
                      onPressed: () {
                        //TODO: Take you to book ticket page
                      },
                      buttonLabelText: 'Book Ticket',
                      textSize: 20,
                      textColor: Colors.white,
                      buttonHeight: 70,
                      backgroundColor: Colors.green,
                      borderColor: Colors.green,
                      buttonRadius: 50,
                    ),
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
