import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:seven_rakeb_user/UI/SignUp_Screens/complete_details.dart';

import '../../Shared/component.dart';
import '../../Shared/constant.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String currentText = "";
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  final formKey = GlobalKey<FormState>();
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
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: prime1Color,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Text(
                            'Otp',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Row(
                      children: [
                        Text(
                          'Enter YourOTP Code that sent to',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Row(
                      children: [
                        Text(
                          '+20 ********',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 78,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 34, left: 34),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),

                        length: 4,
                        textStyle:
                            TextStyle(color: Colors.white.withOpacity(0.6)),
                        // obscureText: true,
                        // obscuringCharacter: '*',
                        // obscuringWidget: FlutterLogo(size: 24),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        // validator: (v) {
                        //   if (v!.length < 3) {
                        //     return "I'm from validator";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        pinTheme: PinTheme(

                            // shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(12),
                            fieldHeight: 50,
                            fieldWidth: 60,
                            activeFillColor: phoneTextFieldColor,
                            inactiveFillColor: phoneTextFieldColor,
                            disabledColor: const Color(0xffeeeeee),
                            inactiveColor: phoneTextFieldColor,
                            selectedFillColor: phoneTextFieldColor,
                            activeColor: phoneTextFieldColor),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        // controller: textEditingController,
                        keyboardType: TextInputType.number,
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadows: [
                          BoxShadow(
                            color: shadowOtp.withOpacity(0.08),
                          )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                          print(textEditingController.text);
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                            textEditingController.text = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                      child: DefultgridentButton(
                          height: 56,
                          width: 335,
                          fontsize: 15,
                          color1: prime1Color,
                          color2: prime2Color,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CompleteDetails()));
                          },
                          text: 'Next',
                          textcolor: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
