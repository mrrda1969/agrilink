import 'package:flutter/material.dart';

class AppConstants {
  static const Color primaryColor = Color.fromARGB(255, 0, 135, 20);
  static const Color secondaryColor = Color.fromARGB(255, 141, 201, 170);
  static const Color backgroundColor = Colors.white; // For light theme
  static const TextStyle headerStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  // Add more constants as needed, e.g., text styles, padding values
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light, // Explicitly set brightness
    primaryColor: AppConstants.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppConstants.primaryColor,
      secondary: AppConstants.secondaryColor,
    ),
    scaffoldBackgroundColor: AppConstants.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppConstants.backgroundColor,
      elevation: 0,
      titleTextStyle: AppConstants.headerStyle,
      iconTheme: IconThemeData(color: Colors.black87), // For icons in AppBar
      actionsIconTheme:
          IconThemeData(color: Colors.black87), // For action icons
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black87),
      headlineMedium: TextStyle(
          fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.black87),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black87),
      // Add more text styles as needed
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppConstants.primaryColor,
        side: const BorderSide(color: AppConstants.primaryColor),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppConstants.primaryColor),
      ),
      filled: true,
      fillColor: Colors.grey[200],
      labelStyle: const TextStyle(color: Colors.black87),
      hintStyle: TextStyle(color: Colors.grey[600]),
    ),
    iconTheme: const IconThemeData(color: Colors.black87), // Default icon color
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppConstants.backgroundColor,
      selectedItemColor: AppConstants.primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    // Add other theme properties like cardTheme, dialogTheme, etc.
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, // Explicitly set brightness
    primaryColor: AppConstants.primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: AppConstants.primaryColor,
      secondary: AppConstants.secondaryColor,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      titleTextStyle: AppConstants.headerStyle
          .copyWith(color: Colors.white), // Adjust text color for dark theme
      iconTheme:
          const IconThemeData(color: Colors.white), // For icons in AppBar
      actionsIconTheme:
          const IconThemeData(color: Colors.white), // For action icons
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(
          fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white),
      // Adjust other text styles for dark theme
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppConstants.primaryColor,
        side: const BorderSide(color: AppConstants.primaryColor),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[700]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[700]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppConstants.primaryColor),
      ),
      filled: true,
      fillColor: Colors.grey[800],
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: TextStyle(color: Colors.grey[400]),
    ),
    iconTheme: const IconThemeData(color: Colors.white70), // Default icon color
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      selectedItemColor: AppConstants.primaryColor,
      unselectedItemColor: Colors.grey[600],
    ),
    // Add other theme properties like cardTheme, dialogTheme, etc.
  );
}
