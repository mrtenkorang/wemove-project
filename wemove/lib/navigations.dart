import 'package:beamer/beamer.dart';
import 'package:wemove/frontend/pages/complain/complains.dart';

import 'frontend/pages/book-ticket/book_ticket.dart';
import 'frontend/pages/home/homepage.dart';

class AppNavigation {
  final routerDelegate = BeamerDelegate(
    initialPath: '/',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const HomePage(),
        '/book-ticket': (context, state, data) => const BookTicket(),
        '/complain': (context, state, data) => const Complain(),
      },
    ),
  );
}
