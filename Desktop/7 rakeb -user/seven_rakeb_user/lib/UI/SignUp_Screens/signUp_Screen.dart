import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_rakeb_user/Shared/component.dart';

import '../../Shared/constant.dart';
import 'otp_Screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController phoneController = TextEditingController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackButton,
      body: ListView(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  // height: 300,
                  child: Image.asset(
                    'assets/images/placeholder.png',
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                children: [
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70, bottom: 53),
                        child: Container(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                          color: phoneTextFieldColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (index == 1) {
                                    index = 0;
                                  }
                                });
                              },
                              child: Container(
                                height: 38,
                                width: 149,
                                decoration: BoxDecoration(
                                    gradient: index == 0
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              prime1Color,
                                              prime2Color,
                                            ],
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: Text(
                                    'User',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (index == 0) {
                                    index = 1;
                                  }
                                });
                              },
                              child: Container(
                                height: 38,
                                width: 149,
                                decoration: BoxDecoration(
                                    gradient: index == 1
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              prime1Color,
                                              prime2Color,
                                            ],
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: Text(
                                    'Driver',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // child: Text('aaa'),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    // height: 57,
                    width: 335,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: phoneTextFieldColor),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 60,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 18,
                                ),
                                Image.asset(
                                  'assets/images/Calling.png',
                                  height: 42,
                                  // width: 42,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          )),
                        ),
                        Container(
                          height: 50,
                          width: 320,
                          child: defaulttextfield(
                              // prefix: 'assets/images/Calling.png',
                              // suffix: '+20',
                              hinttext: 'phone',
                              textColor: Colors.white.withOpacity(0.6),
                              prefix: 'assets/images/Calling.png',
                              suffix: Container(
                                width: 60,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      child: VerticalDivider(
                                        color: Colors.white.withOpacity(0.5),
                                        thickness: 1,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '+20',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              controller: phoneController,
                              type: TextInputType.phone),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 82,
                  ),
                  Container(
                      child: DefultgridentButton(
                          height: 56,
                          width: 335,
                          color1: prime1Color,
                          color2: prime2Color,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OtpScreen()));
                          },
                          text: 'Send',
                          textcolor: Colors.white)),
                  SizedBox(
                    height: 56,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 88.736,
                        child: Divider(
                          thickness: 1,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        width: 18.8,
                      ),
                      Text(
                        'Or',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 18.8,
                      ),
                      Container(
                        width: 88.736,
                        child: Divider(
                          thickness: 1,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 71,
                        width: 71,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: faceBookCircleColor),
                        child: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            'assets/images/facebook.svg',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 71,
                        width: 71,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: faceBookCircleColor,
                        ),
                        child: Transform.scale(
                          scale: 0.5,
                          child: Image.asset(
                            'assets/images/google.png',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.5)),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' Log In',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
