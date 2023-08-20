import 'package:flutter/material.dart';
import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/enum/snackbar_type.dart';
import 'package:my_pertamini/src/models/detail_user.dart';
import 'package:my_pertamini/src/models/fuel.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/fuel_service.dart';
import 'package:my_pertamini/src/services/request/fuel_req.dart';
import 'package:my_pertamini/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

import '../../../network/network_exceptions.dart';
import '../../shared/colors.dart';
import 'home_view.dart';

const String _userData = 'userDelayed';
const String _fuelData = 'fuelDelayed';

class HomeViewModel extends MultipleFutureViewModel with CoreViewModel {
  final _fuelService = locator<FuelService>();
  final _userSerice = locator<UserService>();

  bool get fetchUser => busy(_userData);
  bool get fetchFuel => busy(_fuelData);

  final TextEditingController nameFuelController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController numberOktanController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  DetailUser? user;

  bool isAdmin = false;
  bool isLoadingDelete = false;
  bool isLoadingEdit = false;
  bool isLoadingCreate = false;

  List<Fuel> fuels = [];
  Fuel? fuel;

  @override
  Map<String, Future Function()> get futuresMap => {
        _userData: getUser,
        _fuelData: getFuel,
      };

  Future<ResultState<CoreRes<List<Fuel>>>> getFuel() async {
    fuels.clear();
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
      data.data?.type == 'admin' ? isAdmin = true : false;
      user = data.data;
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? erroRes, NetworkExceptions error) {
      return ResultState.error(error: error);
    });
  }

  Future<ResultState<CoreRes>> createFuel(FuelReq req) async {
    isLoadingCreate = true;
    var result = await _fuelService.createFuel(req);
    isLoadingCreate = false;
    return result.when(success: (CoreRes data) {
      back();
      getFuel();
      _fuelService.snackBarService.showCustomSnackBar(
        message: data.message ?? '',
        variant: SnackbarType.success,
      );
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      _fuelService.snackBarService.showCustomSnackBar(
        message: errorRes?.message ?? '',
        variant: SnackbarType.warning,
      );
      notifyListeners();
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  Future<ResultState<CoreRes>> updateFuel({
    required FuelReq req,
    required String id,
  }) async {
    var result = await _fuelService.updateFuel(req: req, id: id);
    return result.when(success: (CoreRes data) {
      getFuel();
      back();
      _fuelService.snackBarService.showCustomSnackBar(
        message: data.message ?? '',
        variant: SnackbarType.success,
      );
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      _fuelService.snackBarService.showCustomSnackBar(
        message: errorRes?.message ?? '',
        variant: SnackbarType.warning,
      );
      notifyListeners();
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  Future<ResultState<CoreRes>> deleteFuel(String id) async {
    isLoadingDelete = true;
    var result = await _fuelService.deteleFuel(id);
    isLoadingDelete = false;
    return result.when(success: (CoreRes data) {
      getFuel();
      _fuelService.snackBarService.showCustomSnackBar(
        message: data.message ?? '',
        variant: SnackbarType.success,
      );
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      _fuelService.snackBarService.showCustomSnackBar(
        message: errorRes?.message ?? '',
        variant: SnackbarType.warning,
      );
      notifyListeners();
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  Future<ResultState<CoreRes<Fuel>>> getDetailFuel(String id) async {
    isLoadingEdit = true;
    var result = await _fuelService.detailFuel(id);
    isLoadingEdit = false;
    return result.when(success: (CoreRes<Fuel> data) {
      fuel = data.data;
      nameFuelController.text = data.data?.name ?? '';
      numberOktanController.text = data.data?.numberOktan.toString() ?? '';
      descriptionController.text = data.data?.description ?? '';
      priceController.text = data.data!.price.toString();
      FuelReq req = FuelReq(
        name: data.data?.name ?? '',
        numberOktan: data.data?.numberOktan,
        description: data.data?.description,
        price: data.data?.price,
      );
      showBottomSheetCreateFuel(
        id: data.data?.id ?? '',
        req: req,
        isEdit: true,
      );
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      notifyListeners();
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  void showBottomSheetCreateFuel({
    String? id,
    required FuelReq req,
    required bool isEdit,
  }) {
    showModalBottomSheet(
      backgroundColor: BaseColors.white,
      isDismissible: true,
      isScrollControlled: true,
      context: currentContext!,
      builder: (context) {
        return BottomSheetCreateFuel(
          vm: this,
          id: id ?? '',
          isEdit: isEdit,
          req: req,
        );
      },
    );
  }

  void clearData() {
    nameFuelController.clear();
    priceController.clear();
    priceController.clear();
    descriptionController.clear();
    numberOktanController.clear();
  }

  void showDetailOrderView(Fuel fuel, String idUser) => navigationService.navigateToDetailOrderView(idUser: idUser, fuel: fuel);
}
