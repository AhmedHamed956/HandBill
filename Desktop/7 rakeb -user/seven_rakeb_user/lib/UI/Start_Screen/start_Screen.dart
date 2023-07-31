import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_rakeb_user/UI/SignUp_Screens/signUp_Screen.dart';

import '../../Shared/component.dart';
import '../../Shared/constant.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({
    super.key,
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            prime1Color,
            prime2Color,
          ],
        )),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 49, bottom: 10.5, right: 82, left: 82),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Logo.png',
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Get there.",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 467,
                child: Image.asset(
                  'assets/images/Logo pattern.png',
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 318,
                  width: 260,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: prime1Color),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/car.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: DefultButton(
                      height: 56,
                      width: 315,
                      function: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      textcolor: Colors.white,
                      color: blackButton,
                      text: 'Get Started',
                      fontsize: 15)),
            )
          ],
        ),
      ),
    );
  }
}
