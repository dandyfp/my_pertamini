import 'package:dio/dio.dart';
import 'package:my_pertamini/src/constans/config.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/models/detail_user.dart';
import 'package:my_pertamini/src/models/profile.dart';
import 'package:retrofit/http.dart';

import '../helpers/http_helper.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Config.baseUrlAndro)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(HttpHelper().getDioInterceptorDio());
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("login")
  Future<CoreRes<Profile>> login(@Body() Map<String, dynamic> body);

  @GET("user")
  Future<CoreRes<DetailUser>> getUser();
}
