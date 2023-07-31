import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:seven_rakeb_user/Shared/constant.dart';
import 'package:seven_rakeb_user/UI/home/home_Screen.dart';

import '../../Shared/size_constant.dart';
import '../../Shared/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // focusNode.addListener(onFocusChanged);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackButton,
        // appBar: AppBarWidget(label: S.current.chat),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                child: Column(children: [
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
                                          confirm: 'done',
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
                            'Chat',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 93,
                    decoration: BoxDecoration(
                        color: phoneTextFieldColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              'assets/images/Photo Profile.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 22, horizontal: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Dianne Russell',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 1,
                                      ),
                                      child: Container(
                                        height: 7,
                                        width: 7,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: greenDot),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Container(
                                      child: Text(
                                        'Online',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  buildListMessage(),
                  buildMessageInput()
                ]))));
  }

  Widget buildListMessage() {
    return Flexible(
      child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: 3,
          // reverse: true,
          controller: scrollController,
          itemBuilder: (context, index) => buildItem(
                index,
              ),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 2)),
    );
  }

  Widget buildMessageInput() {
    return Container(
        width: double.infinity,
        height: 74,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(children: [
          Flexible(
              child: Container(
                  decoration: BoxDecoration(
                    color: phoneTextFieldColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: TextField(
                        focusNode: focusNode,
                        textInputAction: TextInputAction.send,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        controller: textEditingController,
                        maxLines: null,
                        onSubmitted: (value) {
                          // onSendMessage(
                          //     textEditingController.text, MessageType.text);
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Your Message',
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            suffixIcon: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                      icon: const Icon(Icons.attach_file,
                                          color: prime1Color),
                                      onPressed: () {})
                                ]))),
                  ))),
        ]));
  }

  Widget buildItem(int index) {
    if (index % 2 == 0) {
      // right side (my message)
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          // chatMessages.type == MessageType.text
          // ?
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: messageBubble(
                // color: phoneTextFieldColor,
                textColor: Colors.white,
                type: '1',
                chatContent: 'Just to order'),
          )
          // : chatMessages.type == MessageType.image
          //     ? Container(
          //         margin: const EdgeInsets.only(
          //             right: Sizes.dimen_10,
          //             top: Sizes.dimen_8,
          //             bottom: Sizes.dimen_8),
          //         child: chatImage(
          //             imageSrc: chatMessages.content,
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => FullImageView(
          //                             url: chatMessages.content,
          //                           )));
          //             }))
          // : const SizedBox.shrink(),
          // isMessageSent(index)
          //     ? Image.asset('assets/icons/chat/chat_ic.png',
          //         height: 35, width: 35)
          //     : Container(width: 35)
        ]),
        // isMessageSent(index)
        //     ? Container(
        //         margin: const EdgeInsets.only(
        //             right: Sizes.dimen_50,
        //             top: Sizes.dimen_6,
        //             bottom: Sizes.dimen_8),
        //         child: Text(
        //             DateFormat('dd MMM yyyy, hh:mm a').format(
        //                 DateTime.fromMillisecondsSinceEpoch(
        //                     int.parse(chatMessages.timestamp))),
        //             style: const TextStyle(
        //                 color: textColor,
        //                 fontSize: Sizes.dimen_12,
        //                 fontStyle: FontStyle.italic)))
        //     : const SizedBox.shrink()
      ]);
    } else {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          // isMessageReceived(index)
          //     ? Image.asset('assets/icons/chat/chat_ic.png',
          //         height: 35, width: 35)
          //     : Container(width: 35),
          // chatMessages.type == MessageType.text
          // ?
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: messageBubble(
                color: phoneTextFieldColor,
                textColor: Colors.white.withOpacity(0.8),
                chatContent: 'Okay, for what level of spiciness?'),
          )
          // :
          // chatMessages.type == MessageType.image
          //     ? Container(
          //         margin: const EdgeInsets.only(
          //             left: Sizes.dimen_10,
          //             top: Sizes.dimen_8,
          //             bottom: Sizes.dimen_8),
          //         child: chatImage(
          //             imageSrc: chatMessages.content,
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => FullImageView(
          //                             url: chatMessages.content,
          //                           )));
          //             }))
          //     : const SizedBox.shrink()
        ]),
        // isMessageReceived(index)
        // ?
        // Container(
        //     margin: const EdgeInsets.only(
        //         left: Sizes.dimen_50,
        //         top: Sizes.dimen_6,
        //         bottom: Sizes.dimen_8),
        //     child: Text(
        //         DateFormat('dd MMM yyyy, hh:mm a').format(
        //             DateTime.fromMillisecondsSinceEpoch(
        //                 int.parse(chatMessages.timestamp))),
        //         style: const TextStyle(
        //             color: textColor,
        //             fontSize: Sizes.dimen_12,
        //             fontStyle: FontStyle.italic)))
        // : const SizedBox.shrink()
      ]);
    }
  }
}
