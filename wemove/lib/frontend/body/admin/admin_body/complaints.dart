import 'package:flutter/material.dart';
import 'package:wemove/backend/database/admin_db/complaint_database.dart';
import 'package:wemove/backend/models/complain_model.dart';
import 'package:wemove/frontend/popups/complaints/complaint_card.dart';
import 'package:wemove/frontend/widgets/big_text.dart';

import '../../../widgets/loading_indicator.dart';
import '../../../widgets/small_text.dart';

class Complaints extends StatefulWidget {
  final double width;

  const Complaints({Key? key, required this.width}) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 20, bottom: 20),
      child: SizedBox(
        height: 630,
        width: widget.width,
        child: Column(
          children: [
            const Center(
              child: BigText(
                text: "Complaints",
                bigTextSize: 20,
                textColor: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            StreamBuilder<Iterable<ComplainModel>>(
              stream: AdminComplaintDB().adminComplains,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While the data is being fetched, show a loading indicator.
                  return const SizedBox(
                    height: 600,
                    child: Center(
                      child: LoadingIndicator(),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final adminComplaints = snapshot.data!;
                  List<ComplainModel> adminComplaintList = [];
                  for (var adminComplaint in adminComplaints) {
                    if (adminComplaint.complainTitle == 'null') {
                      continue;
                    }
                    adminComplaintList.add(adminComplaint);
                  }
                  return SizedBox(
                    height: 610,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return OldComplaintCard(
                          title: adminComplaintList[index].complainTitle,
                          detail: adminComplaintList[index].complainDetail,
                          date: adminComplaintList[index].date,
                        );
                      },
                      itemCount: adminComplaintList.length,
                    ),
                  );
                } else {
                  return const SizedBox(
                    height: 610,
                    child: Center(
                      child: AppSmallText(
                        text: 'No Complaints',
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
