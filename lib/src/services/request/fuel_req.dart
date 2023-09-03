import 'package:freezed_annotation/freezed_annotation.dart';

part 'fuel_req.g.dart';

@JsonSerializable()
class FuelReq {
  String? name;
  String? description;
  @JsonKey(name: "number_oktan")
  int? numberOktan;
  int? price;
  int? stock;
  FuelReq({
    this.name,
    this.description,
    this.numberOktan,
    this.price,
    this.stock,
  });

  factory FuelReq.fromJson(Map<String, dynamic> json) => _$FuelReqFromJson(json);
  Map<String, dynamic> toJson() => _$FuelReqToJson(this);
}
