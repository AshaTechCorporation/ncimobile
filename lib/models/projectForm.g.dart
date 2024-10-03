// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projectForm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectForm _$ProjectFormFromJson(Map<String, dynamic> json) => ProjectForm(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      strategy_on: json['strategy_on'] as String?,
      strategy_target: json['strategy_target'] as String?,
      strategy_point: json['strategy_point'] as String?,
      under_strategy_point: json['under_strategy_point'] as String?,
      under_strategy_target: json['under_strategy_target'] as String?,
      under_strategy_sub_plan: json['under_strategy_sub_plan'] as String?,
      under_strategy_sub_plan_target:
          json['under_strategy_sub_plan_target'] as String?,
      action_plan_of_mph: json['action_plan_of_mph'] as String?,
      dms_target: json['dms_target'] as String?,
      dms_acition_title: json['dms_acition_title'] as String?,
      dms_strategy: json['dms_strategy'] as String?,
      dms_indicator: json['dms_indicator'] as String?,
      status: json['status'] as bool?,
      create_by: json['create_by'] as String?,
      update_by: json['update_by'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      plan_dms_strategic_id: (json['plan_dms_strategic_id'] as num?)?.toInt(),
      plan_dms_strategic: json['plan_dms_strategic'] == null
          ? null
          : PlanDmsStrategic.fromJson(
              json['plan_dms_strategic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectFormToJson(ProjectForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'strategy_on': instance.strategy_on,
      'strategy_target': instance.strategy_target,
      'strategy_point': instance.strategy_point,
      'under_strategy_point': instance.under_strategy_point,
      'under_strategy_target': instance.under_strategy_target,
      'under_strategy_sub_plan': instance.under_strategy_sub_plan,
      'under_strategy_sub_plan_target': instance.under_strategy_sub_plan_target,
      'action_plan_of_mph': instance.action_plan_of_mph,
      'dms_target': instance.dms_target,
      'dms_acition_title': instance.dms_acition_title,
      'dms_strategy': instance.dms_strategy,
      'dms_indicator': instance.dms_indicator,
      'status': instance.status,
      'create_by': instance.create_by,
      'update_by': instance.update_by,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'plan_dms_strategic_id': instance.plan_dms_strategic_id,
      'plan_dms_strategic': instance.plan_dms_strategic,
    };
