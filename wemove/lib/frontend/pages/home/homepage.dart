import 'package:flutter/material.dart';
import 'package:wemove/frontend/body/body.dart';
import 'package:wemove/frontend/navbar/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            AppBody(),
          ],
        ),
      ),
    );
  }
}
