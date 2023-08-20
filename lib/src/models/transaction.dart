import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_pertamini/src/models/detail_user.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  String? id;
  @JsonKey(name: 'user_id')
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
  @JsonKey(name: "name_fuel")
  String? nameFuel;
  int? liter;
  String? type;
  DetailUser? user;
  Transaction({
    this.id,
    this.user,
    this.idUser,
    this.idOrder,
    this.idFuel,
    this.typeTransaction,
    this.amount,
    this.transactionPaymentMethod,
    this.date,
    this.nameFuel,
    this.liter,
    this.type,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
