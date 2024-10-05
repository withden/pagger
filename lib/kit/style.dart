// ::Import 1
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pagger/library/library.dart';

class Style {
  static final _textTheme = TextTheme(
    labelSmall: GoogleFonts.dmSans(fontSize: 11).copyWith(fontWeight: FontWeight.w500),
    labelMedium: GoogleFonts.dmSans(fontSize: 13).copyWith(fontWeight: FontWeight.w500),
    labelLarge: GoogleFonts.dmSans(fontSize: 15).copyWith(fontWeight: FontWeight.w600),
    bodySmall: GoogleFonts.dmSans(fontSize: 12).copyWith(fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.dmSans(fontSize: 14).copyWith(fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.dmSans(fontSize: 16).copyWith(fontWeight: FontWeight.w500),
    titleSmall: GoogleFonts.dmSans(fontSize: 14).copyWith(fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.dmSans(fontSize: 16).copyWith(fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.dmSans(fontSize: 20).copyWith(fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.dmSans(fontSize: 24).copyWith(fontWeight: FontWeight.w500),
    headlineMedium: GoogleFonts.dmSans(fontSize: 28).copyWith(fontWeight: FontWeight.w500),
    headlineLarge: GoogleFonts.dmSans(fontSize: 32).copyWith(fontWeight: FontWeight.w500),
    displaySmall: GoogleFonts.dmSans(fontSize: 36).copyWith(fontWeight: FontWeight.w500),
    displayMedium: GoogleFonts.dmSans(fontSize: 51).copyWith(fontWeight: FontWeight.w500),
    displayLarge: GoogleFonts.dmSans(fontSize: 57).copyWith(fontWeight: FontWeight.w500),
  );

  static final ThemeData lightTheme = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6625FC)), textTheme: _textTheme);

  static final ThemeData darkTheme =
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6625FC), brightness: Brightness.dark), textTheme: _textTheme);

  static ThemeData theme() {
    return AppTheme.themeType == ThemeMode.dark ? darkTheme : lightTheme;
  }
}
