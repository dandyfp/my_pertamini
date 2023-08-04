import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_req.g.dart';

@JsonSerializable()
class RegisterRed {
  String? email;
  String? password;
  String? name;
  @JsonKey(name: "confirm_password")
  String? confirmPassword;
  RegisterRed({
    this.email,
    this.password,
    this.confirmPassword,
    this.name,
  });

  factory RegisterRed.fromJson(Map<String, dynamic> json) => _$RegisterRedFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRedToJson(this);
}
