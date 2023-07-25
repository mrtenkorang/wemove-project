import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/popups/authenticatons/logout_popup.dart';
import 'package:wemove/frontend/popups/authenticatons/register_popup.dart';
import 'package:wemove/frontend/popups/complaints/old_complaints.dart';
import 'package:wemove/frontend/widgets/text_button.dart';

import '../../backend/models/users_model.dart';
import '../popups/authenticatons/login_popup.dart';
import '../popups/old_tickets/old_ticket.dart';
import '../widgets/big_text.dart';

class DesktopNavBar extends StatefulWidget {
  const DesktopNavBar({super.key});

  @override
  State<DesktopNavBar> createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BigText(
            text: 'WEMOVE',
            fontWeight: FontWeight.w900,
            bigTextSize: 40,
            textColor: Colors.green,
          ),
          user != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextButton(
                      onPressed: () {
                        //TODO: Show previous tickets popup
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const OldTicketPopup();
                          },
                        );
                      },
                      text: 'Tickets',
                      buttonColor: Colors.green,
                      size: 25,
                      color: Colors.black,
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
                      buttonColor: Colors.green,
                      size: 25,
                      color: Colors.black,
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
                      buttonColor: Colors.green,
                      size: 25,
                      color: Colors.black,
                    ),
                    AppTextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const RegisterPopup();
                          },
                        );
                      },
                      text: 'Register',
                      buttonColor: Colors.green,
                      size: 25,
                      color: Colors.black,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
