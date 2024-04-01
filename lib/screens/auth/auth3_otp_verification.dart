import 'dart:developer';

import 'package:bengaluru_townsquare/common/widgets/error_snackbar.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding1_name.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/text_input.dart';
import 'package:bengaluru_townsquare/services/otp_service.dart';
import 'package:bengaluru_townsquare/utils/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
  }

  final TextEditingController controller = TextEditingController();
  Map<String, dynamic> arguments = {};
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

  void verifyOtp() async {
    log('Verification Id: ${arguments['verificationId']}');
    await sendOTP(
        phone: arguments['phoneNumber'],
        otp: controller.text.replaceAll(' - ', ''),
        onSuccess: (UserCredential credential) {
          Navigator.pushNamedAndRemoveUntil(
              context,
              OnboardingNameScreen.idScreen,
              ModalRoute.withName('/OnboardingNameScreen'));
        },
        onFailure: (Exception e) {
          showErrorSnackbar(context: context, errorText: e.toString());
        });
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
          onPressed: verifyOtp,
        ));
  }

  @override
  void dispose() {
    controller.removeListener(onTextChanged);
    controller.dispose();
    super.dispose();
  }
}
