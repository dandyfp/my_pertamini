import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/models/detail_user.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

import '../../../network/network_exceptions.dart';

const String _userData = 'userDelayed';

class HomeViewModel extends MultipleFutureViewModel with CoreViewModel {
  bool get fetchUser => busy(_userData);

  final _userSerice = locator<UserService>();

  DetailUser? user;

  @override
  Map<String, Future Function()> get futuresMap => {
        _userData: getUser,
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

  void showDetailOrderView() => navigationService.navigateToDetailOrderView();
}
