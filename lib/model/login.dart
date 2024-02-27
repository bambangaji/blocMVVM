// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Status status;
  Data? data;

  Login({
    required this.status,
    this.data,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
      status: Status.fromJson(json["status"]),
      data: (json["data"] != null) ? Data.fromJson(json["data"]) : null);

  Map<String, dynamic> toJson() =>
      {"status": status.toJson(), "data": data?.toJson()};

  factory Login.dataError(int errorCode, String message) => Login(
        data: Data.onError(),
        status: Status.onError(errorCode, message),
      );
}

class Data {
  User user;

  Data({
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
  factory Data.onError() => Data(user: User.onError());
}

class User {
  String userId;
  String language;
  String fullName;
  String phone;
  String emailAddress;
  String role;
  String designation;
  String outletId;

  User({
    required this.userId,
    required this.language,
    required this.fullName,
    required this.phone,
    required this.emailAddress,
    required this.role,
    required this.designation,
    required this.outletId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        language: json["language"],
        fullName: json["full_name"],
        phone: json["phone"],
        emailAddress: json["email_address"],
        role: json["role"],
        designation: json["designation"],
        outletId: json["outlet_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "language": language,
        "full_name": fullName,
        "phone": phone,
        "email_address": emailAddress,
        "role": role,
        "designation": designation,
        "outlet_id": outletId,
      };
  factory User.onError() => User(
        userId: "",
        language: "",
        fullName: "",
        phone: "",
        emailAddress: "",
        role: "",
        designation: "",
        outletId: "",
      );
}

class Status {
  int error;
  bool? login;
  String? userId;
  String? role;
  String? apiVer;
  String? devDebugParam;

  Status({
    required this.error,
    this.login,
    this.userId,
    this.role,
    this.apiVer,
    this.devDebugParam,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        error: json["error"],
        login: json["login"],
        userId: json["user_id"],
        role: json["role"],
        apiVer: json["api-ver"],
        devDebugParam: json["dev-debug-param"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "login": login,
        "user_id": userId,
        "role": role,
        "api-ver": apiVer,
        "dev-debug-param": devDebugParam,
      };
  factory Status.onError(int errorCode, String message) => Status(
        error: errorCode,
        login: false,
        userId: "",
        role: "",
        apiVer: "",
        devDebugParam: "",
      );
}
