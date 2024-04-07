import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';

class AuthToggleButton extends StatelessWidget {
  final String text;
  final void Function(String) changeGen;
  final String currentGen;
  const AuthToggleButton(
      {Key? key,
        required this.text,
        required this.currentGen,
        required this.changeGen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeGen(text);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: (currentGen == text) ? Colors.white : const Color(0xff0d0d0d) ,
            border: (currentGen == text)
                ? Border.all(color: const Color(0xffffffff), width: 1)
                : Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight:
                  (currentGen == text) ? FontWeight.w700 : FontWeight.w600,
                  color: (currentGen == text)
                      ? Colors.black
                      : Palette.offWhite),
            ),
          ),
        ),
      ),
    );
  }
}
