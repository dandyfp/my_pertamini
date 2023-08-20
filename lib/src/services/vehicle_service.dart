import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_service.dart';
import 'package:my_pertamini/src/models/vehicle.dart';
import 'package:my_pertamini/src/network/api_result.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/services/request/vehicle_req.dart';

class VehicleService extends CoreService {
  Future<ApiResult<CoreRes>> createVehicle(VehicleReq req) async {
    try {
      Map<String, dynamic> body = VehicleReq(
        nameBrand: req.nameBrand,
        numberVehicle: req.numberVehicle,
        typeVehicle: req.typeVehicle,
        userId: req.userId,
      ).toJson();
      var result = await apiService.createVehicle(body);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e), coreRes: NetworkExceptions.getErrorRes(e));
    }
  }

  Future<ApiResult<CoreRes<Vehicle>>> fetchMyVehicle(String userId) async {
    try {
      var result = await apiService.getMyVehicle(userId);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e), coreRes: NetworkExceptions.getErrorRes(e));
    }
  }
}
