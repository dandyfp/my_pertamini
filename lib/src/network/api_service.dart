import 'package:dio/dio.dart';
import 'package:my_pertamini/src/constans/config.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/models/detail_user.dart';
import 'package:my_pertamini/src/models/fuel.dart';
import 'package:my_pertamini/src/models/order.dart';
import 'package:my_pertamini/src/models/profile.dart';
import 'package:my_pertamini/src/models/transaction.dart';
import 'package:retrofit/http.dart';

import '../helpers/http_helper.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Config.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(HttpHelper().getDioInterceptorDio());
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("login")
  Future<CoreRes<Profile>> login(@Body() Map<String, dynamic> body);

  @GET("user")
  Future<CoreRes<DetailUser>> getUser();

  @GET("item-fuels")
  Future<CoreRes<List<Fuel>>> getFuels();

  @POST("create-order")
  Future<CoreRes> createOrder(
    @Body() Map<String, dynamic> body,
    @Query("id_user") String idUser,
    @Query("id_fuel") String idFuel,
  );

  @GET('my-order')
  Future<CoreRes<List<Order>>> getMyOrder();

  @POST("create-transaction")
  Future<CoreRes> createTransaction(@Body() Map<String, dynamic> body);

  @GET("my-transaction")
  Future<CoreRes<List<Transaction>>> getMytransaction();
}
