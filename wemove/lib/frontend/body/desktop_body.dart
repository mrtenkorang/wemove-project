import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/footer/app_footer.dart';
import 'package:wemove/frontend/popups/authenticatons/login_popup.dart';
import 'package:wemove/frontend/routes/route_constants.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(
                    text: 'Transportation\nmade easy',
                    bigTextSize: 50,
                    textColor: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                  const AppSmallText(
                    text:
                        'The leading transportation agency in Ghana.\nTravel with us to experience the world of comfort.',
                    size: 18,
                  ),
                  const SizedBox(
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
                                    return const LoginPopup();
                                  },
                                )
                              : GoRouter.of(context)
                                  .goNamed(AppRouteConstants.bookTicketName);
                        },
                        buttonLabelText: 'Book Ticket',
                        textSize: 20,
                        textColor: Colors.white,
                        buttonHeight: 70,
                        backgroundColor: Colors.green,
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
              SizedBox(
                width: width,
                child: const Image(
                  image: AssetImage(
                    'assets/images/bus-blue.png',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}
