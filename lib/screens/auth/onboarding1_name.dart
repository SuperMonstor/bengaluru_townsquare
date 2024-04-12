import 'package:bengaluru_townsquare/screens/auth/onboarding2_username.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding3_dob.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/text_input.dart';
import 'package:flutter/material.dart';

class OnboardingNameScreen extends StatefulWidget {
  const OnboardingNameScreen({super.key});
  static const String idScreen = 'OnboardingNameScreen';

  @override
  State<OnboardingNameScreen> createState() => _OnboardingNameScreenState();
}

class _OnboardingNameScreenState extends State<OnboardingNameScreen> {
  bool _active = true;
  final TextEditingController nameTextController = TextEditingController();
  Map<String, dynamic> arguments = {};

  bool validator(String value) {
    if (value.length >= 3) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignUpShell(
        chatBubbleText:
            "Great, now that it's out of the way, let's get to know each other better",
        isButtonActive: _active,
        childWidget: AuthTextInput(
            textAlign: TextAlign.center,
            controller: nameTextController,
            textInputType: TextInputType.name,
            maxLength: 32,
            hintText: 'Your Name',
            isDigitsOnly: false,
            validator: (String text) {
              return true;
            }),
        buttonWidget: FullWidthWhiteButton(
            text: "Next",
            isActive: _active,
            onPressed: () {
              arguments["name"] = nameTextController.text;
              Navigator.pushNamed(context, OnboardingUsernameScreen.idScreen,
                  arguments: arguments);
            }));
  }

  @override
  void dispose() {
    nameTextController.dispose();
    super.dispose();
  }
}
