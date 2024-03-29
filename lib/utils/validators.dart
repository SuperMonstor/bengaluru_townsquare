bool validateNumber(String mobileNumber) {
  if (mobileNumber.length == 10 &&
      int.tryParse(mobileNumber[0])! >= 6 &&
      int.tryParse(mobileNumber[0])! <= 9) {
    return true;
  } else {
    return false;
  }
}

  bool validateOTPInput(String otp) {
    otp = otp.replaceAll(' - ', '');
      return otp.length == 6;
  }