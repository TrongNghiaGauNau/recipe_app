import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  static const facebookSignupUrl = 'https://m.facebook.com/reg';
  static const googleSignupUrl = 'https://accounts.google.com/signup';
  static const facebook = 'Facebook';
  static const google = 'Google';
  static const logIntoYourAccount =
      'Log into your account using one of the options below.';


  // login view rich text at bottom
  static const dontHaveAnAccount = "Don't have an account?\n";
  static const signUpOn = 'Sign up on ';
  static const orCreateAnAccountOn = ' or create an account on ';
  const Strings._();
}