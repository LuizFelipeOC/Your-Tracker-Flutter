import 'package:flutter/material.dart';
import 'package:your_tracker/app/pages/search_packages.dart';
import 'package:your_tracker/app/shared/app_light_theme.dart';
import 'package:your_tracker/app/shared/providers.dart';

GlobalKey<ScaffoldMessengerState> scaffoldState = GlobalKey<ScaffoldMessengerState>();

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppLightTheme.theme,
      scaffoldMessengerKey: scaffoldState,
      debugShowCheckedModeBanner: false,
      title: 'Your Tracker',
      home: const SearchPackgesPage(),
    );
  }
}
