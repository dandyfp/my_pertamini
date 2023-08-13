// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String?,
      idUser: json['id_user'] as String?,
      idFuel: json['id_fuel'] as String?,
      nameOrder: json['name_order'] as String?,
      province: json['province'] as String?,
      city: json['city'] as String?,
      subdistrick: json['subdistrick'] as String?,
      detailAddress: json['detail_address'] as String?,
      paymentMethod: json['payment_method'] as String?,
      status: json['status'] as String?,
      price: json['price'] as int?,
      liter: json['liter'] as int?,
      nameFuel: json['name_fuel'] as String?,
      numberOktan: json['number_oktan'] as String?,
      fullAddress: json['full_address'] as String?,
      shippingCost: json['shipping_cost'] as int?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'id_fuel': instance.idFuel,
      'name_order': instance.nameOrder,
      'province': instance.province,
      'city': instance.city,
      'subdistrick': instance.subdistrick,
      'detail_address': instance.detailAddress,
      'payment_method': instance.paymentMethod,
      'status': instance.status,
      'price': instance.price,
      'liter': instance.liter,
      'name_fuel': instance.nameFuel,
      'number_oktan': instance.numberOktan,
      'full_address': instance.fullAddress,
      'shipping_cost': instance.shippingCost,
    };
