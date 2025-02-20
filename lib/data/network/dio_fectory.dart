import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/app_prefs.dart';
import '../../app/constant.dart';

const String applicationJson = "application/json";
const String contentType = "Content-Type";
const String accept = "Accept";
const String authorization = "Authorization";
const String defaultLanguage = "Language";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeOut = 60 * 1000; // 1 min
    String language = await _appPreferences.getAppLanguage();
    String token = await _appPreferences.getUserToken();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: token,
      defaultLanguage: language
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: Duration(milliseconds: timeOut),
        receiveTimeout: Duration(milliseconds: timeOut),
        headers: headers);

    if (kReleaseMode) {
      if (kDebugMode) {
        print("release mode no logs");
      }
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}