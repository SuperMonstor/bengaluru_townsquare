bool validateNumber(String mobileNumber) {
  if (mobileNumber.length == 10 &&
      int.tryParse(mobileNumber[0])! >= 6 &&
      int.tryParse(mobileNumber[0])! <= 9) {
    print(true);
    return true;
  } else {
    print(false);
    return false;
  }
}
