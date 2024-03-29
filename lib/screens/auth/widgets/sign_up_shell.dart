import 'package:bengaluru_townsquare/screens/auth/widgets/blue_chat_bubble.dart';
import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';

class SignUpShell extends StatefulWidget {
  final bool isButtonActive;
  final Widget childWidget;
  final Widget buttonWidget;
  final String chatBubbleText;
  final String? notifyText;
  const SignUpShell({
    Key? key,
    this.notifyText,
    required this.chatBubbleText,
    required this.isButtonActive,
    required this.childWidget,
    required this.buttonWidget,
  }) : super(key: key);

  @override
  SignUpShellState createState() => SignUpShellState();
}

class SignUpShellState extends State<SignUpShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      backgroundColor: darkTheme.colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 67,
            ),
            BlueChatBubble(
              text: widget.chatBubbleText,
            ),
            const SizedBox(
              height: 8,
            ),
            widget.childWidget,
            const Spacer(),
            if (widget.notifyText != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Text(
                  widget.notifyText!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Palette.gray,
                  ),
                ),
              ),
            Row(children: [widget.buttonWidget]),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
