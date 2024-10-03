// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moneyType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneyType _$MoneyTypeFromJson(Map<String, dynamic> json) => MoneyType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      short_name: json['short_name'] as String?,
      status: json['status'] as bool?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MoneyTypeToJson(MoneyType instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'short_name': instance.short_name,
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
