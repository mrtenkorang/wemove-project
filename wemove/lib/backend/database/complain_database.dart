import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wemove/backend/models/complain_model.dart';

class ComplainDB {
  String? userEmail;
  CollectionReference? complainCollection;

  ComplainDB({this.userEmail}) {
    // Initialize the complainCollection inside the constructor
    complainCollection =
        FirebaseFirestore.instance.collection('$userEmail - complains');
  }

  // Create and update complains for users
  Future<void> createComplain(
      String complainTitle, String complainDetail) async {
    if (complainCollection != null) {
      await complainCollection!.doc().set({
        'complain_title': complainTitle,
        'complain_detail': complainDetail,
      });
    }
  }

  // get complains
  Iterable<ComplainModel> _complainFromDB(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
      return ComplainModel(
        complainTitle: data['complain_title'] ?? 'title',
        complainDetail: data['complain_detail'] ?? 'details',
      );
    }).toList();
  }

  // Listen to changes in the complains document
  Stream<Iterable<ComplainModel>> get complains {
    return complainCollection!.snapshots().map(_complainFromDB);
  }
}
