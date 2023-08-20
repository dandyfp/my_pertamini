import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/models/detail_user.dart';
import 'package:my_pertamini/src/models/transaction.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/transaction_service.dart';
import 'package:my_pertamini/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

class CartViewmodel extends FutureViewModel with CoreViewModel {
  final _userService = locator<UserService>();
  final _transactionService = locator<TransactionService>();

  List<Transaction> myTransaction = [];
  List<Transaction> allTransaction = [];
  DetailUser? user;

  @override
  Future futureToRun() => getUser();

  Future<ResultState<CoreRes<DetailUser>>> getUser() async {
    setBusy(true);
    var result = await _userService.getUser();
    setBusy(false);
    return result.when(success: (CoreRes<DetailUser> data) {
      user = data.data;
      getMyTransaction();
      getAllTransaction();
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? erroRes, NetworkExceptions error) {
      return ResultState.error(error: error);
    });
  }

  Future<ResultState<CoreRes<List<Transaction>>>> getMyTransaction() async {
    myTransaction.clear();
    var result = await _transactionService.fetchMyTransaction();
    return result.when(success: (CoreRes<List<Transaction>> data) {
      myTransaction.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  Future<ResultState<CoreRes<List<Transaction>>>> getAllTransaction() async {
    allTransaction.clear();
    var result = await _transactionService.fetchAllTransaction();
    return result.when(success: (CoreRes<List<Transaction>> data) {
      allTransaction.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }
}
