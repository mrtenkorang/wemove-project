import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/widgets/loading_indicator.dart';

import '../../../backend/database/complain_database.dart';
import '../../../backend/models/users_model.dart';
import '../../popups/authenticatons/login_popup.dart';
import '../../widgets/app_button.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../../widgets/text_form_field.dart';

class FileComplainForm extends StatefulWidget {
  final double? width;
  final bool mobile;
  const FileComplainForm(this.width, {Key? key, this.mobile = false})
      : super(key: key);

  @override
  State<FileComplainForm> createState() => _FileComplainFormState();
}

class _FileComplainFormState extends State<FileComplainForm> {
  bool sent = false;
  bool checkSent = false;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    if (user == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoginPopup();
        },
      );
    }
    ComplainDB complainDB = ComplainDB(userEmail: user!.email);
    TextEditingController titileController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    ();
    return loading
        ? LoadingIndicator()
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 60,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: SizedBox(
                  width: widget.width,
                  child: Column(
                    children: [
                      BigText(
                        text: 'FILE COMPLAIN',
                        bigTextSize: 50,
                        textColor: Colors.green,
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        fieldController: titileController,
                        fieldLabelText: 'Title',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        fieldController: detailController,
                        fieldLabelText: 'details',
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      AppButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            await complainDB.createComplain(
                              titileController.text,
                              detailController.text,
                            );
                            setState(
                              () {
                                loading = false;
                                checkSent = true;
                                sent = true;
                              },
                            );
                          }
                        },
                        buttonLabelText: 'SEND',
                        textSize: 30,
                        textColor: widget.mobile ? Colors.white : Colors.green,
                        backgroundColor:
                            widget.mobile ? Colors.green : Colors.white,
                        borderColor: Colors.green,
                        buttonWidth: 300,
                        buttonHeight: 80,
                        buttonRadius: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      checkSent
                          ? Container(
                              height: 70,
                              child: Center(
                                child: AppSmallText(
                                  size: 20,
                                  text: sent
                                      ? 'Congratulations! your complaint'
                                          '\nis sent successfully'
                                      : 'Failed to send complaint',
                                  color: sent ? Colors.green : Colors.red,
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
