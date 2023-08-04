import 'package:dio/dio.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_service.dart';
import 'package:my_pertamini/src/helpers/http_helper.dart';
import 'package:my_pertamini/src/network/api_result.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/services/request/register_req.dart';
import 'package:stacked/stacked_annotations.dart';

import '../constans/config.dart';

@LazySingleton()
class AuthService extends CoreService {
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
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        coreRes: NetworkExceptions.getErrorRes(e),
      );
    }
  }

  Future<ApiResult<CoreRes>> register({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  }) async {
    try {
      var dio = Dio();
      dio.interceptors.add(HttpHelper().getDioInterceptorDio());
      var formData = RegisterRed(
        email: email,
        password: password,
        name: name,
        confirmPassword: confirmPassword,
      ).toJson();
      final response = await dio.post(
        "${Config.baseUrl}register",
        data: formData,
      );
      CoreRes data = CoreRes.fromJson(response.data, (json) => null);
      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }
}
