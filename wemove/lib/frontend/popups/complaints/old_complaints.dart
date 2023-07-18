import 'package:flutter/material.dart';

import 'complaint_card.dart';

class OldComplaintPopup extends StatefulWidget {
  const OldComplaintPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<OldComplaintPopup> createState() => _OldComplaintPopupState();
}

class _OldComplaintPopupState extends State<OldComplaintPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 700,
        width: 500,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return OldComplaintCard();
          },
          itemCount: 6,
        ),
      ),
    );
  }
}
