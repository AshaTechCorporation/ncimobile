// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supItemType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupItemType _$SupItemTypeFromJson(Map<String, dynamic> json) => SupItemType(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      short_name: json['short_name'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$SupItemTypeToJson(SupItemType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'short_name': instance.short_name,
      'status': instance.status,
    };
