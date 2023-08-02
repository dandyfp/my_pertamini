import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_res.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreRes<T> {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  T? data;
  CoreRes({
    this.status,
    this.message,
    this.data,
  });

  factory CoreRes.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$CoreResFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJson) => _$CoreResToJson(this, (value) => null);
}
