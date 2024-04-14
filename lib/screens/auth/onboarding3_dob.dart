import 'package:bengaluru_townsquare/screens/auth/onboarding4_gender.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/text_input.dart';
import 'package:bengaluru_townsquare/utils/validators.dart';
import 'package:flutter/material.dart';

class OnboardingDateOfBirthScreen extends StatefulWidget {
  const OnboardingDateOfBirthScreen({super.key});
  static const String idScreen = 'OnboardingDateOfBirthScreen';

  @override
  State<OnboardingDateOfBirthScreen> createState() =>
      _OnboardingDateOfBirthScreenState();
}

class _OnboardingDateOfBirthScreenState
    extends State<OnboardingDateOfBirthScreen> {
  bool _active = false;
  bool showError = false;
  final TextEditingController dateTextController = TextEditingController();
  Map<String, dynamic> arguments = {};

  @override
  void didChangeDependencies() {
    arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    dateTextController.addListener(onDobChanged);
    super.didChangeDependencies();
  }

  void onDobChanged() {
    var text = dateTextController.text;

    if (text.length == 2 && text[1] != '/') {
      dateTextController.text = "${text.substring(0, 2)}/";
    } else if (text.length == 5 && text[3] != '/') {
      dateTextController.text = "${text.substring(0, 5)}/";
    } else if (text.length > 10) {
      dateTextController.text = text.substring(0, 10);
    } else if (text == "/") {
      dateTextController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignUpShell(
        chatBubbleText:
            "I hope it's not impolite to ask you for your date of birth.",
        notifyText: "You gotta be over 18 to use this app btw",
        isButtonActive: _active,
        childWidget: AuthTextInput(
          textAlign: TextAlign.center,
          controller: dateTextController,
          textInputType: TextInputType.datetime,
          hintText: 'DD/MM/YYYY',
          validator: (value) {
            setState(() {
              _active = isDateOfBirthValid(value);
            });

            return _active;
          },
        ),
        buttonWidget: FullWidthWhiteButton(
            text: "Next",
            isActive: _active,
            onPressed: () {
              arguments["dob"] = dateTextController.text;
              Navigator.pushNamed(
                  context, OnboardingGenderSelectScreen.idScreen,
                  arguments: arguments);
            }));
  }

  @override
  void dispose() {
    dateTextController.dispose();
    super.dispose();
  }
}
