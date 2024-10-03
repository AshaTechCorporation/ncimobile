// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codeName.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeName _$CodeNameFromJson(Map<String, dynamic> json) => CodeName(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$CodeNameToJson(CodeName instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
