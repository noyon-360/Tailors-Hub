import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // Coral (Primary)
    primaryColor: const Color(0xFFFF6F61),
    // Soft Pinkish White (Background)
    scaffoldBackgroundColor: const Color(0xFFFDF5F5),
    // Surface
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFF6F61), // Coral
      foregroundColor: Colors.white,
      elevation: 2,
    ),

    textTheme: const TextTheme(
      // Charcoal (Primary Text)
      bodyLarge: TextStyle(color: Color(0xFF333333)),
      bodyMedium: TextStyle(color: Color(0xFF757575)),
    ),

    // Secondary Text
    iconTheme: const IconThemeData(color: Color(0xFFFF6F61)),
    // Coral (Icons)
    dividerColor: const Color(0xFFE0E0E0),

    // Light Gray (Dividers)
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFFF6F61), // Coral (Primary Button)
      disabledColor: Color(0xFFBDBDBD), // Disabled Button
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF6F61),
      // Coral
      secondary: Color(0xFFA2D5C6),
      // Light Teal (Accent)
      surface: Colors.white,
      error: Color(0xFFD32F2F),
      // Error Red
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
    ),

    // TextField Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      // Background color of the TextField
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFE0E0E0), // Light Gray
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)), // Light Gray
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFFF6F61),
          width: 2,
        ), // Coral
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFD32F2F), // Error Red
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xFFD32F2F),
          width: 2,
        ), // Error Red
      ),
      labelStyle: const TextStyle(color: Color(0xFF757575)),
      // Gray
      hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
      // Light Gray
      errorStyle: const TextStyle(color: Color(0xFFD32F2F)), // Error Red
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF6F61), // Coral
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFFF6F61),
    // Coral (Primary)
    scaffoldBackgroundColor: const Color(0xFF121212),
    // Dark Background
    cardColor: const Color(0xFF1E1E1E),
    // Dark Surface
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFF6F61), // Coral
      foregroundColor: Colors.white,
      elevation: 2,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFE0E0E0)), // Light Text in Dark Mode
      bodyMedium: TextStyle(color: Color(0xFF9E9E9E)), // Secondary Text
    ),

    iconTheme: const IconThemeData(color: Colors.white),
    // White Icons
    dividerColor: const Color(0xFF757575),
    // Dark Dividers
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFFF6F61), // Coral (Primary Button)
      disabledColor: Color(0xFF757575), // Disabled Button
    ),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFFF6F61),
      // Coral
      secondary: Color(0xFFA2D5C6),
      // Light Teal (Accent)
      surface: Color(0xFF1E1E1E),
      error: Color(0xFFD32F2F),
      // Error Red
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onError: Colors.black,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
      // Dark Surface
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF757575)), // Medium Gray
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF757575)), // Medium Gray
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFFF6F61),
          width: 2,
        ), // Coral
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD32F2F)), // Error Red
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFD32F2F),
          width: 2,
        ), // Error Red
      ),
      labelStyle: const TextStyle(color: Color(0xFF9E9E9E)),
      // Light Gray
      hintStyle: const TextStyle(color: Color(0xFF757575)),
      // Medium Gray
      errorStyle: const TextStyle(color: Color(0xFFD32F2F)), // Error Red
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF6F61), // Coral
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  // Custom Colors for Specific Use Cases
  static const Color coral = Color(0xFFFF6F61); // Coral (Primary)
  static const Color softPink = Color(
    0xFFFFC0CB,
  ); // Soft Pink (Feminine Accent)
  static const Color lightTeal = Color(
    0xFFA2D5C6,
  ); // Light Teal (Secondary Accent)
  static const Color gold = Color(0xFFFFD700); // Gold (Premium Features)
  static const Color forestGreen = Color(
    0xFF228B22,
  ); // Forest Green (Eco-Friendly)
}
