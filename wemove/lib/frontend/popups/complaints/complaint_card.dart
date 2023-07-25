import 'package:flutter/material.dart';
import 'package:wemove/frontend/widgets/big_text.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

class OldComplaintCard extends StatelessWidget {
  final String title;
  final String detail;
  final String date;
  const OldComplaintCard({
    Key? key,
    required this.title,
    required this.detail,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: 200,
      //width: 350,
      child: Card(
        margin: const EdgeInsets.only(
          left: 50,
          right: 50,
        ),
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: title,
                bigTextSize: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              AppSmallText(
                text: detail,
                size: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              BigText(
                text: date,
                bigTextSize: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
