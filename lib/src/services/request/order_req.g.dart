// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderReq _$OrderReqFromJson(Map<String, dynamic> json) => OrderReq(
      nameOrder: json['name_order'] as String?,
      province: json['province'] as String?,
      subdistrict: json['subdistrict'] as String?,
      city: json['city'] as String?,
      detailAddress: json['detail_address'] as String?,
      paymentMethod: json['payment_method'] as String?,
      status: json['status'] as String?,
      price: json['price'] as int?,
      liter: json['liter'] as int?,
    )..nameFuel = json['name_fuel'] as String?;

Map<String, dynamic> _$OrderReqToJson(OrderReq instance) => <String, dynamic>{
      'name_order': instance.nameOrder,
      'province': instance.province,
      'subdistrict': instance.subdistrict,
      'city': instance.city,
      'detail_address': instance.detailAddress,
      'payment_method': instance.paymentMethod,
      'status': instance.status,
      'price': instance.price,
      'liter': instance.liter,
      'name_fuel': instance.nameFuel,
    };
