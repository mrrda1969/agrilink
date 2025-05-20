import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  SharedPreferences? _prefs;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    _isDarkMode = _prefs?.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _prefs?.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  ThemeData get theme => _isDarkMode ? _darkTheme : _lightTheme;

  static final _lightTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 90, 147, 93),
    scaffoldBackgroundColor: const Color.fromARGB(255, 210, 230, 215),
    colorScheme: ColorScheme.light(
      primary: const Color.fromARGB(255, 90, 147, 93),
      secondary: const Color.fromARGB(255, 141, 201, 170),
    ),
  );

  static final _darkTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 90, 147, 93),
    scaffoldBackgroundColor: Colors.grey[900],
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 90, 147, 93),
      secondary: Color.fromARGB(255, 141, 201, 170),
    ),
  );
}