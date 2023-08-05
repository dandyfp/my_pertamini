import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String? token;
  String? name;
  String? email;
  Profile({
    this.token,
    this.name,
    this.email,
  });
  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
