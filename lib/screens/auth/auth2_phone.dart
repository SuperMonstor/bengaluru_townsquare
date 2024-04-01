import 'package:bengaluru_townsquare/common/widgets/error_snackbar.dart';
import 'package:bengaluru_townsquare/screens/auth/auth3_otp_verification.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/text_input.dart';
import 'package:bengaluru_townsquare/services/otp_service.dart';
import 'package:bengaluru_townsquare/utils/validators.dart';
import 'package:flutter/material.dart';

class EnterPhoneScreen extends StatefulWidget {
  static const String idScreen = "EnterPhone";

  const EnterPhoneScreen({super.key});

  @override
  State<EnterPhoneScreen> createState() => EnterPhoneScreenState();
}

class EnterPhoneScreenState extends State<EnterPhoneScreen> {
  void onPressed() async {
    String phoneNumber = "+91 ${_controller.text}";
    await sendOTP(
      phone: phoneNumber,
      onFailure: (exception) {
        showErrorSnackbar(
          errorText: exception.toString(),
          context: context,
        );
      },
    );
  }

  bool isButtonActive = true;
  bool isValid = false;
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SignUpShell(
        childWidget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: AuthTextInput(
                controller: _controller,
                validator: validateNumber,
                hintText: "Your Number",
                prefixText: "+91",
                maxLength: 10,
              ),
            )
          ],
        ),
        chatBubbleText:
            "👋 Hello again. I'm gonna need your phone number to let you in.",
        isButtonActive: true,
        buttonWidget: FullWidthWhiteButton(
            text: "Send OTP", isActive: isButtonActive, onPressed: onPressed));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
