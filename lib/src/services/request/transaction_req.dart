import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_req.g.dart';

@JsonSerializable()
class TransactionReq {
  String? id;
  @JsonKey(name: 'id_user')
  String? idUser;
  @JsonKey(name: 'id_order')
  String? idOrder;
  @JsonKey(name: 'id_fuel')
  String? idFuel;
  @JsonKey(name: 'type_transaction')
  String? typeTransaction;
  int? amount;
  @JsonKey(name: 'transaction_payment_method')
  String? transactionPaymentMethod;
  String? date;
  int? liter;
  String? type;
  @JsonKey(name: 'name_fuel')
  String? nameFuel;
  TransactionReq({
    this.id,
    this.idUser,
    this.idOrder,
    this.idFuel,
    this.typeTransaction,
    this.amount,
    this.transactionPaymentMethod,
    this.date,
    this.liter,
    this.type,
    this.nameFuel,
  });

  factory TransactionReq.fromJson(Map<String, dynamic> json) => _$TransactionReqFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionReqToJson(this);
}
