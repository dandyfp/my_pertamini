import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_service.dart';
import 'package:my_pertamini/src/models/detail_user.dart';
import 'package:my_pertamini/src/network/api_result.dart';

import '../network/network_exceptions.dart';

class UserService extends CoreService {
  Future<ApiResult<CoreRes<DetailUser>>> getUser() async {
    try {
      var result = await apiService.getUser();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }
}
