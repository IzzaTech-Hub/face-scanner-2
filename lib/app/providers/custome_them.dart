import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFFFF6F91), // Updated primary color
      scaffoldBackgroundColor: const Color(0xFFFF6F91), // Background color
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFF6F91), // Updated app bar color
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)), // White icons/text
        titleTextStyle:
            TextStyle(color: Color(0xFFFFFFFF), fontSize: 20), // White text
      ),
      cardColor: const Color(0xFFFFAFC5), // Lighter shade for card color
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF212121)), // Primary text color
        bodyMedium: TextStyle(color: Color(0xFF757575)), // Secondary text color
        headlineLarge: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 32,
            fontWeight: FontWeight.bold), // White text
        headlineMedium:
            TextStyle(color: Color(0xFFFFFFFF), fontSize: 18), // White text
        headlineSmall:
            TextStyle(color: Color(0xFFFFFFFF), fontSize: 18), // White text
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFFFF8BA1), // Accent color
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFFFFFFFF), // White icons
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF8BA1), // Accent color
          foregroundColor: Color(0xFFFFFFFF), // Button text color
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFF8BA1), // Accent color
        foregroundColor: Color(0xFFFFFFFF), // Floating button text/icon color
      ),
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFFFF6F91), // Updated primary color
        secondary: const Color(0xFFFF8BA1), // Accent color
        surface: const Color(0xFFFFAFC5), // Card color
        onPrimary: Color(0xFFFFFFFF), // Text color on primary
        onSecondary: Color(0xFFFFFFFF), // Text color on secondary
        onSurface: Color(0xFF212121), // Text color on surface
        onBackground: Color(0xFF212121), // Text color on background
      ),
      dividerColor: const Color(0xFFBDBDBD), // Divider color
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFFFF6F91), // Updated prim vw3333 ary color
      scaffoldBackgroundColor: const Color(0xFFFFFFFF), // White background
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFF6F91), // Updated app bar color
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)), // White icons/text
        titleTextStyle:
            TextStyle(color: Color(0xFFFFFFFF), fontSize: 20), // White text
      ),
      cardColor: Colors.white, // Lighter shade for card color
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF212121)), // Primary text color
        bodyMedium: TextStyle(color: Color(0xFF757575)), // Secondary text color
        headlineLarge: TextStyle(
            color: Color(0xFF212121),
            fontSize: 32,
            fontWeight: FontWeight.bold), // Primary text
        headlineMedium:
            TextStyle(color: Color(0xFF212121), fontSize: 18), // Primary text
        headlineSmall:
            TextStyle(color: Color(0xFF212121), fontSize: 18), // Primary text
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFFFF8BA1), // Accent color
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF212121), // Dark text for icons
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF8BA1), // Accent color
          foregroundColor: Color(0xFFFFFFFF), // Button text color
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFF8BA1), // Accent color
        foregroundColor: Color(0xFFFFFFFF), // Floating button text/icon color
      ),
      colorScheme: ColorScheme.light(
        primary: const Color(0xFFFF6F91), // Updated primary color
        secondary: const Color(0xFFFF8BA1), // Accent color
        surface: Colors.white, // Card color
        onPrimary: Color(0xFFFFFFFF), // Text color on primary
        onSecondary: Color(0xFFFFFFFF), // Text color on secondary
        onSurface: Color(0xFF212121), // Text color on surface
        onBackground: Color(0xFF212121), // Text color on background
      ),
      dividerColor: const Color(0xFFBDBDBD), // Divider color
    );
  }
}
