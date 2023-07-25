import 'package:flutter/material.dart';
import 'package:wemove/frontend/widgets/big_text.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

class OldTicketCard extends StatelessWidget {
  final String destination;
  final String name;
  final String telephone;
  final String refPerName;
  final String refPerTel;
  final String dDate;
  final String dTime;
  const OldTicketCard({
    Key? key,
    required this.destination,
    required this.name,
    required this.telephone,
    required this.refPerName,
    required this.refPerTel,
    required this.dDate,
    required this.dTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: 250,
      //width: 350,
      child: Card(
        margin: const EdgeInsets.only(
          left: 50,
          right: 50,
        ),
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, bottom: 1.0, top: 5.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                    child: BigText(
                      text: destination,
                      textColor: Colors.green,
                    ),
                  ),
                  AppSmallText(
                    text: 'Name: $name',
                    size: 15,
                  ),
                  AppSmallText(
                    text: 'Telephone: $telephone',
                    size: 15,
                  ),
                  AppSmallText(
                    text: "Ref. Person's name: ${refPerName.split(" ")[0]}",
                    size: 15,
                  ),
                  AppSmallText(
                    text: "Ref. Person's tel: $refPerTel",
                    size: 15,
                  ),
                  AppSmallText(
                    text: 'Departure date: $dDate',
                    size: 15,
                  ),
                  AppSmallText(
                    text: dTime,
                    size: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
