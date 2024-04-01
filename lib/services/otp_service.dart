import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendOTP({
  required String phone,
  String? otp,
  Function(Exception exception)? onFailure,
  Function(UserCredential credential)? onSuccess,
}) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phone,
    verificationCompleted: (PhoneAuthCredential credential) async {
      try {
        await FirebaseAuth.instance.signInWithCredential(credential);
        // Handle successful sign-in
      } catch (e) {
        if (onFailure != null) {
          onFailure(e as Exception);
          log(e.toString());
          rethrow;
        }
      }
    },
    verificationFailed: (FirebaseAuthException e) {
      if (onFailure != null) {
        onFailure(e);
      }
      throw e;
    },
    codeSent: (String verId, int? resendToken) {
      verifyOTP(
          verificationId: verId,
          otp: otp!,
          onFailure: onFailure,
          onSuccess: onSuccess);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

Future<void> verifyOTP(
    {required String verificationId,
    required String otp,
    Function(UserCredential credential)? onSuccess,
    Function(Exception exception)? onFailure}) async {
  try {
    var credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    var userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (onSuccess != null) {
      onSuccess(userCredential);
    }
  } catch (e) {
    if (onFailure != null) {
      log(e.toString());
      onFailure(e as Exception);
    }
  }
}
