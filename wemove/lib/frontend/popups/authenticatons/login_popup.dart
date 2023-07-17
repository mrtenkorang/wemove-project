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
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController _passwordLoginController = TextEditingController();
    TextEditingController _emailLoginController = TextEditingController();
    return loading
        ? LoadingIndicator()
        : Dialog(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              height: loginFailed ? 500 : 400,
              width: 400,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: BigText(
                          text: 'Login',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        child: CustomTextField(
                          // check if the text field is not empty
                          validator: (val) =>
                              val!.isEmpty ? 'This field is required' : null,
                          fieldController: _emailLoginController,
                          fieldLabelText: 'Enter your email',
                        ),
                      ),
                      Container(
                        width: 300,
                        child: CustomTextField(
                          obscure: true,
                          // check if the text field is not empty
                          validator: (val) =>
                              val!.isEmpty ? 'This field is required' : null,
                          fieldController: _passwordLoginController,
                          fieldLabelText: 'Enter your password',
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      AppButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _auth.loginWithEmailAndPassword(
                                    _emailLoginController.text,
                                    _passwordLoginController.text);
                            if (result == null) {
                              setState(() {
                                error =
                                    'Failed to login\nPlease check your credentials';
                                loginFailed = true;
                                loading = false;
                              });
                              print(result);
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: 'Need an account?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Register',
                                style: TextStyle(
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
                                        return RegisterPopup();
                                      },
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      loginFailed
                          ? Container(
                              margin: EdgeInsets.only(top: 30),
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
