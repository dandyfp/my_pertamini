import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/core_res.dart';
import 'network_exceptions.dart';

part 'result_state.freezed.dart';

@Freezed()
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.data({required T data}) = Data<T>;

  const factory ResultState.error({
    required NetworkExceptions error,
    CoreRes? errorRes,
  }) = Error<T>;
}
