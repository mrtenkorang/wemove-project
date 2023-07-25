import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove/frontend/pages/home/admin_homepage.dart';
import 'package:wemove/frontend/pages/home/homepage.dart';

import '../../../backend/models/users_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    if (user == null) {
      return const HomePage();
    }
    if (user.email == 'wemove@gmail.com') {
      return const AdminHomePage();
    } else {
      return const HomePage();
    }
  }
}
