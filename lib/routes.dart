import 'package:bengaluru_townsquare/screens/auth/auth2_phone.dart';
import 'package:bengaluru_townsquare/screens/auth/auth3_otp_verification.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding1_name.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  EnterPhoneScreen.idScreen: (context) => const EnterPhoneScreen(),
  OtpVerification.idScreen: (context) => const OtpVerification(),
  OnboardingNameScreen.idScreen: (context) => const OnboardingNameScreen(),
};
