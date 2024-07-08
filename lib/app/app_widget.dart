import 'package:flutter/material.dart';
import 'package:your_tracker/app/pages/search_packages.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  GlobalKey<ScaffoldMessengerState> scaffoldState = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldState,
      debugShowCheckedModeBanner: false,
      title: 'Your Tracker',
      home: const SearchPackgesPage(),
    );
  }
}
