import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

GButton navButton(
    {required IconData icon, required String text, bool active = true}) {
  Color leadingColor = active ? Palette.darkerGray : Palette.white;
  return GButton(
    textColor: active ? Palette.white : Palette.kErrorColor,
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        text,
        style: TextStyle(color: leadingColor),
      ),
    ),
    gap: 8,
    backgroundColor: const Color.fromARGB(255, 109, 109, 109).withOpacity(.2),
    iconSize: 24,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    margin: const EdgeInsets.all(0),
    icon: icon,
  );
}
