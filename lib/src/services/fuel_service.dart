import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_service.dart';
import 'package:my_pertamini/src/network/api_result.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';

import '../models/fuel.dart';

class FuelService extends CoreService {
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
}
