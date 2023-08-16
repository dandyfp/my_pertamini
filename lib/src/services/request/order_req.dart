import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_req.g.dart';

@JsonSerializable()
class OrderReq {
  @JsonKey(name: "name_order")
  String? nameOrder;
  String? province;
  String? subdistrict;
  String? city;
  @JsonKey(name: "detail_address")
  String? detailAddress;
  @JsonKey(name: "payment_method")
  String? paymentMethod;
  String? status;
  int? price;
  int? liter;
  @JsonKey(name: 'name_fuel')
  String? nameFuel;
  OrderReq({
    this.nameOrder,
    this.province,
    this.subdistrict,
    this.city,
    this.detailAddress,
    this.paymentMethod,
    this.status,
    this.price,
    this.liter,
  });

  factory OrderReq.fromJson(Map<String, dynamic> json) => _$OrderReqFromJson(json);
  Map<String, dynamic> toJson() => _$OrderReqToJson(this);
}
