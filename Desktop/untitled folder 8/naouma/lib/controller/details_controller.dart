import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naouma/utils/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_channel.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart';
import 'package:agora_rtc_engine/rtc_remote_view.dart';

class DetailsController extends GetxController {
  TextEditingController _messageController = TextEditingController();
  TextEditingController get messageController => _messageController;

  static final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  RtcEngine _engine;
  String roomID;

  // // Init the app
  // Future<void> initPlatformState() async {
  //   // Get microphone permission
  //   await [Permission.microphone].request();
  //
  //   // Create RTC client instance
  //   RtcEngineContext context = RtcEngineContext(AppId);
  //   var engine = await RtcEngine.createWithContext(context);
  //   // Define event handling logic
  //   engine.setEventHandler(RtcEngineEventHandler(
  //       joinChannelSuccess: (String channel, int uid, int elapsed) {
  //         print('joinChannelSuccess ${channel} ${uid}');
  //           _joined = true;
  //           update();
  //       }, userJoined: (int uid, int elapsed) {
  //     print('userJoined ${uid}');
  //       _remoteUid = uid;
  //       update();
  //   }, userOffline: (int uid, UserOfflineReason reason) {
  //     print('userOffline ${uid}');
  //       _remoteUid = 0;
  //       update();
  //   }));
  //   // Join channel with channel name as 123
  //   await engine.joinChannel(token, '123', null, 0);
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // initialize agora sdk
    initialize();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    // clear users
    _users.clear();
    // destroy sdk
    _engine.leaveChannel();
    print("oncloseeeeee");
    _engine.destroy();
    super.onClose();
  }

  //  void leaveRoom(){
  //    _users.clear();
  //   // destroy sdk
  //   _engine.leaveChannel();
  //   _engine.destroy();
  //   print("oncloseeeeee");
  //   super.dispose();
  //   Navigator.pop(context);
  // }

  Future<void> initialize() async {
    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await _engine.joinChannel(
        "00698657cf49a914ad68d30cb93f0d1f578IABEhHTkG4WidHJ5ZNQ7KEqLzJlVatW9BMlFOtpvXE+68ZtRn3IAAAAAEACLgpZhVpcrYQEAAQBXlyth",
        "room",
        null,
        0);
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(AppId);
    await _engine.enableAudio();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
  }

  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(
      error: (code) {
        print('onError: $code');
        update();
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        print('onJoinChannel: $channel, uid: $uid');
        update();
      },
      leaveChannel: (stats) {
        print('onLeaveChannel');
        _users.clear();
        update();
      },
      userJoined: (uid, elapsed) {
        print('userJoined: $uid');
        _users.add(uid);
        update();
      },
    ));
  }

//   Future<void> initialize() async {
//     print("initialized audio started...");
//     await _handleCameraAndMic(Permission.camera);
//     await _handleCameraAndMic(Permission.microphone);
//     if (AppId.isEmpty) {
//         _infoStrings.add(
//           'APP_ID missing, please provide your APP_ID in settings.dart',
//         );
//         _infoStrings.add('Agora Engine is not starting');
//       update();
//       return;
//     }
//     await _initAgoraRtcEngine();
//     _addAgoraEventHandlers();
//     await _engine.joinChannel(null, roomID, null, 0);
//   }

//   Future<void> _handleCameraAndMic(Permission permission) async {
//     final status = await permission.request();
//     print(status);
//   }

//   Future<void> _initAgoraRtcEngine() async {
//     _engine = await RtcEngine.create(AppId);
//     await _engine.enableAudio();
//   }

//   void _addAgoraEventHandlers() {
//     _engine.setEventHandler(RtcEngineEventHandler(
//       error: (code) {
//           final info = 'onError: $code';
//           _infoStrings.add(info);
//         update();
//       },
//       joinChannelSuccess: (channel, uid, elapsed) {

//           final info = 'onJoinChannel: $channel, uid: $uid';
//           _infoStrings.add(info);
//         update();
//       },
//       leaveChannel: (stats) {

//           _infoStrings.add('onLeaveChannel');
//           _users.clear();
//         update();
//       },
//       userJoined: (uid, elapsed) {
//           final info = 'userJoined: $uid';
//           _infoStrings.add(info);
//           _users.add(uid);
//           update();
//       },
//       userOffline: (uid, reason) {
//         final info = 'userOffline: $uid , reason: $reason';
//         _infoStrings.add(info);
//         _users.remove(uid);
//         update();
//       },
//       firstRemoteVideoFrame: (uid, width, height, elapsed) {
//         final info = 'firstRemoteVideoFrame: $uid';
//         _infoStrings.add(info);
//         update();
//       },
//     ));
//   }
}
