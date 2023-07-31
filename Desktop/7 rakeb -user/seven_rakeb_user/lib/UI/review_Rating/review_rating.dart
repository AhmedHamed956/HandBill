import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_rakeb_user/UI/home/home_Screen.dart';

import '../../Shared/component.dart';
import '../../Shared/constant.dart';

class ReviewRating extends StatefulWidget {
  const ReviewRating({super.key});

  @override
  State<ReviewRating> createState() => _ReviewRatingState();
}

class _ReviewRatingState extends State<ReviewRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackButton,
      body: ListView(
        children: [
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      index: 0,
                                    )));
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
                        'wirte review',
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
                height: 43,
              ),
              Container(
                // height: 107,
                // width: 107,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.5, color: prime1Color)),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 52.0,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/Ellipse 256.png'),
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
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '+91 8606722845',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    SizedBox(
                        height: 13,
                        child: VerticalDivider(
                            thickness: 1,
                            // width: 20,
                            color: Colors.white.withOpacity(0.6))),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    Text(
                      'paulmartin@gmail.com',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              RatingBarIndicator(
                  itemPadding: EdgeInsets.symmetric(horizontal: 5),
                  rating: 2.0,
                  // double.tryParse(model.commissionRate ?? '0.0') ??
                  //     0.0,
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 32,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 32,
                      width: 32,
                      child: SvgPicture.asset(
                        'assets/images/Star 2.svg',
                      ),
                    );
                  }),
              SizedBox(
                height: 43,
              ),
              Container(
                height: 174,
                width: 335,
                decoration: BoxDecoration(
                    color: phoneTextFieldColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
                  child: Container(
                    height: 20,
                    width: 300,
                    child: TextField(
                        // focusNode: focusNode,
                        textInputAction: TextInputAction.send,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        // controller: textEditingController,
                        maxLines: null,
                        onSubmitted: (value) {
                          // onSendMessage(
                          //     textEditingController.text, MessageType.text);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write Your Review',
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 60,
                ),
                child: Container(
                    child: DefultgridentButton(
                        height: 56,
                        width: 335,
                        fontsize: 15,
                        color1: prime1Color,
                        color2: prime2Color,
                        function: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                        index: 0,
                                      )));
                        },
                        text: 'Send',
                        textcolor: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
