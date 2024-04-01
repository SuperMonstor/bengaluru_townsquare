import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/text_input.dart';
import 'package:flutter/material.dart';

class OnboardingUsernameScreen extends StatefulWidget {
  const OnboardingUsernameScreen({super.key});
  static const String idScreen = 'OnboardingUsernameScreen';

  @override
  State<OnboardingUsernameScreen> createState() => _OnboardingUsernameScreenState();
}

class _OnboardingUsernameScreenState extends State<OnboardingUsernameScreen> {
  bool _active = false;
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic> arguments = {};

  bool validator(String value) {
    if (value.length >= 3) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void didChangeDependencies() {
    arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SignUpShell(
        chatBubbleText:
            "Great, now that it's out of the way, let's get to know each other better",
        isButtonActive: _active,
        childWidget: AuthTextInput(
          textAlign: TextAlign.center,
          controller: _controller,
          textInputType: TextInputType.text,
          maxLength: 32,
          hintText: 'Your Name',
          validator: (value) {
            setState(() {
              _active = validator(value);
            });
            return _active;
          },
        ),
        buttonWidget: FullWidthWhiteButton(
            text: "Next",
            isActive: _active,
            onPressed: () {
              arguments["name"] = _controller.text;
              Navigator.pushNamed(context, OnboardingUsernameScreen.idScreen,
                  arguments: arguments);
            }));
  }
}
