import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';

import '../../Shared/constant.dart';

class TravelHistory extends StatefulWidget {
  const TravelHistory({super.key});

  @override
  State<TravelHistory> createState() => _TravelHistoryState();
}

class _TravelHistoryState extends State<TravelHistory> {
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
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
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
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Text(
                            'History',
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
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        decoration: const BoxDecoration(
                            color: phoneTextFieldColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        height: 359,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 31,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 21),
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
                                              dashColor: Colors.white
                                                  .withOpacity(0.5)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'PICK UP',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.2,
                                          ),
                                          Text(
                                            '11.:30 AM',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
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
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          width: 280,
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
                                          Row(
                                            children: [
                                              Text(
                                                'DROP OFF',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                              ),
                                              Text(
                                                '12:02 PM',
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Container(
                                            height: 25,
                                            width: 200,
                                            child: Text(
                                              'Bridge Farm',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
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
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 110,
                              width: 280,
                              child: SvgPicture.asset(
                                'assets/images/Asset 2.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Audi Q7',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '23 \$',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Transform.rotate(
                        angle: 142 / 90.0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: prime1Color,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: phoneTextFieldColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 174,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 31,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 21),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      dashColor: Colors.white
                                                          .withOpacity(0.5)),
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
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'PICK UP',
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.2,
                                                  ),
                                                  Text(
                                                    '10.:30 AM',
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                'Springwood',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 21,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Container(
                                                  width: 280,
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
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'DROP OFF',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.3,
                                                      ),
                                                      Text(
                                                        '02:02 PM',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.6),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Container(
                                                    height: 25,
                                                    width: 200,
                                                    child: Text(
                                                      'Tennis Court',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
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
                          ),
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 11,
                          ),
                        ),
                      ),
                    ],
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

class CustomClipPathTopContainerOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Colors.black;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.4890143);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.8545167, 0);
    path0.lineTo(size.width, size.height * 0.4991714);
    path0.lineTo(size.width * 0.8551250, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width * 0.0013417, size.height);
    path0.lineTo(0, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
