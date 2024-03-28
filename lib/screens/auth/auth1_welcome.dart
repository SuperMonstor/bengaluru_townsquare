import 'package:bengaluru_townsquare/screens/auth/widgets/blue_chat_bubble.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const String idScreen = "AuthScreen";
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Palette.kBackgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Text(
                    "Welcome to",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(
                    height: 44,
                    child: Image.asset('assets/images/Townsquare.png',
                        fit: BoxFit.cover),
                  ),
                ],
              ),
              const BlueChatBubble(
                  text: 'Find and discover new communities in your city!'),
              Column(
                children: [
                  const Text(
                    "Our closed beta is currently invite only",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff868686),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        FullWidthWhiteButton(
                          text: 'Get Started',
                          isActive: true,
                          onPressed: () =>
                              Navigator.pushNamed(context, "EnterPhone"),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
