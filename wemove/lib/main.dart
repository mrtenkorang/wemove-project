import 'package:flutter/material.dart';

import 'frontend/pages/book-ticket/book_ticket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
        useMaterial3: true,
      ),
      home: BookTicket(),
    );
  }
}
