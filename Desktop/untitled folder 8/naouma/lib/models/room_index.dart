class CategoriesModel {
  List<Roomdata> data;
  Null message;
  int status;

  CategoriesModel({this.data, this.message, this.status});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Roomdata>[];
      json['data'].forEach((v) {
        data.add(new Roomdata.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
}

class Roomdata {
  int id;
  String roomName;
  String roomDesc;
  String roomBackground;
  int roomOwner;
  String createdAt;
  String updatedAt;
  Null password;
  int countMics;
  int countSupervisor;
  Null lockId;
  int countUsersIntoRoom;
  String backgroundUrl;
  List<Mics> mics;

  Roomdata(
      {this.id,
      this.roomName,
      this.roomDesc,
      this.roomBackground,
      this.roomOwner,
      this.createdAt,
      this.updatedAt,
      this.password,
      this.countMics,
      this.countSupervisor,
      this.lockId,
      this.countUsersIntoRoom,
      this.backgroundUrl,
      this.mics});

  Roomdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['room_name'];
    roomDesc = json['room_desc'];
    roomBackground = json['room_background'];
    roomOwner = json['room_owner'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    password = json['password'];
    countMics = json['countMics'];
    countSupervisor = json['countSupervisor'];
    lockId = json['lock_id'];
    countUsersIntoRoom = json['countUsersIntoRoom'];
    backgroundUrl = json['background_url'];
    if (json['mics'] != null) {
      mics = <Mics>[];
      json['mics'].forEach((v) {
        mics.add(new Mics.fromJson(v));
      });
    }
  }
}

class Mics {
  int id;
  int roomId;
  int micNumber;
  bool status;
  bool isLocked;
  int roomOwnerId;
  Null micUserId;
  String createdAt;
  String updatedAt;

  Mics(
      {this.id,
      this.roomId,
      this.micNumber,
      this.status,
      this.isLocked,
      this.roomOwnerId,
      this.micUserId,
      this.createdAt,
      this.updatedAt});

  Mics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomId = json['room_id'];
    micNumber = json['mic_number'];
    status = json['status'];
    isLocked = json['is_locked'];
    roomOwnerId = json['room_owner_id'];
    micUserId = json['mic_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_id'] = this.roomId;
    data['mic_number'] = this.micNumber;
    data['status'] = this.status;
    data['is_locked'] = this.isLocked;
    data['room_owner_id'] = this.roomOwnerId;
    data['mic_user_id'] = this.micUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
