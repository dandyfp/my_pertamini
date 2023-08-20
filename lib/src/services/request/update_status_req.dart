import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_status_req.g.dart';

@JsonSerializable()
class UpdateStatusReq {
  String? id;
  String? status;
  UpdateStatusReq({
    this.id,
    this.status,
  });
  factory UpdateStatusReq.fromJson(Map<String, dynamic> json) => _$UpdateStatusReqFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateStatusReqToJson(this);
}
