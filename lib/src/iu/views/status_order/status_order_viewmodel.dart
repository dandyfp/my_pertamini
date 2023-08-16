import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/enum/snackbar_type.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/request/transaction_req.dart';
import 'package:my_pertamini/src/services/transaction_service.dart';
import 'package:stacked/stacked.dart';

class StatusOrderViewModel extends BaseViewModel with CoreViewModel {
  final _transactionService = locator<TransactionService>();

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
}
