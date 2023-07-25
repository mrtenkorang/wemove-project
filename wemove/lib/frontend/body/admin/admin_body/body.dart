import 'package:flutter/material.dart';
import 'package:wemove/frontend/body/admin/admin_body/scheduled_tickets.dart';
import 'package:wemove/frontend/widgets/custom_vertical_divider.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

import 'bus_driver_details.dart';
import 'complaints.dart';
import 'today_ticket.dart';

class AdminBody extends StatelessWidget {
  const AdminBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return Row(
          children: [
            TodayTickets(
              width: constraints.biggest.width / 4,
            ),
            const CustomVerticalDivider(),
            ScheduledTickets(width: constraints.biggest.width / 4),
            const CustomVerticalDivider(),
            Complaints(width: constraints.biggest.width / 4),
            const CustomVerticalDivider(),
            BusDriverDetails(width: constraints.biggest.width / 5),
          ],
        );
      } else {
        return const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 200),
            child: AppSmallText(
              text:
                  'The admin page is only available on screens bigger than or equal to 1200',
              size: 20,
              color: Colors.red,
            ),
          ),
        );
      }
    });
  }
}
