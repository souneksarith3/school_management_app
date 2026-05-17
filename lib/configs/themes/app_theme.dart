import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final Color appBarLightBackgroundColor = const Color(0xFFA5E8FF);
  static final Color appBarDarkBackgroundColor = const Color(0xFF23667D);

  static final Color textLightColor = const Color(0xFFEAF5FF);
  static final Color textDarkColor = const Color(0xFF282828);

  static final Color buttonLightColor = const Color(0xFF00BFFF);
  static final Color buttonDarktColor = const Color(0xFF00445B);

  static final Color scaffoldLightColor = const Color(0xFFFFFFFF);
  static final Color scaffoldDarkColor = const Color(0xFF232323);

  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: GoogleFonts.cabinTextTheme().apply(
        bodyColor: textDarkColor,
        displayColor: textDarkColor,
      ),
      scaffoldBackgroundColor: scaffoldLightColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarLightBackgroundColor,
        titleTextStyle: TextStyle(color: textDarkColor),
      ),
      buttonTheme: ButtonThemeData(buttonColor: buttonLightColor),
      inputDecorationTheme: InputDecorationThemeData(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: textDarkColor, width: 1),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: GoogleFonts.cabinTextTheme().apply(
        bodyColor: textLightColor,
        displayColor: textLightColor,
      ),
      scaffoldBackgroundColor: scaffoldDarkColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarDarkBackgroundColor,
        titleTextStyle: TextStyle(color: textLightColor),
      ),
      buttonTheme: ButtonThemeData(buttonColor: buttonDarktColor),
      inputDecorationTheme: InputDecorationThemeData(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: textLightColor, width: 1),
        ),
      ),
    );
  }
}
