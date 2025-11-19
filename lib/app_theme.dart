import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color purple = Color(0xFF7B3FE4);
  static const Color deepPurple = Color(0xFF5A1EA6);
  static const Color lightPurple = Color(0xFFF3E9FF);
  static const Color background = Color(0xFFF8F7FB);

  static ThemeData theme() {
    return ThemeData(
      primaryColor: purple,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: deepPurple),
        titleTextStyle: GoogleFonts.poppins(color: deepPurple, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.openSans(fontSize: 16),
      bodyMedium: GoogleFonts.openSans(fontSize: 14),
    ),
      colorScheme: ColorScheme.fromSwatch().copyWith(primary: purple, secondary: deepPurple),
      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: purple,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    ),
    );
  }
}
