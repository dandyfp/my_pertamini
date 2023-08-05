import 'package:flutter/material.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/enum/snackbar_type.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/auth_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

class LoginViewModel extends BaseViewModel with CoreViewModel {
  final AuthService _authService = locator<AuthService>();

  bool isObsecure = true;

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  void validate({
    required String email,
    required String password,
  }) {
    if (keyForm.currentState?.validate() ?? false) {
      login(
        email: email,
        password: password,
      );
      notifyListeners();
    }
  }

  Future<ResultState<CoreRes>> login({
    required String email,
    required String password,
  }) async {
    setBusy(true);
    var result = await _authService.login(email: email, password: password);
    setBusy(false);
    return result.when(success: (CoreRes data) {
      showHomeView();
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? erroRes, NetworkExceptions error) {
      _authService.snackBarService.showCustomSnackBar(
        message: erroRes?.message ?? '',
        variant: SnackbarType.warning,
      );
      return ResultState.error(error: error);
    });
  }

  void showHomeView() => navigationService.navigateToHomeView();

  void showRegisView() => navigationService.navigateToRegisView();
}
