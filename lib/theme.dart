import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define custom colors
  static const Color gunmetalGrey = Color(0xFF2A3439);
  static const Color foundryCrimson = Color(0xFF8C0B1B);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: gunmetalGrey,
        primary: gunmetalGrey,
        onPrimary: Colors.white,
        secondary: foundryCrimson,
        onSecondary: Colors.white,
        surface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: gunmetalGrey,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: foundryCrimson,
        foregroundColor: Colors.white,
      ),
      // Apply Google Fonts based on typography specifications
      textTheme: TextTheme(
        // Titles/Headlines (Alfa Slab One)
        displayLarge: GoogleFonts.alfaSlabOne(color: gunmetalGrey),
        displayMedium: GoogleFonts.alfaSlabOne(color: gunmetalGrey),
        displaySmall: GoogleFonts.alfaSlabOne(color: gunmetalGrey),
        headlineLarge: GoogleFonts.alfaSlabOne(color: gunmetalGrey),
        headlineMedium: GoogleFonts.alfaSlabOne(color: gunmetalGrey),
        headlineSmall: GoogleFonts.alfaSlabOne(color: gunmetalGrey),
        titleLarge: GoogleFonts.alfaSlabOne(),
        titleMedium: GoogleFonts.alfaSlabOne(),
        titleSmall: GoogleFonts.alfaSlabOne(),
        
        // Data Elements / Labels (Space Mono)
        labelLarge: GoogleFonts.spaceMono(fontWeight: FontWeight.bold),
        labelMedium: GoogleFonts.spaceMono(fontWeight: FontWeight.bold),
        labelSmall: GoogleFonts.spaceMono(fontWeight: FontWeight.bold),
        
        // All other text (Roboto Slab)
        bodyLarge: GoogleFonts.robotoSlab(),
        bodyMedium: GoogleFonts.robotoSlab(),
        bodySmall: GoogleFonts.robotoSlab(),
      ),
    );
  }
}
