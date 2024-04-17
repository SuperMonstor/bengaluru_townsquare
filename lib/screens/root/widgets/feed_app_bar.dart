import 'dart:ui';

import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';

class FeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedAppBar({super.key});
  static const toolbarHeight = kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Palette.backgroundColor.withOpacity(0.9),
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.transparent),
        ),
      ),
      title: SizedBox(
        height: 18,
        child: Image.asset(
          'assets/images/Townsquare_appbar.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);
}
