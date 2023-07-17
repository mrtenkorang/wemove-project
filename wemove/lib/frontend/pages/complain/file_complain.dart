import 'package:flutter/material.dart';

import '../../widgets/app_button.dart';
import '../../widgets/big_text.dart';
import '../../widgets/text_form_field.dart';

class FileComplainForm extends StatelessWidget {
  final double? width;
  final bool mobile;
  const FileComplainForm(this.width, {Key? key, this.mobile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameFieldController = TextEditingController();
    final TextEditingController _telephoneFieldController =
        TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 60,
      ),
      child: SingleChildScrollView(
        child: Form(
          child: SizedBox(
            width: width,
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
                  fieldController: _nameFieldController,
                  fieldLabelText: 'Title',
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    fieldController: _telephoneFieldController,
                    fieldLabelText: 'details',
                    maxLines: 5),
                SizedBox(
                  height: 50,
                ),
                AppButton(
                  onPressed: () {},
                  buttonLabelText: 'SEND',
                  textSize: 30,
                  textColor: mobile ? Colors.white : Colors.green,
                  backgroundColor: mobile ? Colors.green : Colors.white,
                  borderColor: Colors.green,
                  buttonWidth: 300,
                  buttonHeight: 80,
                  buttonRadius: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
