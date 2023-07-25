import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wemove/backend/database/admin_db/tickets_database.dart';
import 'package:wemove/frontend/widgets/big_text.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

import '../../../../backend/models/ticket_model.dart';
import '../../../popups/old_tickets/old_ticket_card.dart';
import '../../../widgets/loading_indicator.dart';

class ScheduledTickets extends StatelessWidget {
  final double width;

  const ScheduledTickets({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
      child: SizedBox(
        height: 630,
        width: width,
        child: Column(
          children: [
            const Center(
              child: BigText(
                text: "Scheduled/Future tickets",
                bigTextSize: 20,
                fontWeight: FontWeight.w600,
                textColor: Colors.green,
              ),
            ),
            StreamBuilder<Iterable<TicketModel>>(
                stream: AdminTicketDB().adminTickets,
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
                    final adminTickets = snapshot.data!;
                    List<TicketModel> adminTicketsList = [];

                    final currentDate = DateTime.now();
                    DateTime dDate;

                    for (var adminTicket in adminTickets) {
                      if (adminTicket.destination == 'null') {
                        continue;
                      }
                      // get the date field of the ticket and convert it appropriately
                      dDate = DateFormat('yyyy-MM-dd')
                          .parse(adminTicket.departureDate);

                      // check if the date field corresponds to that of the current date
                      // then add it to the adminList
                      if (dDate.year == currentDate.year &&
                          dDate.month == currentDate.month &&
                          dDate.day <= currentDate.day) {
                        continue;
                      }
                      adminTicketsList.add(adminTicket);
                    }
                    return adminTicketsList.isEmpty
                        ? const SizedBox(
                            height: 610,
                            child: Center(
                              child: AppSmallText(
                                text: 'No Future tickets',
                                size: 20,
                                color: Colors.green,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 610,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return OldTicketCard(
                                  destination:
                                      adminTicketsList[index].destination,
                                  name: adminTicketsList[index].passengerName,
                                  telephone: adminTicketsList[index]
                                      .passengerTelephone,
                                  refPerName: adminTicketsList[index]
                                      .referencePersonName,
                                  refPerTel: adminTicketsList[index]
                                      .referencePersonTelephone,
                                  dDate: adminTicketsList[index].departureDate,
                                  dTime: adminTicketsList[index].time,
                                );
                              },
                              itemCount: adminTicketsList.length,
                            ),
                          );
                  } else {
                    return const SizedBox(
                      height: 610,
                      child: Center(
                        child: AppSmallText(
                          text: 'No Tickets',
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
