import 'package:flutter/material.dart';

// const kPrimaryColor = Color(0xFF00BF6D);
const kPrimaryColor = Color.fromARGB(255, 92, 90, 90);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarningColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
const kTextColor = Color(0xFF757575);

const kDefaultPadding = 20.0;

const photoURL =
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-project-e9a41.appspot.com/o/81201544.jfif?alt=media&token=7fef6d6d-99b3-4ef0-a442-40a230b9e044';

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kRePassNullError = "Please Re-Enter your password";
const String kShortPassError = "Password is too short";
const String kShortRePassError = "Re-Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kFirstNameNullError = "Please Enter your first name";
const String kLastNameNullError = "Please Enter your last name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
