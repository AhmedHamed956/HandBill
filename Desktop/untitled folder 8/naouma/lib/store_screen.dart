import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naouma/models/room_data_model.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/utils/images.dart';
import 'package:naouma/utils/preferences_services.dart';
import 'package:naouma/view/details/details_screen.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = <String>["منضم اليها", "متابعة"];
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
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
                          left: 2.0, right: 2.0, top: 0.0, bottom: 0),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        // image: DecorationImage(
                        //   image: NetworkImage(
                        //       'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4bb82b72535211.5bead62fe26d5.jpg'),
                        //   //your image
                        //   fit: BoxFit.cover,
                        // ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      // child: HomeSlide(),
                    ),
                    // Align(
                    //   alignment: Alignment.center,
                    //   // child: _loadingRoom?Center(child: Container(width: 24, height:24,child: CircularProgressIndicator()),):_haveARoom?_myRoom(roomId, roomName, roomDesc):_createRoomSlide(theme),
                    //   child: StreamBuilder<QuerySnapshot>(
                    //     stream: _firestoreInstance
                    //         .collection('rooms')
                    //         .where("roomOwnerId",
                    //             isEqualTo:
                    //                 PreferencesServices.getString(ID_KEY))
                    //         .snapshots(),
                    //     builder: (BuildContext context,
                    //         AsyncSnapshot<QuerySnapshot> snapshot) {
                    //       if (snapshot.hasData &&
                    //           snapshot.data.docs.length > 0) {
                    //         return _myRoom(
                    //             snapshot.data.docs[0].id,
                    //             snapshot.data.docs[0]['roomName'],
                    //             snapshot.data.docs[0]['roomDesc']);
                    //       } else {
                    //         return _createRoomSlide(theme);
                    //       }
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                // bottom: AppBar(
                //   toolbarHeight: 50,
                //   backgroundColor: Colors.white,
                //   elevation: 4.0,
                //   title: TabBar(
                //     indicatorSize: TabBarIndicatorSize.label,
                //     indicatorColor: kPrimaryColor,
                //     indicatorWeight: 4.0,
                //     labelStyle: TextStyle(
                //         fontSize: 18.0, fontWeight: FontWeight.w700),
                //     //For Selected tab
                //     tabs:
                //         _tabs.map((String name) => Tab(text: name)).toList(),
                //   ),
                // ),
              ),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("aaaa"),
            Text("aaaa"),
            Text("aaaa"),
            Text("aaaa"),
          ],
        ),
      ),
    );
  }
}
