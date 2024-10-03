// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planProjectHeadApproves.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanProjectHeadApproves _$PlanProjectHeadApprovesFromJson(
        Map<String, dynamic> json) =>
    PlanProjectHeadApproves(
      id: (json['id'] as num?)?.toInt(),
      plan_project_id: (json['plan_project_id'] as num?)?.toInt(),
      seq: (json['seq'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      approved: json['approved'] as String?,
      remark: json['remark'] as String?,
      approved_at: json['approved_at'] as String?,
      name: json['name'] as String?,
      position: json['position'] as String?,
      signature: json['signature'] as String?,
      prefix: json['prefix'] as String?,
      position_type: json['position_type'] as String?,
      department: json['department'] as String?,
      role: json['role'] as String?,
      type: json['type'] as String?,
      status: json['status'] as bool?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    )..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$PlanProjectHeadApprovesToJson(
        PlanProjectHeadApproves instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_project_id': instance.plan_project_id,
      'seq': instance.seq,
      'user_id': instance.user_id,
      'approved': instance.approved,
      'remark': instance.remark,
      'approved_at': instance.approved_at,
      'name': instance.name,
      'position': instance.position,
      'signature': instance.signature,
      'prefix': instance.prefix,
      'position_type': instance.position_type,
      'department': instance.department,
      'role': instance.role,
      'type': instance.type,
      'status': instance.status,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'user': instance.user,
    };
