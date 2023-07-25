import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wemove/backend/models/ticket_model.dart';

class AdminTicketDB {
  CollectionReference? adminTicketCollection =
      FirebaseFirestore.instance.collection('admin - tickets');

  // Create and update tickets for users
  Future<void> saveTicketForAdmin(
    String destination,
    String passengerName,
    String passengerTelephone,
    String referencePersonName,
    String referencePersonTelephone,
    String departureDate,
    String time,
  ) async {
    await adminTicketCollection!.doc().set({
      'destination': destination,
      'passenger_name': passengerName,
      'passenger_telephone': passengerTelephone,
      'reference_person_name': referencePersonName,
      'reference_person_telephone': referencePersonTelephone,
      'departure_date': departureDate,
      'time': time,
    });
  }

  // Get tickets from firebase db
  Iterable<TicketModel> _ticketListForAdmin(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data =
          doc.data() as Map<String, dynamic>; // Cast to Map<String, dynamic>
      return TicketModel(
        id: doc.id,
        passengerName: data['passenger_name'] ?? '',
        passengerTelephone: data['passenger_telephone'] ?? '',
        referencePersonName: data['reference_person_name'] ?? '',
        referencePersonTelephone: data['reference_person_telephone'] ?? '',
        destination: data['destination'] ?? '',
        departureDate: data['departure_date'] ?? '',
        time: data['time'] ?? '',
      );
    }).toList();
  }

  // Listen to changes in the tickets document
  Stream<Iterable<TicketModel>> get adminTickets {
    return adminTicketCollection!.snapshots().map(_ticketListForAdmin);
  }
}
