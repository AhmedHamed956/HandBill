import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_rakeb_user/UI/drawer/notifcation_screen.dart';

import '../UI/drawer/ContactSupport.dart';
import '../UI/drawer/travel_history.dart';
import 'constant.dart';

Widget DefultButton({
  double? width,
  double? height,
  double? fontsize,
  required String text,
  required VoidCallback function,
  required Color color,
  required Color textcolor,
}) =>
    Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: color),
      child: MaterialButton(
          onPressed: function,
          child: Text(text,
              style: TextStyle(
                  color: textcolor,
                  fontSize: fontsize,
                  fontWeight: FontWeight.w500))),
    );
Widget DefultgridentButton({
  double? width,
  double? height,
  double? fontsize,
  required String text,
  required VoidCallback function,
  required Color color1,
  required Color color2,
  required Color textcolor,
}) =>
    Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color1, color2])),
        child: MaterialButton(
            onPressed: function,
            child: Text(text,
                style: TextStyle(
                    color: textcolor,
                    fontSize: fontsize,
                    fontWeight: FontWeight.w500))));
Widget defaulttextfield(
        {required TextEditingController controller,
        required TextInputType type,
        bool? ispromocode,
        bool isQuickSearch = false,
        bool isPassword = false,
        VoidCallback? ontap,
        ValueChanged? onsmuit,
        ValueChanged? onchanged,
        Function? validator,
        String? label,
        context,
        bool? vaild,
        String? hinttext,
        String? promecode,
        int? shopid,
        String? prefix,
        Widget? suffix,
        Color? iconColor,
        VoidCallback? suffixpressed,
        double? fontsize,
        Color? textColor,
        Color? fontColor}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onsmuit,
      onChanged: onchanged,
      onTap: ontap,

      // validator: validator,

      decoration: InputDecoration(
        suffixIcon: suffix,

        border: InputBorder.none,
        hintText: hinttext,
        hintStyle: TextStyle(
            fontSize: fontsize, color: textColor, fontWeight: FontWeight.w500),
        labelText: label,
        enabled: vaild == true ? false : true,
        prefixIcon: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              prefix.toString(),
              height: 40,
              width: 40,
              // color: iconColor,
            ),
          ],
        ),
        // suffixIcon: IconButton(onPressed: suffixpressed, icon: Icon(suffix))
      ),
    );

Widget textfield(
        {required TextEditingController controller,
        required TextInputType type,
        bool? ispromocode,
        bool isQuickSearch = false,
        bool isPassword = false,
        VoidCallback? ontap,
        ValueChanged? onsmuit,
        ValueChanged? onchanged,
        Function? validator,
        String? label,
        context,
        bool? vaild,
        String? hinttext,
        String? promecode,
        int? shopid,
        String? prefix,
        Widget? suffix,
        Color? iconColor,
        VoidCallback? suffixpressed,
        double? fontsize,
        Color? textColor,
        Color? fontColor}) =>
    TextFormField(
      autovalidateMode: AutovalidateMode.always,
      keyboardType: type,
      controller: controller,

      decoration: InputDecoration(
        suffix: suffix,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
              height: 100, width: 50, child: Image.asset(prefix.toString())),
        ),
        prefixIconConstraints: BoxConstraints(),
        // icon: Icon(Icons.phone_android),
        hintText: hinttext,
        hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 12,
            fontWeight: FontWeight.w400),

        // labelText: 'No HP',
      ),
      // validator: (String? value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Mohon Isikan Data';
      //   }
      //   return null;
      // },
    );
Widget drawer(
        {TextEditingController? controller,
        TextInputType? type,
        bool? ispromocode,
        bool isQuickSearch = false,
        bool isPassword = false,
        VoidCallback? ontap,
        ValueChanged? onsmuit,
        ValueChanged? onchanged,
        Function? validator,
        String? label,
        context,
        bool? vaild,
        String? hinttext,
        String? promecode,
        int? shopid,
        IconData? prefix,
        IconData? suffix,
        Color? iconColor,
        VoidCallback? suffixpressed,
        double? fontsize,
        Color? textColor,
        Color? fontColor}) =>
    ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
      child: Drawer(
        backgroundColor: blackButton,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          children: [
            Container(
              height: 101,
              width: 101,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.5, color: prime1Color)),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Ellipse 256.png'),
                  radius: 45.0,
                ),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Paul Martin',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'paulmartin@gmail.com',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 42,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                height: 2,
                color: prime1Color.withOpacity(0.9),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const rowWidget(
              image: 'assets/images/Home.svg',
              name: 'Home',
            ),
            const SizedBox(
              height: 30,
            ),
            const rowWidget(
              name: 'Travel History',
              image: 'assets/images/history-line (1).svg',
            ),
            const SizedBox(
              height: 30,
            ),
            const rowWidget(
                name: 'Drivers', image: 'assets/images/Drivers.svg'),
            const SizedBox(
              height: 30,
            ),
            const rowWidget(
              name: 'Notifications',
              image: 'assets/images/Notification.svg',
            ),
            const SizedBox(
              height: 30,
            ),
            const rowWidget(
                name: 'Settings', image: 'assets/images/Settings.svg'),
            const SizedBox(
              height: 30,
            ),
            const rowWidget(
              name: 'Contact support',
              image: 'assets/images/healthicons_contact-support-outline.svg',
            ),
            const SizedBox(
              height: 30,
            ),
            const rowWidget(name: 'Log Out', image: 'assets/images/Logout.svg'),
          ],
        ),
        // child: ListView(
        //   // Important: Remove any padding from the ListView.
        //   padding: EdgeInsets.zero,
        //   children: [
        //     const DrawerHeader(
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //       ),
        //       child: Text('Drawer Header'),
        //     ),
        //     ListTile(
        //       title: const Text('Home'),
        //       // selected: _selectedIndex == 0,
        //       onTap: () {
        //         // Update the state of the app
        //         // _onItemTapped(0);
        //         // Then close the drawer
        //         Navigator.pop(context);
        //       },
        //     ),
        //     ListTile(
        //       title: const Text('Business'),
        //       // selected: _selectedIndex == 1,
        //       onTap: () {
        //         // Update the state of the app
        //         // _onItemTapped(1);
        //         // Then close the drawer
        //         Navigator.pop(context);
        //       },
        //     ),
        //     ListTile(
        //       title: const Text('School'),
        //       // selected: _selectedIndex == 2,
        //       onTap: () {
        //         // Update the state of the app
        //         // _onItemTapped(2);
        //         // Then close the drawer
        //         Navigator.pop(context);
        //       },
        //     ),
        //   ],
        // ),
      ),
    );

class rowWidget extends StatelessWidget {
  const rowWidget({required this.name, required this.image, this.support});

  final String image;
  final String? support;

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: support != 'true' ? 30 : 0),
      child: InkWell(
        onTap: () {
          name == 'Notifications'
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationScren()))
              : name == 'Travel History'
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TravelHistory()))
                  : name == 'Contact support'
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactSupport()))
                      : null;
        },
        child: Row(
          children: [
            Container(
              // height: 40,
              // width: 40,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      prime1Color,
                      prime2Color,
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(image,
                    height: 24, width: 24, fit: BoxFit.scaleDown
                    // color: Colors.white,
                    ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: support != 'true' ? 18 : 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget rowWidget(String name, String image, context) => 
