import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/services/transaction_service.dart';
import 'package:stacked/stacked.dart';

import '../../../core/core_res.dart';
import '../../../models/order.dart';
import '../../../network/network_exceptions.dart';
import '../../../network/result_state.dart';

class PosDeliveryViewModel extends FutureViewModel with CoreViewModel {
  final _transactionService = locator<TransactionService>();
  @override
  Future futureToRun() => getAllOrder();

  List<Order> allOrder = [];

  Future<ResultState<CoreRes<List<Order>>>> getAllOrder() async {
    setBusy(true);
    allOrder.clear();
    var result = await _transactionService.fetchAllOrder();
    setBusy(false);
    return result.when(success: (CoreRes<List<Order>> data) {
      allOrder.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }
}
