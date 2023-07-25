import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wemove/backend/database/admin_db/bus_driver.dart';
import 'package:wemove/frontend/widgets/loading_indicator.dart';

import '../../../widgets/app_button.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';
import '../../../widgets/text_form_field.dart';

class BusDriverDetails extends StatefulWidget {
  final double width;
  const BusDriverDetails({Key? key, required this.width}) : super(key: key);

  @override
  State<BusDriverDetails> createState() => _BusDriverDetailsState();
}

class _BusDriverDetailsState extends State<BusDriverDetails> {
  TextEditingController driverName = TextEditingController();
  TextEditingController assistantDriverName = TextEditingController();
  TextEditingController driverTel = TextEditingController();
  TextEditingController assistantDriverTel = TextEditingController();
  TextEditingController busPlateNumber = TextEditingController();
  TextEditingController numberOfSeats = TextEditingController();
  TextEditingController destination = TextEditingController();
  TextEditingController takeOfDate = TextEditingController();
  String takeOfTime = 'select';
  DateTime? date;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  BusDriverDB busDriverDB = BusDriverDB();
  void pickDate(context) async {
    date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        width: widget.width,
        height: 630,
        child: Column(
          children: [
            const Center(
              child: BigText(
                text: "Bus and Driver details",
                bigTextSize: 20,
                textColor: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            loading
                ? const LoadingIndicator()
                : SizedBox(
                    height: 600,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              icon: Icons.person,
                              iconColor: Colors.green,
                              fieldController: driverName,
                              fieldLabelText: "Driver's Name*",
                              validator: (val) => val!.isEmpty
                                  ? 'This field is required'
                                  : null,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              icon: Icons.person,
                              iconColor: Colors.green,
                              fieldController: assistantDriverName,
                              fieldLabelText: "Assistant Driver's Name*",
                              validator: (val) => val!.isEmpty
                                  ? 'This field is required'
                                  : null,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              icon: Icons.phone,
                              iconColor: Colors.green,
                              fieldController: driverTel,
                              fieldLabelText: "Driver's Telephone*",
                              validator: (val) => val!.isEmpty
                                  ? 'This field is required'
                                  : null,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              icon: Icons.phone,
                              iconColor: Colors.green,
                              fieldController: assistantDriverTel,
                              fieldLabelText: "Assistant Driver's Telephone*",
                              validator: (val) => val!.isEmpty
                                  ? 'This field is required'
                                  : null,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              icon: Icons.directions_bus_filled,
                              iconColor: Colors.green,
                              fieldController: busPlateNumber,
                              fieldLabelText: "Bus Plate Number*",
                              validator: (val) => val!.isEmpty
                                  ? 'This field is required'
                                  : null,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              icon: Icons.airline_seat_recline_normal_rounded,
                              iconColor: Colors.green,
                              fieldController: numberOfSeats,
                              fieldLabelText: "Number of seats",
                              validator: (val) => val!.isEmpty
                                  ? 'This field is required'
                                  : null,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              icon: Icons.place_rounded,
                              iconColor: Colors.green,
                              fieldController: destination,
                              fieldLabelText: "Bus Destination",
                              validator: (val) => val!.isEmpty
                                  ? 'This field is required'
                                  : null,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              icon: Icons.calendar_today_rounded,
                              iconColor: Colors.green,
                              fieldController: takeOfDate,
                              fieldLabelText: "Departure Date",
                              hintText: 'yyyy-mm-dd',
                              validator: (val) => val!.isEmpty
                                  ? 'This field is required'
                                  : null,
                              onTap: () async {
                                pickDate(context);
                                if (date != null) {
                                  setState(() {
                                    takeOfDate.text =
                                        DateFormat('yyyy-MM-dd').format(date!);
                                  });
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 400,
                              child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.access_time,
                                    color: Colors.green,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ), // Set the desired active color
                                  ),
                                  labelText: 'Departure time',
                                  labelStyle: TextStyle(color: Colors.green),
                                ),
                                value: takeOfTime,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'select',
                                    child: AppSmallText(
                                      text: 'select time',
                                      color: Colors.green,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '6am',
                                    child: AppSmallText(
                                      text: '6 am',
                                      color: Colors.green,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '9am',
                                    child: AppSmallText(
                                      text: '9 am',
                                      color: Colors.green,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '12pm',
                                    child: AppSmallText(
                                      text: '12 pm',
                                      color: Colors.green,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '3pm',
                                    child: AppSmallText(
                                      text: '3 pm',
                                      color: Colors.green,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '6pm',
                                    child: AppSmallText(
                                      text: '6 pm',
                                      color: Colors.green,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '9pm',
                                    child: AppSmallText(
                                      text: '9 pm',
                                      color: Colors.green,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '12am',
                                    child: AppSmallText(
                                      text: '12 am',
                                      color: Colors.green,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '3am',
                                    child: AppSmallText(
                                      text: '3 am',
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    takeOfTime = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  await busDriverDB.saveBusDriverDetails(
                                    driverName.text,
                                    assistantDriverName.text,
                                    driverTel.text,
                                    assistantDriverTel.text,
                                    busPlateNumber.text,
                                    numberOfSeats.text,
                                    destination.text,
                                    takeOfDate.text,
                                    takeOfTime,
                                  );
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              },
                              buttonLabelText: 'SEND',
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
          ],
        ),
      ),
    );
  }
}
