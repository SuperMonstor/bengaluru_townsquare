import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';

void showErrorSnackbar(
    {required BuildContext context, required String errorText}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorText,
        style: const TextStyle(color: Palette.offWhite),
      ),
      backgroundColor: Palette.kErrorColor,
    ),
  );
}