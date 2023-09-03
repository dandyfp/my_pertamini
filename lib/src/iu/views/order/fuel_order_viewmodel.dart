import 'package:flutter/material.dart';
import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/services/fuel_service.dart';
import 'package:stacked/stacked.dart';

import '../../../core/core_res.dart';
import '../../../models/fuel.dart';
import '../../../network/network_exceptions.dart';
import '../../../network/result_state.dart';

class FuelOrderViewModel extends FutureViewModel with CoreViewModel {
  final _fuelService = locator<FuelService>();

  final TextEditingController literController = TextEditingController();
  @override
  Future futureToRun() => getFuel();

  List<Fuel> fuels = [];

  int stok = 0;
  int allStok = 0;
  int bufferStok = 0;

  Future<ResultState<CoreRes<List<Fuel>>>> getFuel() async {
    fuels.clear();
    var result = await _fuelService.fetchFuel();
    return result.when(
      success: (CoreRes<List<Fuel>> data) {
        fuels.addAll(data.data ?? []);
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (CoreRes? errorRes, NetworkExceptions error) {
        return ResultState.error(error: error, errorRes: errorRes);
      },
    );
  }

  void showTransactionView() => navigationService.navigateToTransactionOrderView();
}
