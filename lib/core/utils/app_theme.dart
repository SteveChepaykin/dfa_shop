import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Color(0xFFE50D32);
  static Color grey = Color(0xFF1F2029);
  static Color darkGrey = Color(0xFF808080);
  static Color lightGrey = Color(0xFFBEBFC8);
  static Color bg = Color(0xFFF2F3F8);
  static Color darkText = Color(0xFFE0E0E0);

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: bg,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: grey,
        elevation: 0,
        titleTextStyle: s16w500.copyWith(color: grey),
        leadingWidth: 40,
      ),
      bottomAppBarTheme: BottomAppBarThemeData(
        color: Colors.white,
        height: 80,
        elevation: 1,
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: Colors.white,
        secondary: Colors.white,
        onSecondary: grey,
        error: Colors.red,
        onError: Colors.white,
        surface: bg,
        onSurface: grey,
      ),
      fontFamily: 'Stolzl',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xFF121212),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: darkText,
        elevation: 0,
        titleTextStyle: s16w500.copyWith(color: darkText),
        leadingWidth: 40,
      ),
      bottomAppBarTheme: BottomAppBarThemeData(
        color: Color(0xFF1F1F1F),
        height: 80,
        elevation: 1,
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: primary,
        onPrimary: Colors.white,
        secondary: darkGrey,
        onSecondary: darkText,
        error: Colors.red,
        onError: Colors.white,
        surface: Color(0xFF121212),
        onSurface: darkText,
      ),
      fontFamily: 'Stolzl',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static TextStyle s12w400 = TextStyle(fontFamily: 'Stolzl', fontSize: 12, fontWeight: FontWeight.w400, height: 1.4);

  static TextStyle s10w400 = TextStyle(fontFamily: 'Stolzl', fontSize: 10, fontWeight: FontWeight.w400, height: 1.4);

  static TextStyle s16w500 = TextStyle(fontFamily: 'Stolzl', fontSize: 16, fontWeight: FontWeight.w500, height: 1.25);
}
