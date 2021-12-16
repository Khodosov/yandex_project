import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static const double smallRadius = 20;

  static const double bigRadius = 20;

  static const double titleFontSize = 30;

  static const double subtitleFontSize = 14;

  static final theme = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: Colors.amber,
    progressIndicatorTheme:  const ProgressIndicatorThemeData(color: Colors.black),

  );

  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
  );

}
