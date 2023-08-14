// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String?,
      idUser: json['id_user'] as String?,
      idOrder: json['id_order'] as String?,
      idFuel: json['id_fuel'] as String?,
      typeTransaction: json['type_transaction'] as String?,
      amount: json['amount'] as int?,
      transactionPaymentMethod: json['transaction_payment_method'] as String?,
      date: json['date'] as String?,
      nameFuel: json['name_fuel'] as String?,
      liter: json['liter'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'id_order': instance.idOrder,
      'id_fuel': instance.idFuel,
      'type_transaction': instance.typeTransaction,
      'amount': instance.amount,
      'transaction_payment_method': instance.transactionPaymentMethod,
      'date': instance.date,
      'name_fuel': instance.nameFuel,
      'liter': instance.liter,
      'type': instance.type,
    };
