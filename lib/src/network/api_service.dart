import 'package:dio/dio.dart';
import 'package:my_pertamini/src/constans/config.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/models/detail_user.dart';
import 'package:my_pertamini/src/models/fuel.dart';
import 'package:my_pertamini/src/models/order.dart';
import 'package:my_pertamini/src/models/profile.dart';
import 'package:my_pertamini/src/models/transaction.dart';
import 'package:my_pertamini/src/models/vehicle.dart';
import 'package:retrofit/http.dart';

import '../helpers/http_helper.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Config.baseUrlOnline)
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
    @Query("user_id") String idUser,
    @Query("id_fuel") String idFuel,
  );

  @GET('my-order')
  Future<CoreRes<List<Order>>> getMyOrder();

  @GET('my-order-received')
  Future<CoreRes<List<Order>>> getOrderReceiped();

  @GET('my-order-on-processed')
  Future<CoreRes<List<Order>>> getOrderOnProcess();

  @POST("create-transaction")
  Future<CoreRes> createTransaction(@Body() Map<String, dynamic> body);

  @GET("my-transaction")
  Future<CoreRes<List<Transaction>>> getMytransaction();

  @GET("all-transaction")
  Future<CoreRes<List<Transaction>>> getAlltransaction();

  @POST("create-vehicle")
  Future<CoreRes> createVehicle(@Body() Map<String, dynamic> body);

  @GET("my-vehicle")
  Future<CoreRes<Vehicle>> getMyVehicle(@Query("user_id") String userId);

  @POST("create-fuel")
  Future<CoreRes> createFuel(@Body() Map<String, dynamic> body);

  @DELETE("item-fuels-delete/{fuelId}")
  Future<CoreRes> deleteFuel(@Path("fuelId") String fuelId);

  @PUT("update-fuels/{fuelId}")
  Future<CoreRes> updateFuel(
    @Body() Map<String, dynamic> body,
    @Path("fuelId") String fuelId,
  );

  @GET("detail-fuel/{fuelId}")
  Future<CoreRes<Fuel>> getDetailFuel(@Path("fuelId") String fuelId);

  @PUT("update-status-order")
  Future<CoreRes> updateStatusOrder(@Body() Map<String, dynamic> body);
}
