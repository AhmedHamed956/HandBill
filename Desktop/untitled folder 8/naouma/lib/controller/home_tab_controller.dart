import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:naouma/view/home/home_tab_pages/discovery_tab.dart';
import 'dart:convert' as convert;
import 'dart:convert';

import 'package:naouma/view/home/home_tab_pages/home_tab/home_tab_all.dart';
import 'package:naouma/view/home/home_tab_pages/my_room_tab.dart';

class HomeTabController extends GetxController {
  // to check selected app bar item
  int _appBarCurrentItem = 0;
  int get appBarCurrentItem => _appBarCurrentItem;

  // Widget _currentScreen = HomeTab();
  final List<Widget> _homeTabChildren = [
    HomeTabAll(),
    MyRoomTab(),
    DiscoveryTab(),
  ];
  List<Widget> get homeTabChildren => _homeTabChildren;

  updateSelectedItem(int selectedIndex) {
    _appBarCurrentItem = selectedIndex;
    update();
  }

  Future<void> getNewRooms(int curPage) async {
    print("New Rooms");
    await http.get("url").then((value) {
      // handle json response
    });
  }
}
