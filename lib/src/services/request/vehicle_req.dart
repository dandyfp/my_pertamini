import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_req.g.dart';

@JsonSerializable()
class VehicleReq {
  int? id;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "name_brand")
  String? nameBrand;
  @JsonKey(name: "type_vehicle")
  String? typeVehicle;
  @JsonKey(name: "number_vehicle")
  String? numberVehicle;
  VehicleReq({
    this.id,
    this.userId,
    this.nameBrand,
    this.typeVehicle,
    this.numberVehicle,
  });

  factory VehicleReq.fromJson(Map<String, dynamic> json) => _$VehicleReqFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleReqToJson(this);
}
