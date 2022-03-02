import 'package:flutter/material.dart';

String token = '';
int flag = 0;

/// Colors*
const kPrimaryColor = Color(0xFF56E0D3);
const kPrimaryColorDark = Color(0xFF56E0D3);
const kPrimaryLightColor = Color(0xFF56E0D3);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kGreyColor = Colors.grey;

const kAnimationDuration = Duration(milliseconds: 150);

final headingStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);
// const number for per page request
const int kPerPageNumber = 20;
const double kBorderRadius = 16;
const double kDefaultPadding = 20;

/// keys ***/
const String USER_DATA_KEY = '/user-data-key';
const String IS_LOGIN = '/is_login-key';
const String ID_KEY = '/ID_KEY';
const String Email_KEY = '/Email_KEY';
const String Name_KEY = '/Name_KEY';

// Agora utils
const String AppId = "45f4567598af4f32afca701cccd0cf2d";
const String AppCertificate = "4518ca6edb7d41e1b3d1e4580678a5e2";
const String agoratoken =
    "00698657cf49a914ad68d30cb93f0d1f578IABEhHTkG4WidHJ5ZNQ7KEqLzJlVatW9BMlFOtpvXE+68ZtRn3IAAAAAEACLgpZhVpcrYQEAAQBXlyth";

/// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
