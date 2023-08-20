// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle {
  int? id;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "name_brand")
  String? nameBrand;
  @JsonKey(name: "type_vehicle")
  String? typeVehicle;
  @JsonKey(name: "number_vehicle")
  String? numberVehicle;
  Vehicle({
    this.id,
    this.userId,
    this.nameBrand,
    this.typeVehicle,
    this.numberVehicle,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}
