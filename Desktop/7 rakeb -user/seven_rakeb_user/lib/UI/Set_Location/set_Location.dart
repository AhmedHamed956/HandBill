import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_rakeb_user/Shared/component.dart';
import 'package:seven_rakeb_user/UI/home/home_Screen.dart';

import '../../Shared/constant.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
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
                            'Set Location',
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
                    height: MediaQuery.of(context).size.height / 6.5,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 62),
                    child: Container(
                      // height: MediaQuery.of(context).size.height / 1.5,
                      child: SvgPicture.asset(
                        'assets/images/Layer2.svg',
                        height: 250,
                        width: 250,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 49),
                    child: Container(
                      child: Text(
                        'No save Address found',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 19),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         'Enter YourOTP Code that sent to',
                  //         style: TextStyle(
                  //             color: Colors.white.withOpacity(0.5),
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.w400),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            )),
                        child: Center(
                          child: Text(
                            "Current Location",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                      builder: (context) => HomeScreen()));
                            },
                            text: 'Set From map',
                            textcolor: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
