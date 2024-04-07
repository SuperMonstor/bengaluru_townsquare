import 'package:bengaluru_townsquare/repositories/user_repository.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding3_dob.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/text_input.dart';
import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:bengaluru_townsquare/utils/validators.dart';
import 'package:flutter/material.dart';

class OnboardingUsernameScreen extends StatefulWidget {
  static const String idScreen = "OnboardingUsernameScreen";
  const OnboardingUsernameScreen({super.key});

  @override
  State<OnboardingUsernameScreen> createState() =>
      _OnboardingUsernameScreenState();
}

class _OnboardingUsernameScreenState extends State<OnboardingUsernameScreen> {
  final TextEditingController _controller = TextEditingController();
  bool active = false;
  final UserRepository userRepository = FirebaseUserRepository();
  Map<String, dynamic> arguments = {};
  bool showError = false;
  String error = "Pick a unique username, that one's taken";

  @override
  void didChangeDependencies() {
    arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    super.didChangeDependencies();
  }

  void onPressed() async {
    await userRepository.isUniqueUsername(_controller.text).then((value) {
      if (value) {
        arguments["username"] = _controller.text;
        Navigator.pushNamed(context, OnboardingDateOfBirthScreen.idScreen,
            arguments: arguments);
      } else {
        setState(() {
          showError = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SignUpShell(
        chatBubbleText:
            "Okay, that's quite the mouthful. Give me something that a bit.. easier to remember",
        notifyText: 'Only letters and numbers please!',
        isButtonActive: active,
        childWidget: Column(
          children: [
            AuthTextInput(
              textAlign: TextAlign.center,
              controller: _controller,
              textInputType: TextInputType.text,
              maxLength: 32,
              hintText: 'Your Username',
              validator: (value) {
                bool isValid = isUsernameValid(value);
                setState(() {
                  active = isValid;
                });
                return isValid;
              },
            ),
            if (showError)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  error,
                  style: const TextStyle(
                      color: Palette.kErrorColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
          ],
        ),
        buttonWidget: FullWidthWhiteButton(
            text: "Next", isActive: active, onPressed: onPressed));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
