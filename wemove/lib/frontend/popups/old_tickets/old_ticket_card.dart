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
  const OldTicketCard(
      {Key? key,
      required this.destination,
      required this.name,
      required this.telephone,
      required this.refPerName,
      required this.refPerTel,
      required this.dDate})
      : super(key: key);

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
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30,
              child: Center(child: BigText(text: destination)),
            ),
            AppSmallText(
              text: 'Name:     $name',
              size: 20,
            ),
            AppSmallText(
              text: 'Telephone:     $telephone',
              size: 20,
            ),
            AppSmallText(
              text: "Ref. Person's name:     $refPerName",
              size: 20,
            ),
            AppSmallText(
              text: "Ref. Person's tel:     $refPerTel",
              size: 20,
            ),
            AppSmallText(
              text: 'Departure date:     $dDate',
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
