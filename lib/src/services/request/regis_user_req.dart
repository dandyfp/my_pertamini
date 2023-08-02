import 'package:freezed_annotation/freezed_annotation.dart';

part 'regis_user_req.g.dart';

@JsonSerializable()
class RegisUserReq {
  String? name;
  String? email;
  String? password;
  RegisUserReq({
    this.name,
    this.email,
    this.password,
  });
  factory RegisUserReq.fromJson(Map<String, dynamic> json) => _$RegisUserReqFromJson(json);
  Map<String, dynamic> toJson() => _$RegisUserReqToJson(this);
}
