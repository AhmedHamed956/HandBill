import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naouma/store_screen.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/utils/preferences_services.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer(this.scaffoldKey);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          _createHeader(theme),
          Divider(
            color: Colors.grey,
            height: 1,
          ), //here is a divider
          _createDrawerItem(
            icon: Icon(
              Icons.home,
              size: 28,
            ),
            title: 'المهمات',
            onTap: () {
              Navigator.pop(context);
              // Get.to(MahamScreen());
            },
          ),
          _createDrawerItem(
            icon: Icon(Icons.wallet_travel),
            title: 'المحفظة',
            onTap: () {
              Navigator.pop(context);
              // Get.to(MahfzaScreen());
            },
          ),
          _createDrawerItem(
            icon: Icon(
              Icons.wallet_membership_outlined,
              size: 28,
            ),
            title: 'يلا بريميم',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _createDrawerItem(
            icon: Icon(
              Icons.store,
              size: 28,
            ),
            title: 'المتجر',
            onTap: () {
              Navigator.pop(context);

              Get.to(StoreScreen());
            },
          ),
          _createDrawerItem(
            icon: Icon(
              Icons.label_important_outline_sharp,
              size: 28,
            ),
            title: 'المستوي',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          _createDrawerItem(
            icon: Icon(
              Icons.language,
              size: 28,
            ),
            title: 'اللغة',
            onTap: () {
              Navigator.pop(context);
              // Get.to(LanguageScreen());
            },
          ),
          _createDrawerItem(
            icon: Icon(
              Icons.request_quote_outlined,
              size: 28,
            ),
            title: 'الأسئلة الشائعة والموضوعات',
            onTap: () {
              Navigator.pop(context);
              // Get.to(CommonQuestionsScreen());
            },
          ),
          _createDrawerItem(
            icon: Icon(
              Icons.settings,
              size: 28,
            ),
            title: 'الاعدادات',
            onTap: () {
              Navigator.pop(context);
              // Get.to(SettingsScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget _createHeader(ThemeData theme) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
            radius: 30,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            PreferencesServices.getString(Name_KEY),
            style: theme.textTheme.bodyText1.copyWith(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(
            "id: 352156",
            style: theme.textTheme.bodyText2.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {Icon icon, String title, GestureTapCallback onTap}) {
    return ListTile(
      leading: icon,
      title: Text(title),
      // trailing: Icon(),
      onTap: onTap,
    );
  }
}
