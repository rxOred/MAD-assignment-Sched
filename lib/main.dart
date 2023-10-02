import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';
import 'package:sched/providers/theme_provider.dart';
import 'package:sched/screens/login.dart';
import 'package:sched/screens/tasks.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final log = Logger("MainClass");

void main() async {
  Logger.root.level = Level.ALL;
  WidgetsFlutterBinding.ensureInitialized();

  // get user token from shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  log.info("user token : ", token);

  // run app
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: SchedApp(token),
  ));
}

class SchedApp extends StatelessWidget {
  final String? token;

  const SchedApp(this.token, {super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: "sched",
      theme: themeProvider.currentTheme,
      home: AuthenticationWrapper(token: token),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  final String? token;

  const AuthenticationWrapper({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    // Simulate whether the user is authenticated (has a token)
    bool isAuthenticated =
        true; // Change to false to simulate not authenticated

    // Determine which screen to show based on authentication
    final Widget initialScreen =
        isAuthenticated ? TasksScreen(token: token) : LoginScreen();

    return initialScreen;
  }
}
