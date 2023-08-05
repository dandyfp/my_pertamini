import 'package:json_annotation/json_annotation.dart';

part 'detail_user.g.dart';

@JsonSerializable()
class DetailUser {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  DetailUser({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });
  factory DetailUser.fromJson(Map<String, dynamic> json) => _$DetailUserFromJson(json);
  Map<String, dynamic> toJson() => _$DetailUserToJson(this);
}
