import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wemove/backend/models/fullname_model.dart';
import 'package:wemove/backend/models/ticket_model.dart';

class TicketDB {
  String userEmail;
  CollectionReference? ticketCollection;

  TicketDB({required this.userEmail}) {
    // Initialize the ticketCollection inside the constructor
    ticketCollection =
        FirebaseFirestore.instance.collection('$userEmail - tickets');
  }

  // Create and update tickets for users
  Future<void> saveTicket(
    String destination,
    String passengerName,
    String passengerTelephone,
    String referencePersonName,
    String referencePersonTelephone,
    String departureDate,
  ) async {
    await ticketCollection!.doc().set({
      'destination': destination,
      'passenger_name': passengerName,
      'passenger_telephone': passengerTelephone,
      'reference_person_name': referencePersonName,
      'reference_person_telephone': referencePersonTelephone,
      'departure_date': departureDate,
    });
  }

  Future<void> saveFullName(
    String fullName,
  ) async {
    await ticketCollection!.doc('name').set({
      'fullname': fullName,
    });
  }

  FullNameModel _fullNameFromDB(DocumentSnapshot snapshot) {
    return FullNameModel(fullName: (snapshot.data() as Map?)?['fullname']);
  }

  Stream<FullNameModel>? get getFullName {
    return ticketCollection?.doc('name').snapshots().map(_fullNameFromDB);
  }

  // Get tickets from firebase db
  Iterable<TicketModel> _ticketList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data =
          doc.data() as Map<String, dynamic>; // Cast to Map<String, dynamic>
      return TicketModel(
        id: doc.id,
        passengerName: data['passenger_name'],
        passengerTelephone: data['passenger_telephone'],
        referencePersonName: data['reference_person_name'],
        referencePersonTelephone: data['reference_person_telephone'],
        destination: data['destination'],
        departureDate: data['departure_date'],
      );
    }).toList();
  }

  // Listen to changes in the tickets document
  Stream<Iterable<TicketModel>> get tickets {
    return ticketCollection!.snapshots().map(_ticketList);
  }

  // // Create an empty collection in Firestore
  // Future<void> createEmptyCollection() async {
  //   try {
  //     // Set an empty map as the document data
  //     await ticketCollection!.doc('ticket').set(<String, dynamic>{});
  //
  //     // Delete the temporary document
  //     await ticketCollection!.doc('ticket').delete();
  //
  //     print('Empty collection created successfully');
  //   } catch (e) {
  //     print('Error creating empty collection: $e');
  //   }
  // }
}
