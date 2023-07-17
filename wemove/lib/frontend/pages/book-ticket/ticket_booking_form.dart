import 'package:flutter/material.dart';
import 'package:wemove/frontend/widgets/app_button.dart';
import 'package:wemove/frontend/widgets/text_form_field.dart';

import '../../widgets/big_text.dart';

class TicketBookingForm extends StatelessWidget {
  final double width;
  const TicketBookingForm(
    this.width, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameFieldController = TextEditingController();
    final TextEditingController _telephoneFieldController =
        TextEditingController();
    final TextEditingController _referencePersonNameFieldController =
        TextEditingController();
    final TextEditingController _referencePersonTelephoneFieldController =
        TextEditingController();
    final TextEditingController _destinationController =
        TextEditingController();
    final TextEditingController _departureDateController =
        TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: SingleChildScrollView(
        child: Form(
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                BigText(
                  text: 'BOOK TICKET',
                  bigTextSize: 50,
                  textColor: Colors.green,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  fieldController: _nameFieldController,
                  fieldLabelText: 'Name',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  fieldController: _telephoneFieldController,
                  fieldLabelText: 'Telephone',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  fieldController: _referencePersonNameFieldController,
                  fieldLabelText: "Reference person's name",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  fieldController: _referencePersonTelephoneFieldController,
                  fieldLabelText: "Reference person's telephone",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  fieldController: _destinationController,
                  fieldLabelText: "Destination",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  fieldController: _departureDateController,
                  fieldLabelText: "Departure Date",
                ),
                SizedBox(
                  height: 40,
                ),
                AppButton(
                  onPressed: () {},
                  buttonLabelText: 'BOOK',
                  textSize: 30,
                  textColor: Colors.green,
                  backgroundColor: Colors.white,
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
