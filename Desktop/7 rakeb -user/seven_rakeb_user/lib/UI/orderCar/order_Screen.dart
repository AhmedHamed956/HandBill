import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';

import '../../Shared/component.dart';
import '../../Shared/constant.dart';
import '../Find_Driver/find_driver.dart';

class OrderScreen extends StatefulWidget {
  final String? currentLocation;
  const OrderScreen({super.key, this.currentLocation});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController myLocationController = TextEditingController();
  @override
  void initState() {
    myLocationController.text = widget.currentLocation.toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackButton,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: phoneTextFieldColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 194,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 31,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 21),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: prime1Color),
                                  ),
                                  Row(
                                    children: [
                                      Dash(
                                          direction: Axis.vertical,
                                          length: 77,
                                          dashLength: 2,
                                          dashColor:
                                              Colors.white.withOpacity(0.5)),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.symmetric(vertical: 3),
                                      //   child: SizedBox(
                                      //     height: 70,
                                      //     child: VerticalDivider(
                                      //       thickness: 1,
                                      //       // width: 20,
                                      //       color: Colors.white,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: greenDot),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PICK UP',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Springwood',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 21,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Container(
                                      width: 250,
                                      height: 7,
                                      child: Divider(
                                        height: 1,
                                        color: prime1Color,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 21,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'DROP OFF',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Container(
                                        height: 25,
                                        width: 200,
                                        child: TextFormField(
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),

                                          decoration: const InputDecoration(
                                            border: InputBorder.none,

                                            // icon: Icon(Icons.person),
                                            hintText: 'Where to?',
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),

                                            // labelText: 'Name *',s
                                          ),

                                          onFieldSubmitted: (String? value) {
                                            setState(() {
                                              // currentindex = 1;
                                            });
                                          },
                                          // validator: (String? value) {
                                          //   return (value != null &&
                                          //           value.contains('@'))
                                          //       ? 'Do not use the @ char.'
                                          //       : null;
                                          // },
                                        ),
                                      ),
                                      // Text(
                                      //   'Where to?',
                                      //   style: TextStyle(
                                      //       color: Colors.white,
                                      //       fontSize: 15,
                                      //       fontWeight: FontWeight.w500),
                                      // ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From',
                      style: TextStyle(
                          color: prime1Color,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Container(
                      height: 20,
                      width: 300,
                      child: TextFormField(
                        controller: myLocationController,

                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),

                        decoration: const InputDecoration(
                          border: InputBorder.none,

                          // icon: Icon(Icons.person),
                          // hintText: 'Where to?',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),

                          // labelText: 'Name *',
                        ),

                        onFieldSubmitted: (String? value) {
                          setState(() {
                            // currentindex = 1;
                          });
                        },
                        // validator: (String? value) {
                        //   return (value != null &&
                        //           value.contains('@'))
                        //       ? 'Do not use the @ char.'
                        //       : null;
                        // },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: 7,
                      child: Divider(
                        height: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 28.5,
          ),
          Row(
            children: const [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'To',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 57,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: phoneTextFieldColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose Location',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 11,
                      width: 11,
                      child: SvgPicture.asset(
                        'assets/images/Arrow - Down 2.svg',
                        fit: BoxFit.cover,
                        // color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            children: const [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Date',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 57,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: phoneTextFieldColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'assets/images/Calendar.svg',
                        fit: BoxFit.cover,
                        // color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            children: const [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Time',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 57,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: phoneTextFieldColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose Time',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'assets/images/Time Square.svg',
                        fit: BoxFit.cover,
                        // color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Container(
                child: DefultgridentButton(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    fontsize: 15,
                    color1: prime1Color,
                    color2: prime2Color,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FindDriver()));
                    },
                    text: 'Find Driver',
                    textcolor: Colors.white)),
          )
        ],
      ),
    );
  }
}
