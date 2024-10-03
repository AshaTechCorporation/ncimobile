// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      permission_id: (json['permission_id'] as num?)?.toInt(),
      employee_id: (json['employee_id'] as num?)?.toInt(),
      username: json['username'] as String?,
      status: json['status'] as bool?,
      image: json['image'] as String?,
      employee: json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'permission_id': instance.permission_id,
      'employee_id': instance.employee_id,
      'username': instance.username,
      'status': instance.status,
      'image': instance.image,
      'employee': instance.employee,
    };
