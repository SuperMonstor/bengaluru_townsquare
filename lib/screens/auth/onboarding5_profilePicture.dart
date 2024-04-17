import 'dart:developer';

import 'package:bengaluru_townsquare/common/widgets/error_snackbar.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/fullw_white_button.dart';
import 'package:bengaluru_townsquare/screens/auth/widgets/sign_up_shell.dart';
import 'package:bengaluru_townsquare/screens/root/my_communities.dart';
import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:bengaluru_townsquare/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  Map<String, dynamic> arguments = {};
  File? _image;
  UserRepository userRepository = FirebaseUserRepository();

  Future<void> _selectImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      var croppedImage = await cropImage(imageFile: File(image!.path));
      setState(() {
        _image = croppedImage;
      });
    } on PlatformException catch (e) {
      log('Something went wrong: $e');
    }
  }

  @override
  void didChangeDependencies() {
    arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    super.didChangeDependencies();
  }

  void onTap() async {
    await _selectImage();

    arguments["profile"] = ((_image != null) ? _image?.path : "none")!;
  }

  void createUser() async {
    if (_image != null) {
      try {
        await userRepository.createUser(attributes: arguments).then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context, FeedScreen.idScreen, (route) => false);
        }).catchError((error) {
          log(error.toString());
          showErrorSnackbar(context: context, errorText: error.toString());
        });
      } catch (e) {
        log(e.toString());
      }
    } else {
      showErrorSnackbar(context: context, errorText: "Incorrect Inputs");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignUpShell(
      chatBubbleText:
          "I would say no one's gonna judge you based on how you look in this picture, but that would be a lie.",
      isButtonActive: (_image != null),
      childWidget: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Palette.boxBackground,
                      ),
                      width: 208,
                      height: 208,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: (_image?.path == null)
                            ? const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: Palette.primaryBlue,
                                    ),
                                    Text(
                                      "Add a photo",
                                      style: TextStyle(
                                        color: Palette.primaryBlue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Image.file(
                                _image!,
                                width: 208,
                                height: 208,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      buttonWidget: FullWidthWhiteButton(
        text: 'Next',
        isActive: isButtonActive,
        onPressed: createUser,
      ),
    );
  }
}
