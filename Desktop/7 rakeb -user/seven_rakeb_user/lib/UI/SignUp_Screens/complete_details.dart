import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:seven_rakeb_user/UI/Set_Location/set_Location.dart';

import '../../Shared/component.dart';
import '../../Shared/constant.dart';

class CompleteDetails extends StatefulWidget {
  const CompleteDetails({super.key});

  @override
  State<CompleteDetails> createState() => _CompleteDetailsState();
}

class _CompleteDetailsState extends State<CompleteDetails> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emaillController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                            'Complete Details',
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
                          'Please compleate your profile',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 69,
                  ),
                  _TextFieldWidget(
                      hint: 'First Name',
                      image: 'assets/images/Profile.png',
                      controller: firstNameController,
                      type: TextInputType.name),
                  SizedBox(
                    height: 26,
                  ),
                  _TextFieldWidget(
                      hint: 'Last Name',
                      image: 'assets/images/Profile.png',
                      controller: lastNameController,
                      type: TextInputType.name),
                  SizedBox(
                    height: 26,
                  ),
                  _TextFieldWidget(
                      hint: 'Email',
                      image: 'assets/images/Message.png',
                      controller: emaillController,
                      type: TextInputType.emailAddress),
                  SizedBox(
                    height: 26,
                  ),
                  _TextFieldWidget(
                      hint: 'Password',
                      image: 'assets/images/Lock.png',
                      controller: passwordController,
                      type: TextInputType.phone),
                  SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        height: 99,
                        width: 335,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          // radius: const Radius.circular(12),
                          color: prime1Color, //color of dotted/dash line

                          strokeWidth: 2, //thickness of dash/dots
                          dashPattern: [3, 6],
                          //dash patterns, 10 is dash width, 6 is space width
                          child: Container(
                            decoration: BoxDecoration(
                                color: phoneTextFieldColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 35,
                                    width: 35,
                                    child:
                                        Image.asset('assets/images/Image.png')),
                                SizedBox(
                                  height: 13,
                                ),
                                Text(
                                  "Upload Your Photo",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 35,
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
                                    builder: (context) => const SetLocation()));
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

  Widget _TextFieldWidget(
      {required String hint,
      required String image,
      required controller,
      required type}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: phoneTextFieldColor),
          child: textfield(
              controller: controller, type: type, hinttext: hint, prefix: image)
          // child: defaulttextfield(

          //     controller: nameController,
          //     type: TextInputType.name,
          //     prefix: 'assets/images/Profile.png'),
          ),
    );
  }
}
