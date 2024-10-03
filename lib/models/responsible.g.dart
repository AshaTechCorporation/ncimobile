// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsible.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Responsible _$ResponsibleFromJson(Map<String, dynamic> json) => Responsible(
      id: (json['id'] as num?)?.toInt(),
      project_id: (json['project_id'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      position: json['position'] as String?,
      role: json['role'] as String?,
      remark: json['remark'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ResponsibleToJson(Responsible instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.project_id,
      'user_id': instance.user_id,
      'name': instance.name,
      'position': instance.position,
      'role': instance.role,
      'remark': instance.remark,
      'phone': instance.phone,
      'email': instance.email,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
