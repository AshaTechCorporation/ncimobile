// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planDmsStrategic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanDmsStrategic _$PlanDmsStrategicFromJson(Map<String, dynamic> json) =>
    PlanDmsStrategic(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as bool,
      create_by: json['create_by'] as String?,
      update_by: json['update_by'] as String?,
      plan_dms_strategic_plan_id:
          (json['plan_dms_strategic_plan_id'] as num).toInt(),
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
      plan_dms_dtrategic_plan: PlanDmsDtrategicPlan.fromJson(
          json['plan_dms_dtrategic_plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlanDmsStrategicToJson(PlanDmsStrategic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'create_by': instance.create_by,
      'update_by': instance.update_by,
      'plan_dms_strategic_plan_id': instance.plan_dms_strategic_plan_id,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'plan_dms_dtrategic_plan': instance.plan_dms_dtrategic_plan,
    };
