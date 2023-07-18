import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/backend/database/tickets_database.dart';
import 'package:wemove/backend/models/ticket_model.dart';
import 'package:wemove/frontend/popups/old_tickets/old_ticket_card.dart';
import 'package:wemove/frontend/widgets/small_text.dart';

import '../../../backend/models/users_model.dart';

class OldTicketPopup extends StatefulWidget {
  const OldTicketPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<OldTicketPopup> createState() => _OldTicketPopupState();
}

class _OldTicketPopupState extends State<OldTicketPopup> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    return Dialog(
      child: StreamBuilder<Iterable<TicketModel>>(
        stream: TicketDB(userEmail: user!.email).tickets,
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TicketModel> ticketsList = [];
            final tickets = snapshot.data!;
            for (var ticket in tickets) {
              if (ticket.id == 'name' ||
                  ticket.passengerName == 'null' ||
                  ticket.passengerName == '') {
                continue;
              }
              ticketsList.add(ticket);
            }
            return SizedBox(
              height: 700,
              width: 500,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return OldTicketCard(
                    destination: ticketsList[index].destination,
                    name: ticketsList[index].passengerName,
                    telephone: ticketsList[index].passengerTelephone,
                    refPerName: ticketsList[index].referencePersonName,
                    refPerTel: ticketsList[index].referencePersonTelephone,
                    dDate: ticketsList[index].departureDate,
                  );
                },
                itemCount: ticketsList.length,
              ),
            );
          } else {
            return SizedBox(
              height: 700,
              width: 500,
              child: Center(
                child: Column(
                  children: [
                    AppSmallText(
                      text: 'No tickets',
                      size: 20,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
