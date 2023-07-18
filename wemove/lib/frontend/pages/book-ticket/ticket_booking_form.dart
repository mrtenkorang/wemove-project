import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/widgets/app_button.dart';
import 'package:wemove/frontend/widgets/loading_indicator.dart';
import 'package:wemove/frontend/widgets/text_form_field.dart';

import '../../../backend/database/tickets_database.dart';
import '../../../backend/models/users_model.dart';
import '../../widgets/big_text.dart';
import '../../widgets/snackbar.dart';

class TicketBookingForm extends StatefulWidget {
  final double width;
  const TicketBookingForm(
    this.width, {
    Key? key,
  }) : super(key: key);

  @override
  State<TicketBookingForm> createState() => _TicketBookingFormState();
}

class _TicketBookingFormState extends State<TicketBookingForm> {
  late bool loading = false;
  bool check = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameFieldController = TextEditingController();
  final TextEditingController telephoneFieldController =
      TextEditingController();
  final TextEditingController referencePersonNameFieldController =
      TextEditingController();
  final TextEditingController referencePersonTelephoneFieldController =
      TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController departureDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    TicketDB ticketDB = TicketDB(userEmail: user!.email);

    return loading
        ? LoadingIndicator()
        : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: SizedBox(
                  width: widget.width,
                  child: Column(
                    children: [
                      const BigText(
                        text: 'BOOK TICKET',
                        bigTextSize: 50,
                        textColor: Colors.green,
                        fontWeight: FontWeight.w800,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        icon: Icons.perm_identity_rounded,
                        iconColor: Colors.green,
                        fieldController: nameFieldController,
                        fieldLabelText: 'Name',
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        icon: Icons.phone_android_rounded,
                        iconColor: Colors.green,
                        fieldController: telephoneFieldController,
                        fieldLabelText: 'Telephone',
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        icon: Icons.perm_identity_rounded,
                        iconColor: Colors.green,
                        fieldController: referencePersonNameFieldController,
                        fieldLabelText: "Reference person's name",
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        icon: Icons.phone_android_rounded,
                        iconColor: Colors.green,
                        fieldController:
                            referencePersonTelephoneFieldController,
                        fieldLabelText: "Reference person's telephone",
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        icon: Icons.place_rounded,
                        iconColor: Colors.green,
                        fieldController: destinationController,
                        fieldLabelText: "Destination",
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        icon: Icons.calendar_today_rounded,
                        iconColor: Colors.green,
                        fieldController: departureDateController,
                        fieldLabelText: "Departure Date",
                        validator: (val) =>
                            val!.isEmpty ? 'This field is required' : null,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2090),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              departureDateController.text =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      AppButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            await ticketDB.saveTicket(
                              destinationController.text,
                              nameFieldController.text,
                              telephoneFieldController.text,
                              referencePersonNameFieldController.text,
                              referencePersonTelephoneFieldController.text,
                              departureDateController.text,
                            );
                            setState(() {
                              loading = false;
                            });
                            SnackMessenger().showCustomSnackBar(context,
                                'Booked successfully, check your email for your ticket.');
                          }
                        },
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
