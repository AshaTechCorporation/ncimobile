// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activityDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityDetail _$ActivityDetailFromJson(Map<String, dynamic> json) =>
    ActivityDetail(
      id: (json['id'] as num?)?.toInt(),
      activity_id: (json['activity_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      cost: json['cost'] as String?,
      create_by: json['create_by'] as String?,
      update_by: json['update_by'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      expen_id: (json['expen_id'] as num?)?.toInt(),
      expen_sub_id: (json['expen_sub_id'] as num?)?.toInt(),
      code: json['code'] as String?,
      activity_detail_expenses: (json['activity_detail_expenses']
              as List<dynamic>?)
          ?.map(
              (e) => ActivityDetailExpenses.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityDetailToJson(ActivityDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activity_id': instance.activity_id,
      'name': instance.name,
      'cost': instance.cost,
      'create_by': instance.create_by,
      'update_by': instance.update_by,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'expen_id': instance.expen_id,
      'expen_sub_id': instance.expen_sub_id,
      'code': instance.code,
      'activity_detail_expenses': instance.activity_detail_expenses,
    };
