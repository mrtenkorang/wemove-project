import 'package:flutter/material.dart';
import 'package:wemove/frontend/body/body.dart';
import 'package:wemove/frontend/navbar/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //todo: use the wrapper widget to return the home screen
          child: Column(
            children: [
              NavBar(),
              AppBody(),
            ],
          ),
        ),
      ),
    );
  }
}
