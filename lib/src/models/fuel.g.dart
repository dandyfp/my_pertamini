// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fuel _$FuelFromJson(Map<String, dynamic> json) => Fuel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      numberOktan: json['number_oktan'] as int?,
      stock: json['stock'] as int?,
    );

Map<String, dynamic> _$FuelToJson(Fuel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'number_oktan': instance.numberOktan,
      'stock': instance.stock,
    };
