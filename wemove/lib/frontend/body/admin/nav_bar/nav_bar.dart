import 'package:flutter/material.dart';
import 'package:wemove/backend/authentication/user_auth.dart';
import 'package:wemove/frontend/widgets/text_button.dart';

import '../../../widgets/big_text.dart';

class AdminNavBar extends StatefulWidget {
  const AdminNavBar({super.key});

  @override
  State<AdminNavBar> createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BigText(
            text: 'WEMOVE - ADMIN',
            fontWeight: FontWeight.w900,
            bigTextSize: 50,
            textColor: Colors.green,
          ),
          AppTextButton(
              text: 'Logout',
              size: 20,
              color: Colors.red,
              onPressed: () async {
                await AuthService().logout();
              })
        ],
      ),
    );
  }
}
