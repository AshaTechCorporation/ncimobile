// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawItem _$WithdrawItemFromJson(Map<String, dynamic> json) => WithdrawItem(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      date: json['date'] as String?,
      hr_ci_department_id: (json['hr_ci_department_id'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      sup_pr_use: json['sup_pr_use'] as String?,
      remark: json['remark'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$WithdrawItemToJson(WithdrawItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'date': instance.date,
      'hr_ci_department_id': instance.hr_ci_department_id,
      'user_id': instance.user_id,
      'sup_pr_use': instance.sup_pr_use,
      'remark': instance.remark,
      'status': instance.status,
    };
