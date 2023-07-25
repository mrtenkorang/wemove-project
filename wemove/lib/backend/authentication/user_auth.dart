import 'package:firebase_auth/firebase_auth.dart';
import 'package:wemove/backend/database/admin_db/bus_driver.dart';
import 'package:wemove/backend/database/admin_db/complaint_database.dart';
import 'package:wemove/backend/database/admin_db/tickets_database.dart';

import '../database/complain_database.dart';
import '../database/tickets_database.dart';
import '../models/users_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Convert a user from Firebase to a custom user
  CustomUser? _convertUser(User? user) {
    if (user != null) {
      return CustomUser(uid: user.uid, email: user.email!);
    }
    return null;
  }

  //Listening for auth changes, i.e checking if a user is logged in or out
  Stream<CustomUser?> get authenticatedUser {
    return _auth.authStateChanges().map(_convertUser);
  }

  // Register  user with email and password
  Future<CustomUser?> userRegisterWithEmailAndPassword(
      String email, String password, String fullName) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // create collections for the just registered user with their email as the collection name
      // and set dummy data for their first document created, which will be deleted later
      await TicketDB(userEmail: email)
          .saveTicket('null', 'null', 'null', 'null', 'null', 'null', 'null');
      await TicketDB(userEmail: email).saveFullName(fullName);
      await ComplainDB(userEmail: email).createComplain('null', 'null', 'null');
      // Convert the user to the custom user, accessing only the uid and email and return it
      return _convertUser(user.user);
    } catch (e) {
      // TODO: Display a container with a formatted error message
      return null;
    }
  }

  Future<CustomUser?> adminRegisterWithEmailAndPassword(
      String? email, String? password, String? fullName) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      await AdminTicketDB().saveTicketForAdmin(
          'null', 'null', 'null', 'null', 'null', 'null', 'null');
      await AdminComplaintDB().createAdminComplain('null', 'null', 'null');
      await BusDriverDB().saveBusDriverDetails(
        'null',
        'null',
        'null',
        'null',
        'null',
        'null',
        'null',
        'null',
        'null',
      );
      // Convert the user to the custom user, accessing only the uid and email and return it
      return _convertUser(user.user);
    } catch (e) {
      // TODO: Display a container with a formatted error message
      return null;
    }
  }

  // Login with email and password
  Future<CustomUser?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Convert the user to the custom user, accessing only the uid and email and return it
      return _convertUser(user.user);
    } catch (e) {
      // TODO: Display a container with a formatted error message
      return null;
    }
  }

  //Logout
  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
