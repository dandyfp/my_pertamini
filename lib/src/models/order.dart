import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  @JsonKey(name: "user_id")
  String? idUser;
  @JsonKey(name: "id_fuel")
  String? idFuel;
  @JsonKey(name: "name_order")
  String? nameOrder;
  String? province;
  String? city;
  String? subdistrick;
  @JsonKey(name: "detail_address")
  String? detailAddress;
  @JsonKey(name: "payment_method")
  String? paymentMethod;
  String? status;
  int? price;
  int? liter;
  @JsonKey(name: "name_fuel")
  String? nameFuel;
  @JsonKey(name: "number_oktan")
  String? numberOktan;
  @JsonKey(name: "full_address")
  String? fullAddress;
  @JsonKey(name: "shipping_cost")
  int? shippingCost;
  @JsonKey(name: "created_at")
  String? createdAt;
  Order({
    this.id,
    this.idUser,
    this.idFuel,
    this.nameOrder,
    this.province,
    this.city,
    this.subdistrick,
    this.detailAddress,
    this.paymentMethod,
    this.status,
    this.price,
    this.liter,
    this.nameFuel,
    this.numberOktan,
    this.fullAddress,
    this.shippingCost,
    this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
