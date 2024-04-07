import 'package:bengaluru_townsquare/screens/auth/onboarding5_profilePicture.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/auth_toggle_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:flutter/material.dart';

class OnboardingGenderSelectScreen extends StatefulWidget {
  static const String idScreen = "OnboardingGenderSelectScreen";

  const OnboardingGenderSelectScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingGenderSelectScreen> createState() =>
      _OnboardingGenderSelectScreenState();
}

class _OnboardingGenderSelectScreenState
    extends State<OnboardingGenderSelectScreen> {
  bool isActive = true;
  Map<String, dynamic> arguments = {};
  int selectedOption = 0;
  List<String> genders = ["Male", "Female", "Non-binary"];

  void changeGen(String newGen) {
    setState(() {
      selectedOption = genders.indexOf(newGen);
    });
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
          "Off. Awkward right? Now let’s get to the less controversial stuff. What do you identify as?",
      isButtonActive: isActive,
      childWidget: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: GenderSelect(
          currentGen: genders[selectedOption],
          changeGen: changeGen,
          genders: genders,
        ),
      ),
      buttonWidget: FullWidthWhiteButton(
          isActive: isActive,
          text: "Next",
          onPressed: () {
            arguments["gender"] = genders[selectedOption];
            Navigator.pushNamed(
                context, Onboarding.idScreen,
                arguments: arguments);
          }),
    );
  }
}

class GenderSelect extends StatelessWidget {
  final String currentGen;
  final void Function(String) changeGen;
  final List<String>? genders;
  const GenderSelect({
    Key? key,
    required this.genders,
    required this.currentGen,
    required this.changeGen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: genders
            ?.map(
              (e) => AuthToggleButton(
                  text: e, changeGen: changeGen, currentGen: currentGen),
            )
            .toList() as List<Widget>,
      ),
    );
  }
}
