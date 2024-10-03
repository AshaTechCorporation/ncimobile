// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      name: json['name'] as String?,
      cost: json['cost'] as String?,
      process_in_month: json['process_in_month'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => ActivityDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'name': instance.name,
      'cost': instance.cost,
      'process_in_month': instance.process_in_month,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'details': instance.details,
    };
