import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  // Define the default brightness and colors.
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    // ···
    brightness: Brightness.light,
  ),

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.

  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    // ···
    titleLarge: GoogleFonts.poppins(
      fontSize: 30,
    ),
    bodyMedium: GoogleFonts.poppins(),
    displaySmall: GoogleFonts.poppins(),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  // Define the default brightness and colors.
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    // ···
    brightness: Brightness.dark,
  ),

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    // ···
    titleLarge: GoogleFonts.poppins(
      fontSize: 30,
    ),
    bodyMedium: GoogleFonts.poppins(),
    displaySmall: GoogleFonts.poppins(),
  ),
);

enum ThemeMode { Light, Dark }

class ThemeProvider with ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.Light;

  ThemeMode get currentThemeMode => _currentThemeMode;

  ThemeData get currentTheme =>
      _currentThemeMode == ThemeMode.Light ? lightTheme : darkTheme;

  void toggleTheme() {
    _currentThemeMode =
        _currentThemeMode == ThemeMode.Light ? ThemeMode.Dark : ThemeMode.Light;
    notifyListeners();
  }
}
