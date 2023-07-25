import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wemove/backend/models/complain_model.dart';

class AdminComplaintDB {
  CollectionReference? adminComplainCollection =
      FirebaseFirestore.instance.collection('admin - complaints');

  // Create and update complains for users
  Future<void> createAdminComplain(
      String complainTitle, String complainDetail, String complainDate) async {
    if (adminComplainCollection != null) {
      await adminComplainCollection!.doc().set({
        'complain_date': complainDate,
        'complain_title': complainTitle,
        'complain_detail': complainDetail,
      });
    }
  }

  // get complains from firebase firestore
  Iterable<ComplainModel> _adminComplainFromDB(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
      return ComplainModel(
        date: data['complain_date'] ?? 'date',
        complainTitle: data['complain_title'] ?? 'title',
        complainDetail: data['complain_detail'] ?? 'details',
      );
    }).toList();
  }

  // Listen to changes in the complains document
  Stream<Iterable<ComplainModel>> get adminComplains {
    return adminComplainCollection!.snapshots().map(_adminComplainFromDB);
  }
}
