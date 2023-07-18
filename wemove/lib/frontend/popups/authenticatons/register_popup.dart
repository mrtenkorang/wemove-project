import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../backend/authentication/user_auth.dart';
import '../../widgets/app_button.dart';
import '../../widgets/big_text.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/small_text.dart';
import '../../widgets/text_form_field.dart';
import 'login_popup.dart';

class RegisterPopup extends StatefulWidget {
  final bool mobile;
  const RegisterPopup({Key? key, this.mobile = false}) : super(key: key);

  @override
  State<RegisterPopup> createState() => _RegisterPopupState();
}

class _RegisterPopupState extends State<RegisterPopup> {
  final AuthService _auth = AuthService();
  String error = '';
  bool loading = false;
  // A variable to check if the registration process failed
  bool registerFailed = false;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _fullNameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return loading
        ? LoadingIndicator()
        : Dialog(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              height: registerFailed ? 550 : 450,
              width: widget.mobile ? 200 : 400,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: BigText(
                          text: 'Register',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: widget.mobile ? 200 : 300,
                        child: CustomTextField(
                          // check if the text field is not empty
                          validator: (val) =>
                              val!.isEmpty ? 'This field is required' : null,
                          fieldController: _fullNameController,
                          fieldLabelText: 'Enter your full name',
                        ),
                      ),
                      Container(
                        width: widget.mobile ? 200 : 300,
                        child: CustomTextField(
                          // check if the text field is not empty
                          validator: (val) =>
                              val!.isEmpty ? 'This field is required' : null,
                          fieldController: _emailController,
                          fieldLabelText: 'Enter your email',
                        ),
                      ),
                      Container(
                        width: widget.mobile ? 200 : 300,
                        child: CustomTextField(
                          obscure: true,
                          // check if the text field is not empty
                          validator: (val) =>
                              val!.isEmpty ? 'This field is required' : null,
                          fieldController: _passwordController,
                          fieldLabelText: 'Enter your password',
                        ),
                      ),
                      SizedBox(
                        height: widget.mobile ? 20 : 60,
                      ),
                      AppButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                              _emailController.text,
                              _passwordController.text,
                              _fullNameController
                                  .text, // to be accessed by the fullname db
                            );
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error =
                                    'Failed to register\nPlease check your credentials';
                                registerFailed = true;
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        borderColor: Colors.green,
                        buttonLabelText: 'REGISTER',
                        textColor: Colors.white,
                        backgroundColor: Colors.green,
                        textSize: widget.mobile ? 15 : 20,
                        buttonHeight: widget.mobile ? 60 : 80,
                        buttonRadius: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              fontSize: widget.mobile ? 15 : 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: widget.mobile ? 15 : 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return LoginPopup(
                                          mobile: true,
                                        );
                                      },
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      registerFailed
                          ? Container(
                              margin: EdgeInsets.only(top: 30),
                              height: 30,
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
