// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merchant_senbu/model/login.dart';
import 'package:merchant_senbu/services/API/Error.dart';
import 'package:merchant_senbu/services/API/api_service.dart';
import 'package:merchant_senbu/services/API/fetch.dart';

Future<Login> onLogin(String uname, String password) async {
  var body = {"act": "LOGIN", "un": uname, "up": password};
  try {
    var URL = API.login;
    final Response response = await fetch().post(URL, data: body);
    return Login.fromJson(response.data);
  } on DioException catch (e) {
    var error = validationError(e);
    return Login.dataError(error.errorCode, error.message);
  }
}
