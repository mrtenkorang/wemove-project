import 'package:flutter/material.dart';

class ProfilePopup extends StatefulWidget {
  const ProfilePopup({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePopup> createState() => _ProfilePopupState();
}

class _ProfilePopupState extends State<ProfilePopup> {
  late int firstItem;
  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: SizedBox(
        height: 700,
        width: 500,
      ),
    );
  }
}
