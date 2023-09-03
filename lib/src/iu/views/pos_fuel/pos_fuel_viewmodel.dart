import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/services/fuel_service.dart';
import 'package:stacked/stacked.dart';

import '../../../core/core_res.dart';
import '../../../models/fuel.dart';
import '../../../models/transaction.dart';
import '../../../network/network_exceptions.dart';
import '../../../network/result_state.dart';
import '../../../services/transaction_service.dart';

const String _dataFuel = 'delayedFuel';

class PosFuelViewModel extends MultipleFutureViewModel with CoreViewModel {
  final _fuelService = locator<FuelService>();
  final _transactionService = locator<TransactionService>();

  bool get fetchFuel => busy(_dataFuel);
  @override
  Map<String, Future Function()> get futuresMap => {
        _dataFuel: getFuel,
      };

  List<Fuel> fuels = [];
  List<Transaction> allTransaction = [];
  int stok = 0;
  int allStok = 0;
  int bufferStok = 0;
  String nameFuel = "";

  Future<ResultState<CoreRes<List<Fuel>>>> getFuel() async {
    fuels.clear();
    var result = await _fuelService.fetchFuel();
    return result.when(
      success: (CoreRes<List<Fuel>> data) {
        fuels.addAll(data.data ?? []);
        nameFuel = data.data?.first.name ?? '';
        stok = data.data?.first.stock ?? 0;
        getAllTransactionFuel(data.data?.first.id ?? '');
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (CoreRes? errorRes, NetworkExceptions error) {
        return ResultState.error(error: error, errorRes: errorRes);
      },
    );
  }

  Future<ResultState<CoreRes<List<Transaction>>>> getAllTransactionFuel(String idFuel) async {
    setBusy(true);
    allTransaction.clear();
    var result = await _transactionService.fetchTransactionFuel(idFuel);
    setBusy(false);
    return result.when(success: (CoreRes<List<Transaction>> data) {
      allStok = 0;
      allTransaction.addAll(data.data ?? []);
      for (var item in allTransaction) {
        allStok += item.liter ?? 0;
        notifyListeners();
      }
      bufferStok = stok - allStok;
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }
}
