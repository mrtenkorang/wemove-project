import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wemove/backend/models/bus_driver_model.dart';

class BusDriverDB {
  CollectionReference? busDriver =
      FirebaseFirestore.instance.collection('admin - bus_driver');

  // Create and update bus_driver for users
  Future<void> saveBusDriverDetails(
    String driverName,
    String assistantDriverName,
    String driverTel,
    String assistantDriverTel,
    String busPlateNumber,
    String numberOfSeats,
    String destination,
    String takeOfDate,
    String takeOfTime,
  ) async {
    if (busDriver != null) {
      await busDriver!.doc().set({
        'driver_name': driverName,
        'assistant_driver_name': assistantDriverName,
        'driver_tel': driverTel,
        'assistant_driver_tel': assistantDriverTel,
        'bus_plate_number': busPlateNumber,
        'number_of_seats': numberOfSeats,
        'destination': destination,
        'take_of_date': takeOfDate,
        'take_of_time': takeOfTime,
      });
    }
  }

  // get bus_driver from firebase firestore
  Iterable<BusDriverModel> _busDriverFromBD(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
      return BusDriverModel(
        driverName: data['driver_name'] ?? '',
        assistantDriverName: data['assistant_driver_name'] ?? '',
        driverTel: data['driver_tel'] ?? '',
        assistantDriverTel: data['assistant_driver_tel'] ?? '',
        busPlateNumber: data['bus_plate_number'] ?? '',
        numberOfSeats: data['number_of_seats'] ?? '',
        destination: data['destination'] ?? '',
        takeOfDate: data['take_of_date'] ?? '',
        takeOfTime: data['take_of_time'] ?? '',
      );
    }).toList();
  }

  // Listen to changes in the complains document
  Stream<Iterable<BusDriverModel>> get busDriverDetails {
    return busDriver!.snapshots().map(_busDriverFromBD);
  }
}
