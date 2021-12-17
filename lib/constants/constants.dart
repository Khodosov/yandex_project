import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static const double smallRadius = 20;

  static const double bigRadius = 20;

  static const double titleFontSize = 30;

  static const double subtitleFontSize = 14;

  static final theme = ThemeData(
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(ThemeData().cardColor),
      fillColor: MaterialStateProperty.all(ThemeData().iconTheme.color),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: Colors.amber,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.black),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.latoTextTheme(
      ThemeData.dark().textTheme,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(ThemeData.dark().cardColor),
      fillColor: MaterialStateProperty.all(ThemeData.dark().iconTheme.color),
    ),
  );

  static badConnection(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.wifi_off_outlined,
                  size: 50,
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Bad connection'),
              ],
            ),
          ),
        );
      },
    );
  }
}
