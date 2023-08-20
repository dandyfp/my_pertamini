// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuelReq _$FuelReqFromJson(Map<String, dynamic> json) => FuelReq(
      name: json['name'] as String?,
      description: json['description'] as String?,
      numberOktan: json['number_oktan'] as int?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$FuelReqToJson(FuelReq instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'number_oktan': instance.numberOktan,
      'price': instance.price,
    };
