// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionReq _$TransactionReqFromJson(Map<String, dynamic> json) =>
    TransactionReq(
      id: json['id'] as String?,
      idUser: json['id_user'] as String?,
      idOrder: json['id_order'] as String?,
      idFuel: json['id_fuel'] as String?,
      typeTransaction: json['type_transaction'] as String?,
      amount: json['amount'] as int?,
      transactionPaymentMethod: json['transaction_payment_method'] as String?,
      date: json['date'] as String?,
      liter: json['liter'] as int?,
      type: json['type'] as String?,
      nameFuel: json['name_fuel'] as String?,
    );

Map<String, dynamic> _$TransactionReqToJson(TransactionReq instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'id_order': instance.idOrder,
      'id_fuel': instance.idFuel,
      'type_transaction': instance.typeTransaction,
      'amount': instance.amount,
      'transaction_payment_method': instance.transactionPaymentMethod,
      'date': instance.date,
      'liter': instance.liter,
      'type': instance.type,
      'name_fuel': instance.nameFuel,
    };
