import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wemove/frontend/popups/authenticatons/register_popup.dart';

import '../../../backend/authentication/user_auth.dart';
import '../../widgets/app_button.dart';
import '../../widgets/big_text.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/small_text.dart';
import '../../widgets/text_form_field.dart';

class LoginPopup extends StatefulWidget {
  const LoginPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  final AuthService _auth = AuthService();
  String error = '';
  bool loading = false;
  bool loginFailed = false;
  dynamic result;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController passwordLoginController = TextEditingController();
    TextEditingController emailLoginController = TextEditingController();
    return loading
        ? const LoadingIndicator()
        : Dialog(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              height: loginFailed ? 500 : 400,
              width: 400,
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const BigText(
                        text: 'Login',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomTextField(
                          icon: Icons.email_rounded,
                          iconColor: Colors.green,
                          // check if the text field is not empty
                          validator: (val) =>
                              val!.isEmpty ? 'This field is required' : null,
                          fieldController: emailLoginController,
                          fieldLabelText: 'Enter your email',
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomTextField(
                          icon: Icons.password_rounded,
                          iconColor: Colors.green,
                          obscure: true,
                          // check if the text field is not empty
                          validator: (val) =>
                              val!.isEmpty ? 'This field is required' : null,
                          fieldController: passwordLoginController,
                          fieldLabelText: 'Enter your password',
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      AppButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            if (emailLoginController.text ==
                                'wemove@gmail.com') {
                              result = await _auth.loginWithEmailAndPassword(
                                  emailLoginController.text,
                                  passwordLoginController.text);
                            } else {
                              result = await _auth.loginWithEmailAndPassword(
                                  emailLoginController.text,
                                  passwordLoginController.text);
                            }

                            if (result == null) {
                              setState(() {
                                error =
                                    'Failed to login\nPlease check your credentials';
                                loginFailed = true;
                                loading = false;
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        borderColor: Colors.green,
                        buttonLabelText: 'LOGIN',
                        textSize: 20,
                        buttonHeight: 80,
                        buttonRadius: 50,
                        textColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Need an account?',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Register',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const RegisterPopup(
                                        mobile: true,
                                      );
                                    },
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      loginFailed
                          ? Container(
                              margin: const EdgeInsets.only(top: 30),
                              height: 60,
                              child: Center(
                                child: AppSmallText(
                                  text: error,
                                  size: 15,
                                  color: Colors.red,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
