import 'package:flutter/material.dart';
import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/network/result_state.dart';
import 'package:my_pertamini/src/services/transaction_service.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/convert_to_idr.dart';
import '../../../services/request/order_req.dart';

class DetailOrderViewMoldel extends BaseViewModel with CoreViewModel {
  final _transactionSrevice = locator<TransactionService>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailAdressController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController amountLiterController = TextEditingController();

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool enableSubdistrik = false;
  bool enableCity = false;

  String? province;
  String? city;
  String? subdistrik;

  int price = 0;
  int amountLiter = 0;
  int grandTotal = 0;

  OrderReq? orderData;

  Future<ResultState<CoreRes>> createOrder({
    required String idUser,
    required String idFuel,
    required OrderReq dataOrder,
  }) async {
    var result = await _transactionSrevice.creteOrder(
      idUser: idUser,
      idFuel: idFuel,
      dataOrder: dataOrder,
    );
    return result.when(
      success: (CoreRes data) {
        back();
        back();
        showInformationDialog(true, data.message ?? '');
        return ResultState.data(data: data);
      },
      failure: (CoreRes? errorRes, NetworkExceptions error) {
        showInformationDialog(false, errorRes?.message ?? '');
        notifyListeners();
        return ResultState.error(error: error);
      },
    );
  }

  setPriceApply(String value) {
    setMaxPriceToIDR(value);
    var selection = TextSelection.collapsed(
      offset: priceController.text.length,
    );
    priceController.selection = selection;
    notifyListeners();
  }

  void setMaxPriceToIDR(String value) {
    var valueFormatter = value.replaceAll('.', '');
    price = int.parse(valueFormatter);
    priceController.text = convertToIdrWithoutRP(price);
    notifyListeners();
  }

  //void showStatusOrderView() => navigationService.navigateToStatusOrderView();
}
