import 'package:my_pertamini/src/core/core_res.dart';
import 'package:my_pertamini/src/core/core_service.dart';
import 'package:my_pertamini/src/models/order.dart';
import 'package:my_pertamini/src/models/transaction.dart';
import 'package:my_pertamini/src/network/api_result.dart';
import 'package:my_pertamini/src/network/network_exceptions.dart';
import 'package:my_pertamini/src/services/request/order_req.dart';
import 'package:my_pertamini/src/services/request/transaction_req.dart';
import 'package:my_pertamini/src/services/request/update_status_req.dart';

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

  Future<ApiResult<CoreRes<List<Order>>>> fetchOrderReceived() async {
    try {
      var result = await apiService.getOrderReceiped();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        coreRes: NetworkExceptions.getErrorRes(e),
      );
    }
  }

  Future<ApiResult<CoreRes<List<Order>>>> fetchOrderOnProcess() async {
    try {
      var result = await apiService.getOrderOnProcess();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        coreRes: NetworkExceptions.getErrorRes(e),
      );
    }
  }

  Future<ApiResult<CoreRes<List<Order>>>> fetchAllOrder() async {
    try {
      var result = await apiService.getAllOrder();
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
      type: request.type,
      status: 'order received',
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

  Future<ApiResult<CoreRes<List<Transaction>>>> fetchTransactionFuel(String idFuel) async {
    try {
      var result = await apiService.getTransactionFuel(idFuel);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e), coreRes: NetworkExceptions.getErrorRes(e));
    }
  }

  Future<ApiResult<CoreRes<List<Transaction>>>> fetchAllTransaction() async {
    try {
      var result = await apiService.getAlltransaction();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e), coreRes: NetworkExceptions.getErrorRes(e));
    }
  }

  Future<ApiResult<CoreRes>> updateStatus({
    required String id,
    required String status,
  }) async {
    try {
      Map<String, dynamic> body = UpdateStatusReq(
        id: id,
        status: status,
      ).toJson();
      var result = await apiService.updateStatusOrder(body);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e), coreRes: NetworkExceptions.getErrorRes(e));
    }
  }
}
