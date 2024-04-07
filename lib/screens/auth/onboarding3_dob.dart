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
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic> arguments = {};

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
            "I hope it's not impolite to ask you for your date of birth.",
        notifyText: "You gotta be over 18 to use this app btw",
        isButtonActive: _active,
        childWidget: AuthTextInput(
          textAlign: TextAlign.center,
          controller: _controller,
          textInputType: TextInputType.number,
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
              arguments["dob"] = _controller.text;
              Navigator.pushNamed(context, OnboardingDateOfBirthScreen.idScreen,
                  arguments: arguments);
            }));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
