// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'risk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Risk _$RiskFromJson(Map<String, dynamic> json) => Risk(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      topic: json['topic'] as String?,
      risk: json['risk'] as String?,
      defensive_control: json['defensive_control'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      mt_proj_risk_id: (json['mt_proj_risk_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RiskToJson(Risk instance) => <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'topic': instance.topic,
      'risk': instance.risk,
      'defensive_control': instance.defensive_control,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'mt_proj_risk_id': instance.mt_proj_risk_id,
    };
