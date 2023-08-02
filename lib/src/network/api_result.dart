import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_pertamini/src/core/core_res.dart';

import 'network_exceptions.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({
    CoreRes? coreRes,
    required NetworkExceptions error,
  }) = Failure<T>;
}
