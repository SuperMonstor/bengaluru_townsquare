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

/* Conditions for username to be valid: 
- Requires minimum of 3 character and a maximum of 30
- Accepted characters are: a-z A-Z 0-9 dot(.) underscore(_)
- Allow "_" and "." in the middle of character only
- Numbers must not be the first character
- The dot (.) or underscore (_) must not be the first or last character.
- The dot (.) or underscore (_) must not appear consecutively,
  e.g., johnson..doe or james__doe  [returns false]
- Username should be unique
*/

bool isUsernameValid(String value) {
  if (value.length < 3 || value.length > 30) {
    return false;
  }
  if (!RegExp(
          r'^(?!^[0-9])[a-zA-Z0-9]+([_.](?![._])|[a-zA-Z0-9]){1,28}[a-zA-Z0-9]$')
      .hasMatch(value)) {
    return false;
  }
  if (RegExp(r'[._]{2}').hasMatch(value)) {
    return false;
  }
  return true;
}

/*
This regular expression checks if a string matches the format of a date in "DD/MM/YYYY" format. Here's a breakdown:

- `^(0[1-9]|[12][0-9]|3[01])`: This checks for the day part of the date. It should be a two-digit number between 01 and 31.
- `\/`: This matches the '/' character.
- `(0[1-9]|1[012])`: This checks for the month part of the date. It should be a two-digit number between 01 and 12.
- `\/`: This matches the '/' character.
- `\d{4}$`: This checks for the year part of the date. It should be a four-digit number.
*/

bool isDateOfBirthValid(String dob) {
  if (RegExp(r'^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/\d{4}$')
          .hasMatch(dob) &&
      isUserOver18(dob)) {
    return true;
  }
  return false;
}

bool isUserOver18(String dob) {
  int? year = int.tryParse(dob.substring(dob.length - 4));
  if ((year != null) && ((DateTime.now().year - year) > 18)) {
    return true;
  }
  return false;
}
