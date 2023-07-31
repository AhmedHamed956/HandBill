import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_rakeb_user/UI/home/home_Screen.dart';

import '../../Shared/component.dart';
import '../../Shared/constant.dart';

class FindDriver extends StatefulWidget {
  const FindDriver({super.key});

  @override
  State<FindDriver> createState() => _FindDriverState();
}

class _FindDriverState extends State<FindDriver> {
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolKey,

      backgroundColor: blackButton,
      // appBar: AppBar(),
      drawer: drawer(),
      // drawerEnableOpenDragGesture: false,
      // drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     scaffolKey.currentState!.openDrawer();
                  //   },
                  //   child: null,
                  // ),

                  InkWell(
                    onTap: () {
                      print('aaaaaa');
                      setState(() {
                        scaffolKey.currentState!.openDrawer();
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
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
                      child: SvgPicture.asset('assets/images/Path74.svg',
                          height: 10, width: 10, fit: BoxFit.scaleDown
                          // color: Colors.white,
                          ),
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  const Text(
                    'Drivers',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: (BuildContext context) => StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return Container(
                              height: 509.0,
                              color: Colors
                                  .transparent, //could change this to Color(0xFF737373),
                              //so you don't have to change MaterialApp canvasColor
                              child: Container(
                                  decoration: new BoxDecoration(
                                    color: blackButton,
                                  ),
                                  child: index == 0
                                      ? Column(
                                          children: [
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Container(
                                              width: 64,
                                              height: 4,
                                              color: phoneTextFieldColor,
                                            ),
                                            const SizedBox(
                                              height: 26,
                                            ),
                                            Container(
                                              child: Text(
                                                'Filter By',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 26,
                                            ),
                                            Row(
                                              children: const [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 32),
                                                  child: Text(
                                                    'Gender',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                child: Container(
                                                    height: 57,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            phoneTextFieldColor),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 17),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Male / Female',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Container(
                                                            height: 11,
                                                            width: 11,
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/Arrow - Down 2.svg',

                                                              fit: BoxFit
                                                                  .scaleDown,
                                                              // color: Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: const [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 32),
                                                  child: Text(
                                                    'Car Type',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                child: Container(
                                                    height: 57,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            phoneTextFieldColor),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 17),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Choose Type',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Container(
                                                            height: 11,
                                                            width: 11,
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/Arrow - Down 2.svg',

                                                              fit: BoxFit
                                                                  .scaleDown,
                                                              // color: Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: const [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 32),
                                                  child: Text(
                                                    'adaptation',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                child: Container(
                                                    height: 57,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            phoneTextFieldColor),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 17),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Yes / No',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Container(
                                                            height: 11,
                                                            width: 11,
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/Arrow - Down 2.svg',

                                                              fit: BoxFit
                                                                  .scaleDown,
                                                              // color: Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 42,
                                                      vertical: 30),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                      child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: cancelColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )),
                                                  SizedBox(
                                                    width: 45,
                                                  ),
                                                  Container(
                                                      child:
                                                          DefultgridentButton(
                                                              height: 50,
                                                              width: 198,
                                                              fontsize: 15,
                                                              color1:
                                                                  prime1Color,
                                                              color2:
                                                                  prime2Color,
                                                              function: () {
                                                                setState(() {
                                                                  index = 1;
                                                                });
                                                                // Navigator.push(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder: (context) => OrderScreen(
                                                                //               currentLocation:
                                                                //                   _currentAddress.toString(),
                                                                //             )
                                                                //             )
                                                                //             );
                                                              },
                                                              text: 'Apply',
                                                              textcolor:
                                                                  Colors.white))
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Container(
                                              width: 64,
                                              height: 4,
                                              color: phoneTextFieldColor,
                                            ),
                                            const SizedBox(
                                              height: 73,
                                            ),

                                            // Container(
                                            //   width: 107.0,
                                            //   height: 107.0,
                                            //   decoration: BoxDecoration(
                                            //     color: const Color(0xff7c94b6),
                                            //     image: DecorationImage(
                                            //       image: NetworkImage(
                                            //           'http://i.imgur.com/QSev0hg.jpg'),
                                            //       fit: BoxFit.cover,
                                            //     ),
                                            //     borderRadius: BorderRadius.all(
                                            //         Radius.circular(50.0)),
                                            //     border: Border.all(
                                            //       color: Colors.red,
                                            //       width: 4.0,
                                            //     ),
                                            //   ),
                                            // ),
                                            // // Container(
                                            //   height: 107,
                                            //   width: 107,
                                            //   margin: const EdgeInsets.all(20),
                                            //   decoration: BoxDecoration(
                                            //       image: const DecorationImage(
                                            //           image: AssetImage(
                                            //             'assets/images/Ellipse 256.png',
                                            //           ),
                                            //           fit: BoxFit.cover),
                                            //       border: Border.all(
                                            //           color: prime1Color,
                                            //           width: 2),
                                            //       borderRadius:
                                            //           BorderRadius.circular(
                                            //               100)),
                                            // )
                                            Container(
                                              // height: 107,
                                              // width: 107,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 2.5,
                                                      color: prime1Color)),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                radius: 52.0,
                                                child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'assets/images/Ellipse 256.png'),
                                                  radius: 48.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 19,
                                            ),

                                            Text(
                                              'Paul Martin',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 13,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 55),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    '+91 8606722845',
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  // SizedBox(
                                                  //   width: 8,
                                                  // ),
                                                  SizedBox(
                                                      height: 13,
                                                      child: VerticalDivider(
                                                          thickness: 1,
                                                          // width: 20,
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.6))),
                                                  // SizedBox(
                                                  //   width: 8,
                                                  // ),
                                                  Text(
                                                    'paulmartin@gmail.com',
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 26,
                                            ),
                                            RatingBarIndicator(
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                rating: 2.0,
                                                // double.tryParse(model.commissionRate ?? '0.0') ??
                                                //     0.0,
                                                unratedColor: Colors.grey,
                                                itemCount: 5,
                                                itemSize: 32,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Container(
                                                    height: 32,
                                                    width: 32,
                                                    child: SvgPicture.asset(
                                                      'assets/images/Star 3.svg',
                                                    ),
                                                  );
                                                }),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 42,
                                                      vertical: 30),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        index = 0;
                                                      });
                                                    },
                                                    child: Container(
                                                        child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: cancelColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                                  ),
                                                  SizedBox(
                                                    width: 45,
                                                  ),
                                                  Container(
                                                      child:
                                                          DefultgridentButton(
                                                              height: 50,
                                                              width: 198,
                                                              fontsize: 15,
                                                              color1:
                                                                  prime1Color,
                                                              color2:
                                                                  prime2Color,
                                                              function: () {
                                                                setState(() {
                                                                  index = 1;
                                                                });
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            HomeScreen(
                                                                              confirm: 'confirm',
                                                                            )));
                                                              },
                                                              text: 'Book Now',
                                                              textcolor:
                                                                  Colors.white))
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                            );
                          },
                        ),
                      );
                    },

                    //   Builder(
                    //     builder: (context) => // Ensure Scaffold is in context
                    //         IconButton(
                    //             icon: Icon(Icons.menu),
                    //             onPressed: () =>
                    //                 Scaffold.of(context).openDrawer()),
                    //   );
                    // },
                    child: Container(
                      height: 40,
                      width: 40,
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
                      child: SvgPicture.asset('assets/images/filter.svg',
                          height: 10, width: 10, fit: BoxFit.scaleDown
                          // color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 41,
            // ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 83,
                    width: 335,
                    decoration: BoxDecoration(
                        color: phoneTextFieldColor,
                        borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                child: CircleAvatar(
                                  // backgroundColor: Colors.brown.shade800,
                                  child: Image.asset(
                                      'assets/images/Ellipse 256.png',
                                      fit: BoxFit.cover
                                      // color: Colors.white,
                                      ),
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Richards',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Audi Q7',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.4),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: availbleContainer),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(
                                    'available now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 11,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
