import 'package:flutter/material.dart';
import 'package:wemove/frontend/widgets/app_button.dart';
import 'package:wemove/frontend/widgets/loading_indicator.dart';

import '../../../backend/authentication/user_auth.dart';

class LogOutPopup extends StatefulWidget {
  const LogOutPopup({Key? key}) : super(key: key);

  @override
  State<LogOutPopup> createState() => _LogOutPopupState();
}

class _LogOutPopupState extends State<LogOutPopup> {
  AuthService _auth = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingIndicator()
        : Dialog(
            child: Container(
              height: 100,
              width: 100,
              child: Center(
                child: AppButton(
                  onPressed: () async {
                    await _auth.logout();
                    loading = true;
                    Navigator.pop(context);
                  },
                  borderColor: Colors.red,
                  textColor: Colors.white,
                  backgroundColor: Colors.red,
                  buttonLabelText: 'Confirm Logout',
                  textSize: 20,
                  buttonHeight: 60,
                  buttonRadius: 50,
                ),
              ),
            ),
          );
  }
}
