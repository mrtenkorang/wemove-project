import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wemove/backend/database/admin_db/complaint_database.dart';
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
          return const LoginPopup();
        },
      );
    }
    ComplainDB complainDB = ComplainDB(userEmail: user!.email);
    AdminComplaintDB adminComplaintDB = AdminComplaintDB();
    TextEditingController titleController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    ();
    return loading
        ? const LoadingIndicator()
        : Padding(
            padding: const EdgeInsets.symmetric(
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
                      const BigText(
                        text: 'FILE COMPLAINT',
                        bigTextSize: 50,
                        textColor: Colors.green,
                        fontWeight: FontWeight.w800,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        fieldController: titleController,
                        fieldLabelText: 'Title',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        fieldController: detailController,
                        fieldLabelText: 'details',
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AppButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });

                            await complainDB.createComplain(
                              titleController.text,
                              detailController.text,
                              // the date is added automatically, and it is set to the
                              // recent date
                              DateFormat('yyyy-MM-dd').format(
                                DateTime.now(),
                              ),
                            );
                            await adminComplaintDB.createAdminComplain(
                              titleController.text,
                              detailController.text,
                              DateFormat('yyyy-MM-dd').format(
                                DateTime.now(),
                              ),
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
                      const SizedBox(
                        height: 20,
                      ),
                      checkSent
                          ? SizedBox(
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
