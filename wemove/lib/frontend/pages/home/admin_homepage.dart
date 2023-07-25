import 'package:flutter/material.dart';

import '../../body/admin/admin_body/body.dart';
import '../../body/admin/nav_bar/nav_bar.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        AdminNavBar(),
        AdminBody(),
      ],
    ));
  }
}
