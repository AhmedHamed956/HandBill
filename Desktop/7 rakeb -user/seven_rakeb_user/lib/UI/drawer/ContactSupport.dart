import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../Shared/component.dart';
import '../../Shared/constant.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackButton,
      body: ListView(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  // height: 300,
                  child: Image.asset(
                    'assets/images/placeholder.png',
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 70,
                child: Column(
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
                              Navigator.pop(context);
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
                              'Contact support',
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
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Row(
                        children: [
                          Text(
                            'Contact support',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 260),
                                child: Center(
                                  child: Text(
                                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id es',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 260),
                                child: Center(
                                  child: Text(
                                    'ELorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 260,
                                child: Divider(
                                  height: 2,
                                  color: prime1Color.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 37,
                          ),
                          const rowWidget(
                            image: 'assets/images/Calling.svg',
                            name: '(603) 555-0123',
                            support: 'true',
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const rowWidget(
                            name: 'vuhaithuongnute@gmail.com',
                            image: 'assets/images/Message.svg',
                            support: 'true',
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const rowWidget(
                            name: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                            image: 'assets/images/location.svg',
                            support: 'true',
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/mingcute_facebook-line.svg',
                            color: prime1Color,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 19,
                          ),
                          SvgPicture.asset(
                            'assets/images/iconoir_instagram.svg',
                            color: prime1Color,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 19,
                          ),
                          SvgPicture.asset(
                            'assets/images/basil_twitter-outline.svg',
                            color: prime1Color,
                            height: 24,
                            width: 24,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
