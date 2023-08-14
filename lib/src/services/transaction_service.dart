import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_service.dart';
import 'package:my_pertamini/src/models/order.dart';
import 'package:my_pertamini/src/models/transaction.dart';
import 'package:my_pertamini/src/network/api_result.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/services/request/order_req.dart';
import 'package:my_pertamini/src/services/request/transaction_req.dart';

class TransactionService extends CoreService {
  Future<ApiResult<CoreRes>> creteOrder({
    required String idUser,
    required String idFuel,
    required OrderReq dataOrder,
  }) async {
    try {
      final Map<String, dynamic> body = OrderReq(
        nameOrder: dataOrder.nameOrder,
        province: dataOrder.province,
        detailAddress: dataOrder.detailAddress,
        paymentMethod: 'COD',
        subdistrict: dataOrder.subdistrict,
        liter: dataOrder.liter,
        price: dataOrder.price,
        status: dataOrder.status,
        city: dataOrder.city,
      ).toJson();
      var result = await apiService.createOrder(body, idUser, idFuel);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e), coreRes: NetworkExceptions.getErrorRes(e));
    }
  }

  Future<ApiResult<CoreRes<List<Order>>>> fetchMyOrder() async {
    try {
      var result = await apiService.getMyOrder();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        coreRes: NetworkExceptions.getErrorRes(e),
      );
    }
  }

  Future<ApiResult<CoreRes>> createTransaction(TransactionReq request) async {
    Map<String, dynamic> body = TransactionReq(
      idFuel: request.idFuel,
      idUser: request.idUser,
      id: request.id,
      amount: request.amount,
      date: request.date,
      idOrder: request.idOrder,
      transactionPaymentMethod: request.transactionPaymentMethod,
      typeTransaction: request.typeTransaction,
      nameFuel: request.nameFuel,
      liter: request.liter,
    ).toJson();
    try {
      var result = await apiService.createTransaction(body);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e), coreRes: NetworkExceptions.getErrorRes(e));
    }
  }

  Future<ApiResult<CoreRes<List<Transaction>>>> fetchMyTransaction() async {
    try {
      var result = await apiService.getMytransaction();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e), coreRes: NetworkExceptions.getErrorRes(e));
    }
  }
}
