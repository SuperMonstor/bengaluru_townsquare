import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextInput extends StatefulWidget {
  final TextEditingController controller;
  final bool Function(String) validator;
  final bool isDigitsOnly;
  final String? hintText;
  final String? prefixText;
  final TextAlign textAlign;
  final int? maxLength;
  final TextInputType? textInputType;

  const AuthTextInput({
    Key? key,
    required this.controller,
    required this.validator,
    this.hintText,
    this.prefixText,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.textInputType = TextInputType.phone,
    this.isDigitsOnly = true,
  }) : super(key: key);

  @override
  AuthTextInputState createState() => AuthTextInputState();
}

class AuthTextInputState extends State<AuthTextInput> {
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: widget.controller,
      textAlign: widget.textAlign,
      style: const TextStyle(
        color: Palette.offWhite,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Palette.darkGray,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        prefixText: "${widget.prefixText} ",
        prefixStyle: const TextStyle(
          color: Palette.darkGray,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        suffixIcon: widget.controller.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  widget.controller.clear();
                },
                icon: const Icon(Icons.clear))
            : null,
        filled: true,
        fillColor: Palette.offBlack,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: widget.controller.text.isEmpty
                ? Palette.darkGray
                : isValid
                    ? Palette.nonErrorColor
                    : Palette.kErrorColor,
            width: 1.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: Palette.offWhite,
          ),
        ),
      ),
      keyboardType: widget.textInputType,
      inputFormatters:
          widget.isDigitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
      maxLength: widget.maxLength,
      onChanged: (value) {
        setState(() {
          widget.controller.text = value;
        });
        setState(() {
          isValid = widget.validator(widget.controller.text);
        });
      },
    );
  }
}