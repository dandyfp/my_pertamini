import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_service.dart';
import 'package:my_pertamini/src/network/api_result.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/services/request/fuel_req.dart';

import '../models/fuel.dart';

class FuelService extends CoreService {
  Future<ApiResult<CoreRes>> updateFuel({
    required FuelReq req,
    required String id,
  }) async {
    try {
      Map<String, dynamic> body = FuelReq(
        name: req.name,
        description: req.description,
        numberOktan: req.numberOktan,
        price: req.price,
        stock: req.stock,
      ).toJson();
      var result = await apiService.updateFuel(body, id);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        coreRes: NetworkExceptions.getErrorRes(e),
      );
    }
  }

  Future<ApiResult<CoreRes>> createFuel(FuelReq req) async {
    try {
      Map<String, dynamic> body = FuelReq(
        name: req.name,
        description: req.description,
        numberOktan: req.numberOktan,
        price: req.price,
        stock: req.stock,
      ).toJson();
      var result = await apiService.createFuel(body);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        coreRes: NetworkExceptions.getErrorRes(e),
      );
    }
  }

  Future<ApiResult<CoreRes<List<Fuel>>>> fetchFuel() async {
    try {
      var result = await apiService.getFuels();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        coreRes: NetworkExceptions.getErrorRes(e),
      );
    }
  }

  Future<ApiResult<CoreRes>> deteleFuel(String id) async {
    try {
      var result = await apiService.deleteFuel(id);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        coreRes: NetworkExceptions.getErrorRes(e),
      );
    }
  }

  Future<ApiResult<CoreRes<Fuel>>> detailFuel(String id) async {
    try {
      var result = await apiService.getDetailFuel(id);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        coreRes: NetworkExceptions.getErrorRes(e),
      );
    }
  }
}
