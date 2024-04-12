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
  final String verificationId;
  const OtpVerification({super.key, required this.verificationId});

  static const String idScreen = "OtpVerification";

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  @override
  void didChangeDependencies() {
    phoneNumberController.addListener(onTextChanged);
    super.didChangeDependencies();
  }

  final TextEditingController phoneNumberController = TextEditingController();
  bool isActive = true;

  void onTextChanged() {
    final currentText = phoneNumberController.text;
    final numericPattern = RegExp(r'[^0-9]');
    final numericText = currentText.replaceAll(numericPattern, '');

    final formattedText = numericText.length > 6
        ? _formatText(numericText.substring(0, 6))
        : numericText.length > 1
            ? _formatText(numericText)
            : numericText;

    if (formattedText != currentText) {
      _updatePhoneNumberText(formattedText);
    }
  }

  void _updatePhoneNumberText(String text) {
    phoneNumberController.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  String _formatText(String text) {
    const separator = ' - ';
    final chars = text.split('');
    return chars.sublist(0, chars.length - 1).join(separator) +
        separator +
        chars.last;
  }

  void verifyOtp() async {
    log('verificationId: ${widget.verificationId}');
    await verifyOTP(
        verificationId: widget.verificationId,
        otp: phoneNumberController.text.replaceAll(' - ', ''),
        onSuccess: (UserCredential credential) {
          Navigator.pushNamedAndRemoveUntil(context,
              OnboardingNameScreen.idScreen, (Route<dynamic> route) => false);
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
          controller: phoneNumberController,
          validator: validateOTPInput,
          textAlign: TextAlign.center,
          textInputType: TextInputType.number,
        ),
        buttonWidget: FullWidthWhiteButton(
          text: 'Next',
          isActive: isActive,
          onPressed: verifyOtp,
        ));
  }

  @override
  void dispose() {
    phoneNumberController.removeListener(onTextChanged);
    phoneNumberController.dispose();
    super.dispose();
  }
}
