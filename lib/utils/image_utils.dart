import 'dart:io';

import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File?> cropImage({required File imageFile}) async {
  CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Edit Profile Picture',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          backgroundColor: Colors.black,
          activeControlsWidgetColor: Palette.secondaryBlue,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Edit Profile Photo',
          aspectRatioLockEnabled: true,
          aspectRatioPickerButtonHidden: true,
          rectHeight: 1,
          rectWidth: 1,
        ),
      ]);
  if (croppedImage == null) return null;
  return File(croppedImage.path);
}
