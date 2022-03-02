import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:naouma/utils/constants.dart';
import 'package:naouma/utils/images.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("الملف الشخصي"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _profileImage(size.height),
              16.height,
              _infoContainer(theme),
              16.height,
              _infoContainer(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImage(
    double height,
  ) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 35),
          width: double.infinity,
          height: height * 0.25,
          child: Image.asset("name"),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CircleAvatar(
            backgroundImage: AssetImage(kDefaultProfileImage),
            backgroundColor: kPrimaryColor,
            radius: 35,
          ),
        ),
      ],
    );
  }

  Widget _infoContainer(ThemeData theme) {
    return Container(
      child: Column(
        children: [
          Text(
            "محمود عبدالمجيد",
          ),
          6.height,
          Text(
            "ID: 632145852",
          ),
          8.height,
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Text(
                  "LV.25",
                  style:
                      theme.textTheme.bodyText1.copyWith(color: Colors.white),
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "LV.25",
                        style: theme.textTheme.bodyText1
                            .copyWith(color: Colors.white),
                      ),
                      Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  )),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Row(children: [
                  Text(
                    "تركيا",
                    style:
                        theme.textTheme.bodyText1.copyWith(color: Colors.white),
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 16,
                  )
                ]),
              ),
            ],
          ),
          6.height,
          Row(
            children: [
              Text(
                "الوصف الوصف الوصف الوصف",
              ),
            ],
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("88"),
                  4.height,
                  Text("زار"),
                ],
              ),
              Column(
                children: [
                  Text("88"),
                  4.height,
                  Text("متابعة"),
                ],
              ),
              Column(
                children: [
                  Text("22"),
                  4.height,
                  Text("متابعين"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _personalInfo(double width) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text(
              "المعلومات الشخصية",
            ),
          ),
          16.height,
          Row(
            children: [
              SizedBox(
                width: width / 3,
                child: Text(""),
              ),
              SizedBox(
                width: width / 3 - 28,
                child: Text(""),
              )
            ],
          ),
          Divider(),
          10.height,
          Row(
            children: [
              SizedBox(
                width: width / 3,
                child: Text(""),
              ),
              SizedBox(
                width: width / 3 - 28,
                child: Text(""),
              )
            ],
          ),
          Divider(),
          10.height,
          Row(
            children: [
              SizedBox(
                width: width / 3,
                child: Text(""),
              ),
              SizedBox(
                width: width / 3 - 28,
                child: Text(""),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
