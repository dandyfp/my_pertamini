import 'package:freezed_annotation/freezed_annotation.dart';

part 'fuel.g.dart';

@JsonSerializable()
class Fuel {
  String? id;
  String? name;
  String? description;
  int? price;
  @JsonKey(name: "number_oktan")
  int? numberOktan;

  Fuel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.numberOktan,
  });

  factory Fuel.fromJson(Map<String, dynamic> json) => _$FuelFromJson(json);

  Map<String, dynamic> toJson() => _$FuelToJson(this);
}
