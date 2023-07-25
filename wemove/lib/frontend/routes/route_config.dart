import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wemove/frontend/pages/book-ticket/book_ticket.dart';
import 'package:wemove/frontend/pages/complain/complains.dart';
import 'package:wemove/frontend/pages/home/wrapper.dart';
import 'package:wemove/frontend/routes/route_constants.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: AppRouteConstants.homeName,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: Wrapper(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: AppRouteConstants.bookTicketName,
            path: AppRouteConstants.bookTicketName,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: BookTicket(),
              );
            },
          ),
          GoRoute(
            name: AppRouteConstants.complaintName,
            path: AppRouteConstants.complaintName,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: Complain(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
