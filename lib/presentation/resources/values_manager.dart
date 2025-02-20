
class AppValues {
  static const double v0 = 0;
  static const double v1 = 1;
  static const double v1_5 = 1.5;
  static const double v2 = 2;
  static const double v3 = 3;
  static const double v4 = 4.0;
  static const double v5 = 5;
  static const double v8 = 8.0;
  static const double v9 = 9.0;
  static const double v10 = 10;
  static const double v12 = 12.0;
  static const double v14 = 14.0;
  static const double v15 = 15.0;
  static const double v16 = 16.0;
  static const double v18 = 18.0;
  static const double v20 = 20.0;
  static const double v28 = 28.0;
  static const double v30 = 30.0;
  static const double v35 = 35.0;
  static const double v40 = 40.0;
  static const double v50 = 50.0;
  static const double v60 = 60.0;
  static const double v70 = 70.0;
  static const double v80 = 80.0;
  static const double v100 = 100.0;
  static const double v130 = 130.0;
  static const double v140 = 140.0;
  static const double v150 = 150.0;
  static const double v200 = 200.0;
  static const double v220 = 220.0;
  static const double v300 = 300.0;
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unAuthorised = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int unknown = -1;
  static const int connectTimeOut = -2;
  static const int cancel = -3;
  static const int receiveTimeOut = -4;
  static const int sendTimeOut = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
  static const int badCertificate = -8;
  static const int connectionError = -9;
   static const int defaultError = -10;
}
class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}