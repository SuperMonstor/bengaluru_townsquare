import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/text_input.dart';
import 'package:bengaluru_townsquare/utils/validators.dart';
import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  static const String idScreen = "OtpVerification";

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  void initState() {
    super.initState();
    controller.addListener(onTextChanged);
  }

  final TextEditingController controller = TextEditingController();
  bool isActive = true;

  void onTextChanged() {
    final currentText = controller.text;
    final numericText = currentText.replaceAll(RegExp(r'[^0-9]'), '');

    String formattedText;
    if (numericText.length > 6) {
      formattedText = _formatText(numericText.substring(0, 6));
    } else if (numericText.length > 1) {
      formattedText = _formatText(numericText);
    } else {
      formattedText = numericText;
    }

    if (formattedText != currentText) {
      _updateControllerText(formattedText);
    }
  }

  String _formatText(String text) {
    const separator = ' - ';
    final chars = text.split('');
    return chars.sublist(0, chars.length - 1).join(separator) +
        separator +
        chars.last;
  }

  void _updateControllerText(String text) {
    controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SignUpShell(
        chatBubbleText:
            "An OTP was sent to your phone number. I'm sure you understand how this works by now",
        isButtonActive: true,
        childWidget: AuthTextInput(
          controller: controller,
          validator: validateOTPInput,
          textAlign: TextAlign.center,
        ),
        buttonWidget: FullWidthWhiteButton(
          text: 'Next',
          isActive: isActive,
          onPressed: () {},
        ));
  }

  @override
  void dispose() {
    controller.removeListener(onTextChanged);
    controller.dispose();
    super.dispose();
  }
}