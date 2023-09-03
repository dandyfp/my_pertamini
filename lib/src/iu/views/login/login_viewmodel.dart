import 'package:flutter/material.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/enum/snackbar_type.dart';
import 'package:my_pertamini/src/helpers/shared_preferences_helper.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/auth_service.dart';
import 'package:my_pertamini/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/detail_user.dart';

class LoginViewModel extends BaseViewModel with CoreViewModel {
  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObsecure = true;

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  DetailUser? user;

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
    return result.when(success: (CoreRes data) async {
      await getUser();
      showHomeView(user?.type ?? '');
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

  Future<ResultState<CoreRes<DetailUser>>> getUser() async {
    var result = await _userService.getUser();
    return result.when(success: (CoreRes<DetailUser> data) async {
      // data.data?.type == 'admin' ? isAdmin = true : false;
      await SharedPreferencesHelper().putString('role', data.data?.type ?? '');
      user = data.data;
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? erroRes, NetworkExceptions error) {
      return ResultState.error(error: error);
    });
  }

  void showHomeView(String admin) => navigationService.navigateToMainView(admin: admin);

  void showRegisView() => navigationService.navigateToRegisView();
}
