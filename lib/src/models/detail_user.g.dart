// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailUser _$DetailUserFromJson(Map<String, dynamic> json) => DetailUser(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DetailUserToJson(DetailUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
