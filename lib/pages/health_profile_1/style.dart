// Base
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Internal Shared Library
import 'package:pagger/library/library.dart';

class Style {
  static final _textTheme = TextTheme(
    labelSmall: GoogleFonts.montserrat(fontSize: 10).copyWith(fontWeight: FontWeight.w500),
    labelMedium: GoogleFonts.montserrat(fontSize: 12).copyWith(fontWeight: FontWeight.w500),
    labelLarge: GoogleFonts.montserrat(fontSize: 14).copyWith(fontWeight: FontWeight.w600),
    bodySmall: GoogleFonts.montserrat(fontSize: 11).copyWith(fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.montserrat(fontSize: 13).copyWith(fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.montserrat(fontSize: 15).copyWith(fontWeight: FontWeight.w500),
    titleSmall: GoogleFonts.montserrat(fontSize: 13).copyWith(fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.montserrat(fontSize: 15).copyWith(fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.montserrat(fontSize: 18).copyWith(fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.montserrat(fontSize: 24).copyWith(fontWeight: FontWeight.w500),
    headlineMedium: GoogleFonts.montserrat(fontSize: 28).copyWith(fontWeight: FontWeight.w500),
    headlineLarge: GoogleFonts.montserrat(fontSize: 32).copyWith(fontWeight: FontWeight.w500),
    displaySmall: GoogleFonts.montserrat(fontSize: 36).copyWith(fontWeight: FontWeight.w500),
    displayMedium: GoogleFonts.montserrat(fontSize: 51).copyWith(fontWeight: FontWeight.w500),
    displayLarge: GoogleFonts.montserrat(fontSize: 57).copyWith(fontWeight: FontWeight.w500),
  );

  static final ThemeData _lightTheme = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff8ecae6)), textTheme: _textTheme);

  static final ThemeData _darkTheme =
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff8ecae6), brightness: Brightness.dark), textTheme: _textTheme);

  static ThemeData theme() {
    return AppTheme.themeType == ThemeMode.dark ? _darkTheme : _lightTheme;
  }
}
