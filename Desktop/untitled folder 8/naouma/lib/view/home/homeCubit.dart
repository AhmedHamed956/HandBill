import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naouma/models/create_room_model.dart';
import 'package:naouma/models/room_index.dart';
import 'package:naouma/network/endpoint.dart';
import 'package:naouma/network/remote/dioHelper.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/view/home/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialStates());

  static HomeCubit get(context) => BlocProvider.of(context);

  CreateRoomModel createRoomModel;

  Future<void> createroom({roomname, roomdesc}) {
    emit(HomeLoadingState());

    DioHelper.postdata(
        url: roomstore,
        data: {'room_name': roomname, 'room_desc': roomdesc}).then((value) {
      print(value.data);

      createRoomModel = CreateRoomModel.fromJson(value.data);

      emit(HomeSuccessStates());
    }).catchError((error) {
      emit(HomeErrorStates(error.toString()));
    });
  }

  CategoriesModel categoriesModel;

  Future<void> getCategory() {
    DioHelper.getdata(url: roomstore, token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(value.data);
      emit(JoinedSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(JoinedErrorStates());
    });
  }
}
