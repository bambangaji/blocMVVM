// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merchant_senbu/services/API/api_service.dart';
import 'package:merchant_senbu/services/API/fetch.dart';

// Future<String> getCosplayer(dynamic data) async {
//   try {
//     var URL = API.getCosplayer;
//     final Response response = await fetch().post(URL, data: data);
//     print(jsonEncode(response.data['data']));
//     return Cosplayer.fromJson(response.data);
//   } on DioError catch (e) {
//     var error = validationError(e);
//     return Cosplayer.dataError(error.errorCode, error.message);
//   }
// }
