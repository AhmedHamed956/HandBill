import 'package:flutter/material.dart';
import 'package:naouma/utils/constants.dart';

class MessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6.0),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: 12,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print("$index clicked..");
            },
            child: Container(
              margin: const EdgeInsets.all(6.0),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                color: Colors.white,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset("assets/images/Profile Image.png"),
                  backgroundColor: kPrimaryColor,
                  radius: 28,
                ),
                title: Text("احمد علي"),
                subtitle: Text(
                  "محتوي نصي محتوي نصي",
                  style: theme.textTheme.bodyText2
                      .copyWith(fontSize: 13, color: Colors.grey),
                  maxLines: 2,
                ),
                trailing: Text("منذ ١يوم"),
              ),
            ),
          );
        },
      ),
    );
  }
}
