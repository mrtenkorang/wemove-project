import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/popups/authenticatons/login_popup.dart';
import 'package:wemove/frontend/popups/authenticatons/register_popup.dart';
import 'package:wemove/frontend/popups/complaints/old_complaints.dart';

import '../../backend/models/users_model.dart';
import '../popups/authenticatons/logout_popup.dart';
import '../popups/old_tickets/old_ticket.dart';
import '../widgets/big_text.dart';
import '../widgets/text_button.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        children: [
          const BigText(
            text: 'WEMOVE',
            fontWeight: FontWeight.w900,
            bigTextSize: 50,
            textColor: Colors.green,
          ),
          const SizedBox(
            height: 30,
          ),
          user != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const OldTicketPopup();
                          },
                        );
                      },
                      text: 'Tickets',
                      size: 20,
                      color: Colors.green,
                    ),
                    AppTextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const OldComplaintPopup();
                          },
                        );
                      },
                      text: 'Complaints',
                      size: 20,
                      color: Colors.green,
                    ),
                    AppTextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const LogOutPopup();
                          },
                        );
                      },
                      text: 'Logout',
                      buttonColor: Colors.red,
                      size: 25,
                      color: Colors.red,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const LoginPopup();
                          },
                        );
                      },
                      text: 'Login',
                      size: 20,
                      color: Colors.green,
                    ),
                    AppTextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const RegisterPopup(
                              mobile: true,
                            );
                          },
                        );
                      },
                      text: 'Register',
                      size: 20,
                      color: Colors.green,
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
