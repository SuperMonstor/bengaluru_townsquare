import 'package:flutter/material.dart';

class Palette {
  static const Color kBackgroundColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color white = Colors.white;
  static const Color offWhite = Colors.white70;
  static const Color offBlack = Color(0xff1f1f1f);
  static const Color lightGray = Color(0xff969696);
  static const Color gray = Color(0xff8f8f8f);
  static const Color primaryBlue = Color(0xff2d3bbd);
  static const Color secondaryBlue = Color(0xff1881fe);
  static const Color darkGray = Color(0xff686867);
  static const Color kErrorColor = Color(0xffef6363);
  static const nonErrorColor = Colors.green;
}

final ThemeData darkTheme = ThemeData(
    fontFamily: "Lexend",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      labelSmall: TextStyle(
          color: Palette.offWhite, fontSize: 16, fontWeight: FontWeight.w500),
    ),
    scaffoldBackgroundColor: Palette.kBackgroundColor,
    colorScheme: const ColorScheme.dark(background: Palette.kBackgroundColor));
