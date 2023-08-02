import 'package:dio/dio.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/helpers/http_helper.dart';
import 'package:my_pertamini/src/network/api_result.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';

import '../constans/config.dart';

class AuthService {
  Future<ApiResult<CoreRes>> login({
    required String email,
    required String password,
  }) async {
    try {
      var dio = Dio();
      dio.interceptors.add(HttpHelper().getDioInterceptorDio());
      var formData = FormData.fromMap({
        'email': email,
        'password': password,
      });

      final response = await dio.post(
        "${Config.baseUrl}login",
        data: formData,
      );
      CoreRes data = CoreRes.fromJson(response.data, (json) => null);
      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<CoreRes>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var dio = Dio();
      dio.interceptors.add(HttpHelper().getDioInterceptorDio());
      var formData = FormData.fromMap({
        'email': email,
        'password': password,
        'name': name,
      });

      final response = await dio.post(
        "${Config.baseUrl}register",
        data: formData,
      );
      CoreRes data = CoreRes.fromJson(response.data, (json) => null);
      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
