import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naouma/models/room_index.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/widgets/my_rooms_item.dart';
import 'package:naouma/models/room_data_model.dart';

import '../../homeCubit.dart';
import '../../states.dart';

class NewRoomsView extends StatelessWidget {
  final RoomDataModel roomData;
  const NewRoomsView({Key key, this.roomData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            child: FutureBuilder(
              future: HomeCubit.get(context).getCategory(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (HomeCubit.get(context).categoriesModel.data == null) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemBuilder: (context, index) => buildCatItem(
                          HomeCubit.get(context).categoriesModel.data[index]),
                      itemCount:
                          HomeCubit.get(context).categoriesModel.data.length);
                }
              },
            ),
          );

          // return ListView.separated(
          //     itemBuilder: (context, index) => buildCatItem(
          //         HomeCubit.get(context).categoriesModel.data[index]),
          //     separatorBuilder: (context, index) => Divider(),
          //     itemCount: HomeCubit.get(context).categoriesModel.data.length);
        });
  }

  buildCatItem(Roomdata model) => Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          top: true,
          bottom: false,
          child: GestureDetector(
            // onTap: ()=> Get.to(DetailsScreen(roomData: roomData,), duration: Duration(milliseconds: 1000), transition: Transition.leftToRightWithFade),
            child: Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(8.0)),
                        child: Image.asset(
                          "assets/images/item_image.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // _sizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // _sizedBox(height: 10),
                            Row(children: [
                              Icon(Icons.flag),
                              _sizedBox(width: 4.0),
                              Expanded(
                                  child: Text(
                                model.roomName,
                                maxLines: 1,
                                // style: theme.textTheme.bodyText1
                                // .copyWith(color: Colors.black, fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              )),
                            ]),
                            _sizedBox(height: 6),
                            Row(
                              children: [
                                Icon(
                                  Icons.queue_music,
                                  size: 20,
                                ),
                                _sizedBox(width: 6.0),
                                Container(
                                  // height: 30,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Text(
                                    "موسيقى",
                                    // style: theme.textTheme.bodyText2
                                    //     .copyWith(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            _sizedBox(height: 8),
                            Text(
                              model.roomDesc,
                              maxLines: 1,
                              // style: theme.textTheme.bodyText2.copyWith(
                              //     color: Colors.grey.shade600, fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                            // _sizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.queue_music,
                              size: 20,
                            ),
                            Icon(
                              Icons.perm_identity_sharp,
                              size: 20,
                            ),
                            Text(
                              model.id.toString(),
                              maxLines: 1,
                              // style: theme.textTheme.bodyText2.copyWith(
                              //     color: Colors.grey.shade600, fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        // _sizedBox(height: 8),
                        // Row(
                        //   children: [
                        //     Icon(Icons.queue_music),
                        //     Icon(Icons.perm_identity_sharp),
                        //   ],
                        // ),
                      ],
                    ),
                    _sizedBox(width: 10),
                  ],
                )),
          ),
        ),
      );
  Widget _sizedBox({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
