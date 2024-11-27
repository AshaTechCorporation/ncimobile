// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num?)?.toInt(),
      ci_mission_id: (json['ci_mission_id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      short_name: json['short_name'] as String?,
      status: json['status'] as bool?,
      code_his: json['code_his'] as String?,
      type: json['type'] as String?,
      tel: json['tel'] as String?,
      warehouse_key: json['warehouse_key'] as String?,
      name_eng: json['name_eng'] as String?,
      typci_missione: json['typci_missione'] as String?,
      No: (json['No'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ci_mission_id': instance.ci_mission_id,
      'code': instance.code,
      'name': instance.name,
      'short_name': instance.short_name,
      'status': instance.status,
      'code_his': instance.code_his,
      'type': instance.type,
      'tel': instance.tel,
      'warehouse_key': instance.warehouse_key,
      'name_eng': instance.name_eng,
      'typci_missione': instance.typci_missione,
      'No': instance.No,
    };
