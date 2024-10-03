// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approvers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Approvers _$ApproversFromJson(Map<String, dynamic> json) => Approvers(
      id: (json['id'] as num?)?.toInt(),
      project_id: (json['project_id'] as num?)?.toInt(),
      sequence: (json['sequence'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      approved_at: json['approved_at'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String?,
      position: json['position'] as String?,
      role: json['role'] as String?,
      remark: json['remark'] as String?,
      signature: json['signature'] as String?,
      prefix: json['prefix'] as String?,
      positionType: json['positionType'] as String?,
      department: json['department'] as String?,
      employee: json['employee'] as String?,
    );

Map<String, dynamic> _$ApproversToJson(Approvers instance) => <String, dynamic>{
      'id': instance.id,
      'project_id': instance.project_id,
      'sequence': instance.sequence,
      'user_id': instance.user_id,
      'status': instance.status,
      'approved_at': instance.approved_at,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'name': instance.name,
      'position': instance.position,
      'role': instance.role,
      'remark': instance.remark,
      'signature': instance.signature,
      'prefix': instance.prefix,
      'positionType': instance.positionType,
      'department': instance.department,
      'employee': instance.employee,
    };
