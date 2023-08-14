import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/models/transaction.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/transaction_service.dart';
import 'package:stacked/stacked.dart';

class CartViewmodel extends FutureViewModel with CoreViewModel {
  final _transactionService = locator<TransactionService>();

  List<Transaction> myTransaction = [];

  @override
  Future futureToRun() => getMyTransaction();

  Future<ResultState<CoreRes<List<Transaction>>>> getMyTransaction() async {
    var result = await _transactionService.fetchMyTransaction();
    return result.when(success: (CoreRes<List<Transaction>> data) {
      myTransaction.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }
}
