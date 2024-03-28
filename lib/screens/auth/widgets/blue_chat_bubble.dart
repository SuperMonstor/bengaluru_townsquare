import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';

class BlueChatBubble extends StatelessWidget {
  final String text;
  const BlueChatBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Palette.secondaryBlue,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ).copyWith(topLeft: Radius.zero)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
