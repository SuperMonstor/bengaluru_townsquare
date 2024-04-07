import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> sendOTP({
  required String phone,
  String? otp,
  Function(Exception exception)? onFailure,
  Function(String verificationId)? onSuccess,
}) async {
  String verificationId = '';
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
      verificationId = verId;
      if (onSuccess != null) {
        onSuccess(verificationId);
      }
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      final e = Exception("SMS Automatic Retrieval timed out $verificationId");
      if (onFailure != null) {
        onFailure(e);
      }
      throw e;
    },
  );
  return verificationId;
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
