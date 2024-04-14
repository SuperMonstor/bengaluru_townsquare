import 'package:bengaluru_townsquare/screens/auth/auth2_phone.dart';
import 'package:bengaluru_townsquare/screens/auth/auth3_otp_verification.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding1_name.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding2_username.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding3_dob.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding4_gender.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding5_profilePicture.dart';
import 'package:bengaluru_townsquare/screens/feed_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  // Intro
  EnterPhoneScreen.idScreen: (context) => const EnterPhoneScreen(),
  OtpVerification.idScreen: (context) => const OtpVerification(),

  // Onboarding
  OnboardingNameScreen.idScreen: (context) => const OnboardingNameScreen(),
  OnboardingDateOfBirthScreen.idScreen: (context) =>
      const OnboardingDateOfBirthScreen(),
  OnboardingGenderSelectScreen.idScreen: (context) =>
      const OnboardingGenderSelectScreen(),
  OnboardingProfilePictureScreen.idScreen: (context) =>
      const OnboardingProfilePictureScreen(),
  OnboardingUsernameScreen.idScreen: (context) =>
      const OnboardingUsernameScreen(),

  // Main App
  FeedScreen.idScreen: (context) => const FeedScreen(),
};
