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
  dynamic result;
  // A variable to check if the registration process failed
  bool registerFailed = false;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return loading
        ? const LoadingIndicator()
        : Dialog(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: registerFailed ? 550 : 450,
              width: 400,
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const BigText(
                        text: 'Register',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomTextField(
                          icon: Icons.person,
                          iconColor: Colors.green,
                          // check if the text field is not empty
                          validator: (val) =>
                              val!.isEmpty ? 'This field is required' : null,
                          fieldController: fullNameController,
                          fieldLabelText: 'Enter your full name',
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomTextField(
                          icon: Icons.email_rounded,
                          iconColor: Colors.green,
                          // check if the text field is not empty
                          validator: (val) =>
                              val!.isEmpty ? 'This field is required' : null,
                          fieldController: emailController,
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
                          fieldController: passwordController,
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
                            if (emailController.text == 'wemove@gmail.com') {
                              result =
                                  await _auth.adminRegisterWithEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                                fullNameController.text,
                              );
                            } else {
                              result =
                                  await _auth.userRegisterWithEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                                fullNameController
                                    .text, // to be accessed by the fullname db
                              );
                            }

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
                        textSize: 20,
                        buttonHeight: 80,
                        buttonRadius: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account?',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login',
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
                                      return const LoginPopup();
                                    },
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      registerFailed
                          ? Container(
                              margin: const EdgeInsets.only(top: 30),
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
