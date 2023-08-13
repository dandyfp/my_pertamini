import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/models/order.dart';
import 'package:my_pertamini/src/services/transaction_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../core/core_res.dart';
import '../../../models/detail_user.dart';
import '../../../network/network_exceptions.dart';
import '../../../network/result_state.dart';
import '../../../services/user_service.dart';

const String _userData = 'dataDelayed';
const String _orderData = 'orderDelayed';

class ProfileViewModel extends MultipleFutureViewModel with CoreViewModel {
  final _userSerice = locator<UserService>();
  final _transactionService = locator<TransactionService>();

  bool get fetchUser => busy(_userData);
  bool get fetchMyOrder => busy(_orderData);

  List<Order> myOrder = [];

  DetailUser? user;
  @override
  Map<String, Future Function()> get futuresMap => {
        _userData: getUser,
        _orderData: getMyOrder,
      };

  Future<ResultState<CoreRes<DetailUser>>> getUser() async {
    var result = await _userSerice.getUser();
    return result.when(success: (CoreRes<DetailUser> data) {
      user = data.data;
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? erroRes, NetworkExceptions error) {
      return ResultState.error(error: error);
    });
  }

  Future<ResultState<CoreRes<List<Order>>>> getMyOrder() async {
    var result = await _transactionService.fetchMyOrder();
    return result.when(success: (CoreRes<List<Order>> data) {
      myOrder.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  void showStatusOrderView({
    required String numberOktan,
    required String nameFuel,
    required Order dataOrder,
  }) =>
      navigationService.navigateToStatusOrderView(
        nameFuel: nameFuel,
        numberOktan: numberOktan,
        dataOrder: dataOrder,
      );
}
