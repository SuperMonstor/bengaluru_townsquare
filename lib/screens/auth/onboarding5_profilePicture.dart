import 'package:bengaluru_townsquare/common/widgets/error_snackbar.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'dart:io';
import '../../repositories/user_repository.dart';

class OnboardingProfilePictureScreen extends StatefulWidget {
  static const String idScreen = "OnboardingProfilePictureScreen";

  const OnboardingProfilePictureScreen({super.key});

  @override
  State<OnboardingProfilePictureScreen> createState() =>
      _OnboardingProfilePictureScreenState();
}

class _OnboardingProfilePictureScreenState
    extends State<OnboardingProfilePictureScreen> {
  bool isButtonActive = true;
  bool isLoading = false;
  Map<String, dynamic> arguments = {};
  File? _image;
  UserRepository userRepository = FirebaseUserRepository();

  void move(bool state) {
    setState(() {
      isButtonActive = state;
    });
  }

  Future<void> _selectImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
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
    return Placeholder();
  }
}
