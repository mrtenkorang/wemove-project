import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/popups/authenticatons/register_popup.dart';
import 'package:wemove/frontend/widgets/text_button.dart';

import '../../backend/models/users_model.dart';
import '../popups/authenticatons/login_popup.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigText(
            text: 'WEMOVE',
            fontWeight: FontWeight.w900,
            bigTextSize: 50,
            textColor: Colors.green,
          ),
          user != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextButton(
                      onPressed: () {
                        //TODO: Show previous tickets popup
                      },
                      text: 'Tickets',
                      buttonColor: Colors.green,
                      size: 25,
                      color: Colors.black,
                    ),
                    AppTextButton(
                      onPressed: () {
                        Beamer.of(context).beamToNamed('/complain');
                      },
                      text: 'Complain',
                      buttonColor: Colors.green,
                      size: 25,
                      color: Colors.black,
                    ),
                    AppTextButton(
                      onPressed: () {
                        //TODO: Show profile Popup
                      },
                      text: 'Profile',
                      buttonColor: Colors.green,
                      size: 25,
                      color: Colors.black,
                    ),
                    AppTextButton(
                      onPressed: () {
                        //TODO: Show Confirm Logout Popup
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
                        //TODO: Show previous tickets popup
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LoginPopup();
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
                            return RegisterPopup();
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
