import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/models/detail_user.dart';
import 'package:my_pertamini/src/models/fuel.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/fuel_service.dart';
import 'package:my_pertamini/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

import '../../../network/network_exceptions.dart';

const String _userData = 'userDelayed';
const String _fuelData = 'fuelDelayed';

class HomeViewModel extends MultipleFutureViewModel with CoreViewModel {
  final _fuelService = locator<FuelService>();
  final _userSerice = locator<UserService>();

  bool get fetchUser => busy(_userData);
  bool get fetchFuel => busy(_fuelData);

  DetailUser? user;

  List<Fuel> fuels = [];

  @override
  Map<String, Future Function()> get futuresMap => {
        _userData: getUser,
        _fuelData: getFuel,
      };

  Future<ResultState<CoreRes<List<Fuel>>>> getFuel() async {
    var result = await _fuelService.fetchFuel();
    return result.when(success: (CoreRes<List<Fuel>> data) {
      fuels.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

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

  void showDetailOrderView(Fuel fuel, String idUser) => navigationService.navigateToDetailOrderView(idUser: idUser, fuel: fuel);
}
