import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/backend/authentication/user_auth.dart';
import 'package:wemove/backend/models/users_model.dart';
import 'package:wemove/navigations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBOi9B6iVBz3y0RkgSBCr4_nyR6FZTR03E",
        authDomain: "move-2faa1.firebaseapp.com",
        projectId: "move-2faa1",
        storageBucket: "move-2faa1.appspot.com",
        messagingSenderId: "769017954863",
        appId: "1:769017954863:web:ae29f8ad412d8bd1567cda"),
  );
  runApp(const WeMove());
}

class WeMove extends StatelessWidget {
  const WeMove({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme.copyWith(
          secondary: Colors.green, // Customize the secondary color
          // Add any other color customizations here
        );
    return StreamProvider<CustomUser?>.value(
      value: AuthService().authenticatedUser,
      initialData: null,
      child: MaterialApp.router(
        routerDelegate: AppNavigation().routerDelegate,
        routeInformationParser: BeamerParser(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: colorScheme,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
          //useMaterial3: true,
        ),
      ),
    );
  }
}
