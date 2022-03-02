import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/utils/preferences_services.dart';
import 'package:naouma/view/home/home_screen.dart';
import 'package:naouma/view/login/login_view.dart';
import 'package:page_transition/page_transition.dart';

class SplashController extends GetxController {
  Timer _timer;
  Timer get timer => _timer;
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;
  FlutterLogoStyle get logoStyle => _logoStyle;

  FadeIn() {
    _timer = new Timer(const Duration(seconds: 2), () {
      _logoStyle = FlutterLogoStyle.horizontal;
      update();
    });
  }

  @override
  void onInit() {
    // initPrefs();
    super.onInit();

    // startTimer();
  }

  void startTimer() async {
    Timer(Duration(milliseconds: 4100), () {
      Get.off(
          () => PreferencesServices.getBool(
                IS_LOGIN,
              )
                  ? HomeScreen()
                  : LoginView(),
          transition: Transition.leftToRightWithFade);
      // Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: DetailScreen()));
    });
  }

  void initPrefs() async {
    await PreferencesServices.init();
  }
}
