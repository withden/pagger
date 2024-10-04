import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pagger/library/library.dart';

class Style {
  static final _textTheme = TextTheme(
    labelSmall: GoogleFonts.nunito(fontSize: 11).copyWith(fontWeight: FontWeight.w500),
    labelMedium: GoogleFonts.nunito(fontSize: 13).copyWith(fontWeight: FontWeight.w500),
    labelLarge: GoogleFonts.nunito(fontSize: 15).copyWith(fontWeight: FontWeight.w600),
    bodySmall: GoogleFonts.nunito(fontSize: 12).copyWith(fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.nunito(fontSize: 14).copyWith(fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.nunito(fontSize: 16).copyWith(fontWeight: FontWeight.w500),
    titleSmall: GoogleFonts.nunito(fontSize: 15).copyWith(fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.nunito(fontSize: 17).copyWith(fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.nunito(fontSize: 19).copyWith(fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.nunito(fontSize: 24).copyWith(fontWeight: FontWeight.w500),
    headlineMedium: GoogleFonts.nunito(fontSize: 28).copyWith(fontWeight: FontWeight.w500),
    headlineLarge: GoogleFonts.nunito(fontSize: 32).copyWith(fontWeight: FontWeight.w500),
    displaySmall: GoogleFonts.nunito(fontSize: 36).copyWith(fontWeight: FontWeight.w500),
    displayMedium: GoogleFonts.nunito(fontSize: 51).copyWith(fontWeight: FontWeight.w500),
    displayLarge: GoogleFonts.nunito(fontSize: 57).copyWith(fontWeight: FontWeight.w500),
  );

  static final ThemeData _lightTheme = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffd000ff)), textTheme: _textTheme);

  static final ThemeData _darkTheme =
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffd000ff), brightness: Brightness.dark), textTheme: _textTheme);

  static ThemeData theme() {
    return AppTheme.themeType == ThemeMode.dark ? _darkTheme : _lightTheme;
  }
}
