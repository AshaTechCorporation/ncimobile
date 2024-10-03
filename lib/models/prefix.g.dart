// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefix.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prefix _$PrefixFromJson(Map<String, dynamic> json) => Prefix(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      short_name: json['short_name'] as String?,
      status: json['status'] as bool?,
      create_by: json['create_by'] as String?,
      update_by: json['update_by'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$PrefixToJson(Prefix instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'short_name': instance.short_name,
      'status': instance.status,
      'create_by': instance.create_by,
      'update_by': instance.update_by,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'gender': instance.gender,
    };
