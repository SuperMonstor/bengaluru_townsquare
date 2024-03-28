import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';

class FullWidthWhiteButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;
  const FullWidthWhiteButton(
      {super.key,
      required this.text,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            foregroundColor: Palette.kBackgroundColor,
            backgroundColor: isActive ? Palette.white : Palette.offWhite,
          ),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Palette.kBackgroundColor),
          )),
    );
  }
}
