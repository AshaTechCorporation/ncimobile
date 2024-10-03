// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evaluate _$EvaluateFromJson(Map<String, dynamic> json) => Evaluate(
      id: (json['id'] as num?)?.toInt(),
      project_id: (json['project_id'] as num?)?.toInt(),
      topic: json['topic'] as String?,
      indicator_quantitative: json['indicator_quantitative'] as String?,
      indicator_qualitative: json['indicator_qualitative'] as String?,
      target_value: json['target_value'] as String?,
      create_by: json['create_by'] as String?,
      update_by: json['update_by'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      topic_detail: json['topic_detail'] as String?,
    );

Map<String, dynamic> _$EvaluateToJson(Evaluate instance) => <String, dynamic>{
      'id': instance.id,
      'project_id': instance.project_id,
      'topic': instance.topic,
      'indicator_quantitative': instance.indicator_quantitative,
      'indicator_qualitative': instance.indicator_qualitative,
      'target_value': instance.target_value,
      'create_by': instance.create_by,
      'update_by': instance.update_by,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'topic_detail': instance.topic_detail,
    };
