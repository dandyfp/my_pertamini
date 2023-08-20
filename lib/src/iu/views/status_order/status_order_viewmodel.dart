import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/enum/snackbar_type.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/request/transaction_req.dart';
import 'package:my_pertamini/src/services/transaction_service.dart';
import 'package:my_pertamini/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

import '../../../models/detail_user.dart';

class StatusOrderViewModel extends FutureViewModel with CoreViewModel {
  final _transactionService = locator<TransactionService>();
  final _userService = locator<UserService>();

  DetailUser? user;

  @override
  Future futureToRun() => getUser();

  Future<ResultState<CoreRes<DetailUser>>> getUser() async {
    var result = await _userService.getUser();
    return result.when(success: (CoreRes<DetailUser> data) {
      user = data.data;
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? erroRes, NetworkExceptions error) {
      return ResultState.error(error: error);
    });
  }

  Future<ResultState<CoreRes>> createTransaction(TransactionReq req) async {
    setBusy(true);
    var result = await _transactionService.createTransaction(req);
    setBusy(false);
    return result.when(success: (CoreRes data) {
      back();
      _transactionService.snackBarService.showCustomSnackBar(
        message: data.message ?? '',
        variant: SnackbarType.success,
      );
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      _transactionService.snackBarService.showCustomSnackBar(
        message: errorRes?.message ?? '',
        variant: SnackbarType.success,
      );
      notifyListeners();
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  Future<ResultState<CoreRes>> updateStatusOrder({
    required String id,
    required String status,
  }) async {
    var result = await _transactionService.updateStatus(id: id, status: status);
    return result.when(success: (CoreRes data) {
      back();
      _transactionService.snackBarService.showCustomSnackBar(
        message: data.message ?? '',
        variant: SnackbarType.success,
      );
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      _transactionService.snackBarService.showCustomSnackBar(
        message: errorRes?.message ?? '',
        variant: SnackbarType.success,
      );
      notifyListeners();
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }
}
