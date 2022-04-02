// To parse this JSON data, do
//
//     final LoginInfoe = LoginInfoeFromJson(jsonString);

import 'dart:convert';

LoginInfo LoginInfoFromJson(String str) => LoginInfo.fromJson(json.decode(str));

String LoginInfoToJson(LoginInfo data) => json.encode(data.toJson());

class LoginInfo {
  LoginInfo({
    this.status,
    this.message,
    required this.data,
  });

  String? status;
  String? message;
  List<UserDetails> data;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
    status: json["status"],
    message: json["message"],
    data: List<UserDetails>.from(json["data"].map((x) => UserDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UserDetails {
  UserDetails({
    this.userId,
    this.userName,
    this.userPhone,
    this.userEmail,
    this.deviceId,
    this.userImage,
    this.userPassword,
    this.otpValue,
    this.status,
    this.wallet,
    this.rewards,
    this.isVerified,
    this.block,
    this.regDate,
    this.userType
  });

  int? userId;
  String? userName;
  String? userPhone;
  String? userType;
  String? userEmail;
  dynamic deviceId;
  String? userImage;
  String? userPassword;
  String? otpValue;
  int? status;
  int? wallet;
  int? rewards;
  int? isVerified;
  int? block;
  DateTime? regDate;


  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    userId: json["user_id"],
    userName: json["user_name"],
    userPhone: json["user_phone"],
    userEmail: json["user_email"],
    deviceId: json["device_id"],
    userImage: json["user_image"],
    userPassword: json["user_password"],
    otpValue: json["otp_value"],
    status: json["status"],
    wallet: json["wallet"],
    rewards: json["rewards"],
    isVerified: json["is_verified"],
    block: json["block"],
    regDate: DateTime.parse(json["reg_date"]),
    userType: json["user_type"]
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "user_phone": userPhone,
    "user_email": userEmail,
    "device_id": deviceId,
    "user_image": userImage,
    "user_password": userPassword,
    "otp_value": otpValue,
    "status": status,
    "wallet": wallet,
    "rewards": rewards,
    "is_verified": isVerified,
    "block": block,
    "reg_date": regDate?.toIso8601String(),
    "user_type":userType
  };
}