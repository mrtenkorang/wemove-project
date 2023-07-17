import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      // width: 100,
      child: Center(
        child: SpinKitWanderingCubes(
          color: Colors.green,
          size: 50,
        ),
      ),
    );
  }
}
