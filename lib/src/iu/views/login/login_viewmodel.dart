import 'package:flutter/material.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService _authService = AuthService();

  Future<ResultState<CoreRes>> login({
    required String email,
    required String password,
    required BuildContext context,
    required String route,
  }) async {
    setBusy(true);
    var result = await _authService.login(email: email, password: password);
    setBusy(false);
    return result.when(success: (CoreRes data) {
      Navigator.pushNamed(context, route);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? erroRes, NetworkExceptions error) {
      return ResultState.error(error: error);
    });
  }
}
