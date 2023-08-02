import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_req.g.dart';

@JsonSerializable()
class AuthReq {
  String? email;
  String? password;
  AuthReq({
    this.email,
    this.password,
  });

  factory AuthReq.fromJson(Map<String, dynamic> json) => _$AuthReqFromJson(json);
  Map<String, dynamic> toJson() => _$AuthReqToJson(this);
}
