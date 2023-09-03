import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/services/transaction_service.dart';
import 'package:stacked/stacked.dart';

import '../../../core/core_res.dart';
import '../../../models/transaction.dart';
import '../../../network/network_exceptions.dart';
import '../../../network/result_state.dart';

class PosTransactionViewModel extends FutureViewModel with CoreViewModel {
  final _transactionService = locator<TransactionService>();
  @override
  Future futureToRun() => getAllTransaction();

  List<Transaction> allTransaction = [];

  Future<ResultState<CoreRes<List<Transaction>>>> getAllTransaction() async {
    setBusy(true);
    allTransaction.clear();
    var result = await _transactionService.fetchAllTransaction();
    setBusy(false);
    return result.when(success: (CoreRes<List<Transaction>> data) {
      allTransaction.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }
}
