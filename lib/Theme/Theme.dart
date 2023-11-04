import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static bool isDark = true;

  static Color primaryColor = Color(0xFF5D9CEC);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFDFECDB),
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      onSecondary: Colors.black,
      onPrimary: primaryColor,
      onBackground: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 100,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
      backgroundColor: primaryColor,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 35,
      ),
      unselectedItemColor: Colors.grey.shade700,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade700,
        size: 35,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 22,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: primaryColor,
        fontSize: 18,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 15,
      ),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 12,
      ),
    ),
    cardTheme: CardTheme(
      color: primaryColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    )
  );
}