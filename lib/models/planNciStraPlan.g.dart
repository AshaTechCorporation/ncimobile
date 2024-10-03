// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planNciStraPlan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanNciStraPlan _$PlanNciStraPlanFromJson(Map<String, dynamic> json) =>
    PlanNciStraPlan(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      status: json['status'] as bool?,
      create_by: json['create_by'] as String?,
      update_by: json['update_by'] as String?,
      plan_nci_stra_plan_id: (json['plan_nci_stra_plan_id'] as num?)?.toInt(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PlanNciStraPlanToJson(PlanNciStraPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'create_by': instance.create_by,
      'update_by': instance.update_by,
      'plan_nci_stra_plan_id': instance.plan_nci_stra_plan_id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
