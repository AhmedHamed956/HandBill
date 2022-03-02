import 'package:flutter/material.dart';
import 'package:naouma/widgets/moment_list_item.dart';

class SuggestedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      padding: const EdgeInsets.all(6.0),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => MomentListItem(),
    );
  }
}
