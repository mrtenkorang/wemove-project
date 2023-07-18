import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wemove/frontend/widgets/big_text.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

class OldComplaintCard extends StatelessWidget {
  const OldComplaintCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 200,
      //width: 350,
      child: Card(
        margin: EdgeInsets.only(
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
                text: 'Bad driving',
                bigTextSize: 15,
              ),
              SizedBox(
                height: 10,
              ),
              AppSmallText(
                text:
                    'dif dhusfdyudsf dsfuudf dshfudhf ufdiushfudshf dsfhudshfdshf dufhdsfidsahfodsf dsihdf d8hidhfdufydif dfy8dfi dyfidhf dyfdsjdvv9dif hfdi ',
                size: 15,
              ),
              SizedBox(
                height: 10,
              ),
              BigText(
                text: DateFormat('yyy-MM-dd').format(
                  DateTime.now(),
                ),
                bigTextSize: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
