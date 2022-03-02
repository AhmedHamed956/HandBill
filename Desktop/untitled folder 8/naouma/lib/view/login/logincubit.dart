import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naouma/models/auth_model.dart';
import 'package:naouma/network/endpoint.dart';
import 'package:naouma/network/remote/dioHelper.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/view/login/loginstates.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginScreenCubit extends Cubit<LoginAppStates> {
  LoginScreenCubit() : super(LogincubitIntialStates());
  static LoginScreenCubit get(context) => BlocProvider.of(context);

  AuthModel authModel;

  void userlogin({@required mobile, @required password}) {
    emit(ShopLoginLoadingState());
    DioHelper.postdata(
        url: Login,
        data: {'mobile': mobile, 'password': password}).then((value) {
      print(value.data);
      authModel = AuthModel.fromJson(value.data);

      emit(ShopLoginSuccessStates(authModel));
      flag = 1;
    }).catchError((error) {
      emit(ShopLoginErrorStates(error.toString()));
    });
  }

  Widget nbAppButtonWidget(BuildContext context, String text, Function onTap) {
    return AppButton(
      text: text,
      textStyle: boldTextStyle(color: white),
      color: kPrimaryColor,
      onTap: onTap,
      width: context.width(),
    ).cornerRadiusWithClipRRect(20);
  }
}
