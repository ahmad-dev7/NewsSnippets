import 'package:flutter/material.dart';

class MyThemeData {
  //! Dark Theme
  static final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1D1F28),
    cardColor: const Color(0xff23252F),
    primaryColor: const Color(0xffFF6861),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: const Color(0xffFF8B86),
      inversePrimary: Colors.white,
      onPrimary: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Color(0xffFF6861)),
  );

  //! Light Theme
  static final lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    listTileTheme: const ListTileThemeData().copyWith(
      textColor: Colors.black,
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    cardColor: const Color(0xFFFFFFFF),
    primaryColor: const Color(0xffFF6861),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: const Color(0xffFF8B86),
      inversePrimary: const Color(0xff23252F),
      onPrimary: const Color(0xFF1D1F28),
    ),
    iconTheme: const IconThemeData(color: Color(0xffFF6861), weight: 500),
  );
}
