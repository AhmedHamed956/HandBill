import 'package:flutter/material.dart';
import 'package:seven_rakeb_user/Shared/size_constant.dart';

import 'constant.dart';

Widget messageBubble(
    {required String chatContent,
    Color? color,
    Color? textColor,
    String? type}) {
  return Flexible(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              gradient: type == '1'
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        prime1Color,
                        prime2Color,
                      ],
                    )
                  : null,
              color: color,
              borderRadius: BorderRadius.circular(Sizes.dimen_12)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
                child: Text(chatContent,
                    style:
                        TextStyle(fontSize: Sizes.dimen_16, color: textColor)))
          ])));
}
