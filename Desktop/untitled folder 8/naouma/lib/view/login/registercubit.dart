import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naouma/models/auth_model.dart';
import 'package:naouma/network/endpoint.dart';
import 'package:naouma/network/remote/dioHelper.dart';
import 'package:naouma/view/login/registerstates.dart';

class RegisterScreenCubit extends Cubit<RegisterAppStates> {
  RegisterScreenCubit() : super(RegistercubitIntialStates());
  static RegisterScreenCubit get(context) => BlocProvider.of(context);
  AuthModel RegisterModel;

  void userlogin(
      {@required password,
      @required name,
      @required phone,
      @required confirmpassword}) {
    emit(ShopRegisterLoadingState());
    DioHelper.postdata(url: register, data: {
      'password': password,
      'password_confirmation': confirmpassword,
      'name': name,
      'mobile': phone
    }).then((value) {
      print(value.data);
      RegisterModel = AuthModel.fromJson(value.data);

      emit(ShopRegisterSuccessStates(RegisterModel));
    }).catchError((error) {
      emit(ShopRegisterErrorStates(error.toString()));
    });
  }
}
