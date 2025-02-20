import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constant.dart';
import '../response/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @GET("/home")
  Future<HomeResponse> getHome();
}
