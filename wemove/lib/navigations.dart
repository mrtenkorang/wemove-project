import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wemove/frontend/pages/home/homepage.dart';

class Navigation {
  GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: HomePage(),
          );
        },
      ),
    ],
  );
}
