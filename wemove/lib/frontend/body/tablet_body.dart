import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/footer/app_footer.dart';
import 'package:wemove/frontend/widgets/big_text.dart';

import '../../backend/models/users_model.dart';
import '../popups/authenticatons/login_popup.dart';
import '../routes/route_constants.dart';
import '../widgets/button.dart';
import '../widgets/small_text.dart';

class TabletBody extends StatelessWidget {
  final double? width;
  const TabletBody(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BigText(
            text: 'Transportation made easy',
            bigTextSize: 50,
            textColor: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(
            height: 10,
          ),
          const AppSmallText(
            text:
                'The leading transportation agency in Ghana.\nTravel with us to experience the world of comfort.',
            size: 18,
          ),
          const SizedBox(
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
                            return const LoginPopup();
                          },
                        )
                      : GoRouter.of(context)
                          .goNamed(AppRouteConstants.bookTicketName);
                },
                buttonLabelText: 'Book Ticket',
                textSize: 20,
                textColor: Colors.green,
                buttonHeight: 70,
                backgroundColor: Colors.white,
                borderColor: Colors.green,
                buttonRadius: 50,
              ),
              const SizedBox(
                width: 30,
              ),
              AppButton(
                onPressed: () {
                  user == null
                      ? showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const LoginPopup();
                          },
                        )
                      : GoRouter.of(context)
                          .goNamed(AppRouteConstants.complaintName);
                },
                buttonLabelText: 'Complaint',
                textSize: 20,
                textColor: Colors.white,
                buttonHeight: 70,
                backgroundColor: Colors.green,
                borderColor: Colors.green,
                buttonRadius: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Image(
            image: AssetImage('assets/images/bus-blue.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}
