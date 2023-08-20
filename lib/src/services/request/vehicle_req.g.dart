// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleReq _$VehicleReqFromJson(Map<String, dynamic> json) => VehicleReq(
      id: json['id'] as int?,
      userId: json['user_id'] as String?,
      nameBrand: json['name_brand'] as String?,
      typeVehicle: json['type_vehicle'] as String?,
      numberVehicle: json['number_vehicle'] as String?,
    );

Map<String, dynamic> _$VehicleReqToJson(VehicleReq instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name_brand': instance.nameBrand,
      'type_vehicle': instance.typeVehicle,
      'number_vehicle': instance.numberVehicle,
    };
