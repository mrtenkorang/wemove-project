import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/popups/authenticatons/login_popup.dart';
import 'package:wemove/frontend/popups/authenticatons/register_popup.dart';
import 'package:wemove/frontend/popups/complaints/old_complaints.dart';
import 'package:wemove/frontend/popups/profile/profile.dart';

import '../../backend/models/users_model.dart';
import '../popups/old_tickets/old_ticket.dart';
import '../widgets/big_text.dart';
import '../widgets/text_button.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
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
          user != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return OldTicketPopup();
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
                            return OldComplaintPopup();
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
                            return ProfilePopup();
                          },
                        );
                      },
                      text: 'Profile',
                      size: 20,
                      color: Colors.green,
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
                            return LoginPopup(
                              mobile: true,
                            );
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
                            return RegisterPopup(
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
