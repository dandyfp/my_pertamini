import 'package:flutter/material.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/models/order.dart';
import 'package:my_pertamini/src/models/vehicle.dart';
import 'package:my_pertamini/src/services/request/vehicle_req.dart';
import 'package:my_pertamini/src/services/transaction_service.dart';
import 'package:my_pertamini/src/services/vehicle_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../core/core_res.dart';
import '../../../models/detail_user.dart';
import '../../../models/transaction.dart';
import '../../../network/network_exceptions.dart';
import '../../../network/result_state.dart';
import '../../../services/user_service.dart';

const String _userData = 'dataDelayed';
const String _orderData = 'orderDelayed';
const String _transactionData = 'transactionDelayed';

class ProfileViewModel extends MultipleFutureViewModel with CoreViewModel {
  final _userSerice = locator<UserService>();
  final _transactionService = locator<TransactionService>();
  final _vehicleService = locator<VehicleService>();

  final TextEditingController nameVehicleController = TextEditingController();
  final TextEditingController brancVehicleController = TextEditingController();
  final TextEditingController numberVehicleController = TextEditingController();

  List<Transaction> myTransaction = [];
  List<Transaction> allTransaction = [];

  bool get fetchUser => busy(_userData);
  bool get fetchMyOrder => busy(_orderData);
  bool get fetcMyTransaction => busy(_transactionData);

  List<Order> myOrder = [];
  List<Order> orderOnProcess = [];
  List<Order> orderReceived = [];
  String? typeVehicle;
  Vehicle? myVehicle;

  DetailUser? user;
  @override
  Map<String, Future Function()> get futuresMap => {
        _userData: getUser,
        _orderData: getMyOrder,
        _transactionData: getMyTransaction,
      };

  Future<ResultState<CoreRes<DetailUser>>> getUser() async {
    var result = await _userSerice.getUser();
    return result.when(success: (CoreRes<DetailUser> data) {
      user = data.data;
      getMyVehicle();
      getOrderOnProcess();
      getOrderReceived();
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? erroRes, NetworkExceptions error) {
      return ResultState.error(error: error);
    });
  }

  Future<ResultState<CoreRes<List<Order>>>> getMyOrder() async {
    myOrder.clear();
    var result = await _transactionService.fetchMyOrder();
    return result.when(success: (CoreRes<List<Order>> data) {
      myOrder.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  Future<ResultState<CoreRes<List<Order>>>> getOrderOnProcess() async {
    orderOnProcess.clear();
    var result = await _transactionService.fetchOrderOnProcess();
    return result.when(success: (CoreRes<List<Order>> data) {
      orderOnProcess.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  Future<ResultState<CoreRes<List<Order>>>> getOrderReceived() async {
    orderReceived.clear();
    var result = await _transactionService.fetchOrderReceived();
    return result.when(success: (CoreRes<List<Order>> data) {
      orderReceived.addAll(data.data ?? []);
      notifyListeners();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  Future<ResultState<CoreRes<List<Transaction>>>> getMyTransaction() async {
    myTransaction.clear();
    var result = await _transactionService.fetchMyTransaction();
    return result.when(success: (CoreRes<List<Transaction>> data) {
      myTransaction.addAll(data.data ?? []);
      getAllTransaction();
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

  Future<ResultState<CoreRes>> createMyVehicle(VehicleReq req) async {
    var result = await _vehicleService.createVehicle(req);
    return result.when(success: (CoreRes data) {
      back();
      return ResultState.data(data: data);
    }, failure: (CoreRes? errorRes, NetworkExceptions error) {
      return ResultState.error(error: error, errorRes: errorRes);
    });
  }

  Future<ResultState<CoreRes<Vehicle>>> getMyVehicle() async {
    var result = await _vehicleService.fetchMyVehicle(user!.id.toString());
    return result.when(success: (CoreRes<Vehicle> data) {
      myVehicle = data.data;
      getAll();
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
      navigationService
          .navigateToStatusOrderView(
            nameFuel: nameFuel,
            numberOktan: numberOktan,
            dataOrder: dataOrder,
          )
          .then((value) => getAll());

  void getAll() {
    getMyOrder();
    getMyTransaction();
    getOrderOnProcess();
    getOrderReceived();
  }

  void showCartView() => navigationService.navigateToCartView();
}
