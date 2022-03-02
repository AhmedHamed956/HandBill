import 'package:naouma/models/auth_model.dart';

abstract class RegisterAppStates {}

class RegistercubitIntialStates extends RegisterAppStates {}

class ShopRegisterSuccessStates extends RegisterAppStates {
  final AuthModel _authModel;

  ShopRegisterSuccessStates(this._authModel);
}

class ShopRegisterLoadingState extends RegisterAppStates {}

class ShopRegisterErrorStates extends RegisterAppStates {
  final String error;
  ShopRegisterErrorStates(this.error);
}

class ShopRegisterChangePasswordVisibilityState extends RegisterAppStates {}
