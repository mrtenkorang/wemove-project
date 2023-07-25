import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/backend/database/complain_database.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

import '../../../backend/models/complain_model.dart';
import '../../../backend/models/users_model.dart';
import '../../widgets/loading_indicator.dart';
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
    final user = Provider.of<CustomUser?>(context);
    if (user == null) {
      return SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: AppSmallText(
            text: 'Please Login to view',
            size: 20,
          ),
        ),
      );
    }
    return Dialog(
      child: StreamBuilder<Iterable<ComplainModel>>(
          stream: ComplainDB(userEmail: user.email).complains,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the data is being fetched, show a loading indicator.
              return const SizedBox(
                height: 700,
                width: 500,
                child: Center(
                  child: LoadingIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              List<ComplainModel> complaintList = [];
              final complaints = snapshot.data!;
              for (var complaint in complaints) {
                if (complaint.complainTitle == 'null' ||
                    complaint.complainTitle == '' ||
                    complaint.complainDetail == 'null' ||
                    complaint.complainDetail == '') {
                  continue;
                }
                complaintList.add(complaint);
              }
              return SizedBox(
                height: 700,
                width: 500,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return OldComplaintCard(
                      title: complaintList[index].complainTitle,
                      detail: complaintList[index].complainDetail,
                      date: complaintList[index].date,
                    );
                  },
                  itemCount: complaintList.length,
                ),
              );
            } else {
              return const SizedBox(
                height: 700,
                width: 500,
                child: Center(
                  child: AppSmallText(
                    text: 'No Complaint',
                    size: 20,
                  ),
                ),
              );
            }
          }),
    );
  }
}
