import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seven_rakeb_user/Shared/constant.dart';
import 'package:seven_rakeb_user/UI/orderCar/order_Screen.dart';

import '../../Shared/component.dart';
import '../Chat/chat_Screen.dart';
import '../review_Rating/review_rating.dart';

class HomeScreen extends StatefulWidget {
  String? confirm;
  int? index;

  HomeScreen({super.key, this.confirm, this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(30.0444, 31.2357), zoom: 14.0);
  late Uint8List markerIcon;
  late BitmapDescriptor customIcon;

  bool typing = false;
  TextEditingController search = TextEditingController();
  List<Marker> markers = <Marker>[];
  BitmapDescriptor? myMarker;

  String? _currentAddress;
  LatLng? _currentLocation;
  int currentindex = 0;
  // UpdateMapModelData? _locations;
  String _mapStyle = '';
  String? shopId;
  double? _currentlat;
  double? _currentlong;
  String? fullLocation;
  String? latlong;
  @override
  void initState() {
    if (widget.confirm == 'confirm') {
      setState(() {
        currentindex = 10;
      });
    }
    if (widget.confirm == 'done') {
      setState(() {
        currentindex = 4;
      });
    }

    if (widget.index != null) {
      setState(() {
        currentindex = 0;
      });
    }

    print(widget.confirm);
    _observeLocation();
    rootBundle.loadString('assets/mapTheme/map_Theme.json').then((string) {
      _mapStyle = string;
    });
    // BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration(size: Size(5, 5)), 'assets/images/206_Logo.png')
    // .then((d) {
    // customIcon = d;
    // });
    // _observeLocation();

    super.initState();
  }

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  late GoogleMapController mapController;
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffolKey,
        drawer: drawer(),
        body: Stack(
          children: <Widget>[
            GoogleMap(
                // myLocationButtonEnabled: true,
                // myLocationEnabled: true,
                mapType: MapType.normal,
                onTap: (position) {
                  _customInfoWindowController.hideInfoWindow!();
                },
                onCameraMove: (position) {
                  _customInfoWindowController.onCameraMove!();
                },
                onMapCreated: _onMapCreated,
                markers: Set<Marker>.of(markers),
                initialCameraPosition: _kGooglePlex),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4.2,
                  ),
                  _currentAddress != null
                      ? Row(
                          children: [
                            SvgPicture.asset('assets/images/location.svg',
                                height: 12, width: 10, fit: BoxFit.scaleDown
                                // color: Colors.white,
                                ),
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                              child: Text(
                                '${_currentAddress}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            )

                            // Container(
                            //   height: 40,
                            //   width: 40,
                            //   decoration: const BoxDecoration(
                            //       color: prime1Color,
                            //       borderRadius: BorderRadius.all(Radius.circular(12))),
                            //   child: SvgPicture.asset('assets/images/Path74.svg',
                            //       height: 10, width: 10, fit: BoxFit.scaleDown
                            //       // color: Colors.white,
                            //       ),
                            // ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
            widget.confirm != 'confirm' ? _index(currentindex) : _confirm(),
            currentindex == 5 ? _confirm() : Container()
          ],
        ),
        floatingActionButton: currentindex == 0
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 218, horizontal: 10),
                child: Container(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    backgroundColor: prime1Color,
                    child: const Icon(Icons.my_location),
                    onPressed: () {
                      setState(() {
                        _onMapCreated;
                      });
                    },
                    // label: Text('My Location'),
                  ),
                ),
              )
            : Container());
  }

  Widget _index(int index) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: phoneTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: index == 0
                      ? 194
                      : index == 1
                          ? 166
                          : index == 2 || index == 3
                              ? 220
                              : null,
                  child: index == 0
                      ? Column(
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
                                      Text(
                                        'PICK UP',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
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
                                        padding:
                                            const EdgeInsets.only(right: 30),
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
                                                color: Colors.white
                                                    .withOpacity(0.5),
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
                                                    fontWeight:
                                                        FontWeight.w500),

                                                // labelText: 'Name *',
                                              ),

                                              onFieldSubmitted:
                                                  (String? value) {
                                                setState(() {
                                                  currentindex = 1;
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
                        )
                      : index == 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                prime1Color,
                                                prime2Color,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                height: 88,
                                                width: 75,
                                                child: Image.asset(
                                                  'assets/images/Car-02.png',
                                                  fit: BoxFit.cover,
                                                  // color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Economy',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                prime1Color,
                                                prime2Color,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                height: 88,
                                                width: 75,
                                                child: Image.asset(
                                                  'assets/images/Car-01.png',
                                                  fit: BoxFit.cover,
                                                  // color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Luxury',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                prime1Color,
                                                prime2Color,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                height: 88,
                                                width: 75,
                                                child: Image.asset(
                                                  'assets/images/Car-03.png',
                                                  fit: BoxFit.cover,
                                                  // color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Family',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : index == 2 || index == 3
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                          index == 2
                                              ? 'Reason'
                                              : 'Negotiate the price',
                                          style: TextStyle(
                                              color: prime1Color,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 20,
                                        width: 300,
                                        child: TextFormField(
                                          // controller: myLocationController,

                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),

                                          decoration: InputDecoration(
                                              border: InputBorder.none,

                                              // icon: Icon(Icons.person),
                                              // hintText: 'Where to?',
                                              hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                              hintText: index == 2
                                                  ? 'Write your reason'
                                                  : 'Write your Price'
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
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        height: 1,
                                        child: Divider(
                                          height: 1,
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  currentindex = 0;
                                                });
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 16,
                                                                horizontal: 32),
                                                        child: Text(
                                                          index == 2
                                                              ? 'Negotiate'
                                                              : "Cancel",
                                                          style: TextStyle(
                                                              color: index == 2
                                                                  ? Colors.white
                                                                  : refusedColor,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )),
                                                  )),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (index == 2) {
                                                  currentindex = 3;
                                                }
                                                if (index == 3) {
                                                  currentindex = 4;
                                                }
                                                setState(() {});
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                          prime1Color,
                                                          prime2Color
                                                        ]),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: const Center(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 16,
                                                              horizontal: 62),
                                                      child: Text(
                                                        'Send',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : index == 4
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: Text(
                                              widget.confirm != 'done'
                                                  ? 'Booking successful'
                                                  : "Trip Start Now",
                                              style: TextStyle(
                                                  color: prime1Color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          ConstrainedBox(
                                            constraints: const BoxConstraints(
                                                maxWidth: 200),
                                            child: Center(
                                              child: Text(
                                                widget.confirm != 'done'
                                                    ? 'Your booking has been confirmed!The driver will pick you in 2 minutes.'
                                                    : "Your end the tripe successfuly",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 5),
                                            child: TextButton(
                                              onPressed: () {
                                                if (widget.confirm != 'done') {
                                                  currentindex = 5;
                                                }
                                                if (widget.confirm == 'done') {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ReviewRating()));
                                                }
                                                setState(() {});
                                              },
                                              child: Text(
                                                widget.confirm != 'done'
                                                    ? 'Track Driver'
                                                    : 'End Trip',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container()),
              const SizedBox(
                height: 17,
              ),
              index == 1
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
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
                                        builder: (context) => OrderScreen(
                                              currentLocation:
                                                  _currentAddress.toString(),
                                            )));
                              },
                              text: 'Find Driver',
                              textcolor: Colors.white)),
                    )
                  : Container()
            ],
          ),
        ),
      );

  Widget _confirm() => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: phoneTextFieldColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  // height: 322,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      currentindex != 5
                          ? const SizedBox(
                              height: 31,
                            )
                          : Container(),
                      currentindex != 5
                          ? Row(
                              children: [
                                Text(
                                  'Select your Uber Taxi',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          : Container(),
                      currentindex != 5
                          ? Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Container(
                                height: 110,
                                width: 280,
                                child: SvgPicture.asset(
                                  'assets/images/Asset 2.svg',
                                ),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
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
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Seat Availability',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '4 Person',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Distance',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '6.3 kms',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '25 mins',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            currentindex != 5
                                ? Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'adaptation',
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          'Avaiable',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 17,
              ),
              currentindex != 5
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 56,
                            // width: 164,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: refusedColor)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 55),
                                child: Text(
                                  'refused',
                                  style: TextStyle(
                                      color: refusedColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                widget.confirm = 'null';

                                currentindex = 2;
                              });
                            },
                            child: Container(
                              height: 56,
                              // width: 164,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [prime1Color, prime2Color]),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 55),
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    builder: (context) => const ChatScreen()));
                          },
                          text: 'Chat With Driver',
                          textcolor: Colors.white),
                    )
            ],
          ),
        ),
      );

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    controller.setMapStyle(_mapStyle);
    _controller.complete(controller);
    // initMemoryClustering();
    _customInfoWindowController.googleMapController = controller;
    // if (widget.getLocation == true) {
    Position position = await _determinePosition();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14)));
    _getAddressFromLatLng(LatLng(position.latitude, position.longitude));
    setState(() {
      _currentlat = position.latitude;
      _currentlong = position.longitude;
      latlong = '$_currentlat,$_currentlong';
      // storage.write(key: "myLatLong", value: latlong);
    });

    // markers.clear();

    markers.add(Marker(
        markerId: const MarkerId("currentPinn"),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(position.latitude, position.longitude)));

    print(latlong);
    // }
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    await placemarkFromCoordinates(latLng.latitude, latLng.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = ' ${place.subAdministrativeArea}';
        // counrty = place.country.toString();
        // city = place.subAdministrativeArea.toString();
        // street = place.street.toString();

        // searchLocation = null;
        // mapLocation = LocationModel(
        //     id: 080900100,
        //     name: _currentAddress,
        //     latLong: "${latLng.latitude},${latLng.longitude}");
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

// Test if location services are enabled.

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else {
      // serviceEnabled = true;
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return Geolocator.getCurrentPosition();
  }

  void _observeLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 50,
      // timeLimit: Duration(seconds: 10),
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      _currentLocation = LatLng(position.latitude, position.longitude);
      print('1');

      setState(() {});
    });
  }
}
