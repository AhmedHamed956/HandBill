import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naouma/models/room_data_model.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/utils/images.dart';
import 'package:naouma/utils/preferences_services.dart';
import 'package:naouma/view/details/details_screen.dart';

import 'home_tab/common_rooms_view.dart';
import 'myroom/create_room_screen.dart';
import 'myroom/my_rooms_view.dart';

class MyRoomTab extends StatefulWidget {
  @override
  _MyRoomTabState createState() => _MyRoomTabState();
}

class _MyRoomTabState extends State<MyRoomTab> {
  final _firestoreInstance = FirebaseFirestore.instance;

  bool _haveARoom = false;
  bool _loadingRoom = true;
  List<RoomDataModel> _myRooms = [];
  String roomId;
  String roomName;
  String roomDesc;

  @override
  void initState() {
    // TODO: implement initState
    getMyRoom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = <String>["منضم اليها", "متابعة"];
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  expandedHeight: size.height * 0.22,
                  floating: true,
                  pinned: true,
                  snap: false,
                  backgroundColor: Colors.grey.shade300,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 2.0, right: 2.0, top: 2.0, bottom: 50),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // image: DecorationImage(
                          //   image: NetworkImage(
                          //       'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4bb82b72535211.5bead62fe26d5.jpg'),
                          //   //your image
                          //   fit: BoxFit.cover,
                          // ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        // child: HomeSlide(),
                      ),
                      Align(
                        alignment: Alignment.center,
                        // child: _loadingRoom?Center(child: Container(width: 24, height:24,child: CircularProgressIndicator()),):_haveARoom?_myRoom(roomId, roomName, roomDesc):_createRoomSlide(theme),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: _firestoreInstance
                              .collection('rooms')
                              .where("roomOwnerId",
                                  isEqualTo:
                                      PreferencesServices.getString(ID_KEY))
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData &&
                                snapshot.data.docs.length > 0) {
                              return _myRoom(
                                  snapshot.data.docs[0].id,
                                  snapshot.data.docs[0]['roomName'],
                                  snapshot.data.docs[0]['roomDesc']);
                            } else {
                              return _createRoomSlide(theme);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  bottom: AppBar(
                    toolbarHeight: 50,
                    backgroundColor: Colors.white,
                    elevation: 4.0,
                    title: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: kPrimaryColor,
                      indicatorWeight: 4.0,
                      labelStyle: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700),
                      //For Selected tab
                      tabs:
                          _tabs.map((String name) => Tab(text: name)).toList(),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            MyRoomsView(),
            CommonRoomsView(),
          ]),
        ),
      ),
    );
  }

  Widget _createRoomSlide(var theme) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          print("create room clicked");
          Get.to(CreateRoomScreen());
        },
        child: Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 52),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 28,
                ),
                radius: 30,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "إنشاء غرفة",
                      style: theme.textTheme.bodyText1.copyWith(fontSize: 16.0),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "ابدأ رحلتك فى نعومة !",
                      style: theme.textTheme.bodyText2.copyWith(fontSize: 15.0),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.flag,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getMyRoom() async {
    QuerySnapshot querySnapshot = await _firestoreInstance
        .collection('rooms')
        .where("roomOwnerId", isEqualTo: PreferencesServices.getString(ID_KEY))
        .get();
    print(querySnapshot.docs.length);
    if (querySnapshot.docs.length > 0) {
      print("_haveARoom: $_haveARoom");
      print("in it...");
      // querySnapshot.docs.forEach((document) {
      //     print(document.data);
      //     // Map<String, dynamic> json = document.data(); //casts, but if you put breaklines through this its that _InternalLinkedHashMap<dynamic, dynamic> type
      //     RoomDataModel myRoomDataModel = new RoomDataModel.fromJson(document.data());
      //     _myRooms.add(myRoomDataModel);
      //   });

      setState(() {
        roomId = querySnapshot.docs[0].id;
        roomName = querySnapshot.docs[0]['roomName'];
        roomDesc = querySnapshot.docs[0]['roomDesc'];
        _haveARoom = true;
        _loadingRoom = false;
      });
    } else {
      setState(() {
        _haveARoom = false;
        _loadingRoom = false;
      });
      print("_haveARoom: $_haveARoom");
    }
  }

  Widget _myRoom(String roomId, String roomName, String roomDesc) {
    return GestureDetector(
      onTap: () {
        print("roomDetails");
        Get.to(DetailsScreen(
          roomId: roomId,
          roomName: roomName,
          roomDesc: roomDesc,
          roomOwnerId: PreferencesServices.getString(ID_KEY),
        ));
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 52),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: Image.asset(kDefaultProfileImage),
                radius: 35,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      roomName,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      roomDesc,
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
