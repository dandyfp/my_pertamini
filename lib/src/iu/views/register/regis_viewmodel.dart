import 'package:flutter/cupertino.dart';
import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/enum/snackbar_type.dart';
import 'package:stacked/stacked.dart';

import '../../../core/core_res.dart';
import '../../../network/network_exceptions.dart';
import '../../../network/result_state.dart';
import '../../../services/auth_service.dart';

class RegisViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();

  bool isObsecure = true;
  bool isObsecureConfimPass = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<ResultState<CoreRes>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    setBusy(true);
    var result = await _authService.register(
      email: email,
      password: password,
      name: name,
      confirmPassword: confirmPassword,
    );
    setBusy(false);
    return result.when(success: (CoreRes data) {
      _authService.snackBarService.showCustomSnackBar(
        variant: SnackbarType.success,
        message: data.message ?? '',
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? erroRes, NetworkExceptions error) {
      _authService.snackBarService.showCustomSnackBar(
        variant: SnackbarType.warning,
        message: erroRes?.message ?? 'gagal',
        duration: const Duration(seconds: 1),
      );
      return ResultState.error(error: error);
    });
  }
}
