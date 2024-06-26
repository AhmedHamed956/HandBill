import 'package:naouma/models/auth_model.dart';

abstract class LoginAppStates {}

class LogincubitIntialStates extends LoginAppStates {}

class ShopLoginSuccessStates extends LoginAppStates {
  final AuthModel authModel;

  ShopLoginSuccessStates(this.authModel);
}

class ShopLoginLoadingState extends LoginAppStates {}

class ShopLoginErrorStates extends LoginAppStates {
  final String error;
  ShopLoginErrorStates(this.error);
}

class ShopChangePasswordVisibilityState extends LoginAppStates {}
