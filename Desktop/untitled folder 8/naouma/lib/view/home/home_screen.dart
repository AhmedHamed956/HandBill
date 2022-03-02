import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:naouma/controller/home_controller.dart';
import 'package:naouma/utils/constants.dart';

import 'app_bar_item.dart';
import 'components/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
          key: controller.scaffoldKey,
          drawer: HomeDrawer(controller.scaffoldKey),
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => controller.scaffoldKey.currentState.openDrawer(),
              child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    "assets/images/Profile Image.png",
                    fit: BoxFit.cover,
                  )),
            ),
            title: controller.currentIndex == 0
                ? _homeTabAppBarTitle(controller)
                : controller.currentIndex == 1
                    ? _momentsTabAppBarTitle(controller)
                    : Text("الرسائل"),
            centerTitle: true,
            actions: [
              controller.showSearchIcon
                  ? IconButton(
                      icon: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        // Get.to(SearchScreen());
                      })
                  : Container(),
              controller.showPublishIcon
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              print("publish button clicked");
                            }),
                      ),
                    )
                  : Container(),
            ],
          ),
          body: controller.children[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), title: Text("الغرف")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarms_rounded),
                  title: Text("اللحظات")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text("الرسائل")),
            ],
            currentIndex: controller.currentIndex,
            elevation: 5.0,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kGreyColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (value) {
              controller.changeCurrentScreen(value);
            },
          ),

          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  Widget _homeTabAppBarTitle(final controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              controller.changeAppBarSelectedItem(0);
            },
            child: AppBarItem(
              title: "غرفتى",
              textColor: controller.appBarCurrentItem == 0
                  ? Colors.white
                  : kGreyColor.shade600,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.changeAppBarSelectedItem(1);
            },
            child: AppBarItem(
              title: "الكل",
              textColor: controller.appBarCurrentItem == 1
                  ? Colors.white
                  : kGreyColor.shade600,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.changeAppBarSelectedItem(2);
            },
            child: AppBarItem(
              title: "اكتشاف",
              textColor: controller.appBarCurrentItem == 2
                  ? Colors.white
                  : kGreyColor.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _momentsTabAppBarTitle(final controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              controller.changeAppBarSelectedItem(0);
            },
            child: AppBarItem(
              title: "المواضيع",
              textColor: controller.appBarCurrentItem == 0
                  ? Colors.white
                  : kGreyColor.shade600,
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.changeAppBarSelectedItem(1);
            },
            child: AppBarItem(
              title: "المقترحة",
              textColor: controller.appBarCurrentItem == 1
                  ? Colors.white
                  : kGreyColor.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
