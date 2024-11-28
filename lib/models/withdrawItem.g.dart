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
      approved: json['approved'] as String?,
      approved_remark: json['approved_remark'] as String?,
      approved_by: json['approved_by'] as String?,
      approved_at: json['approved_at'] as String?,
      status: json['status'] as bool?,
      payment_voucher_no: json['payment_voucher_no'] as String?,
      sync_his: json['sync_his'] as bool?,
      doc_no: json['doc_no'] as String?,
      No: (json['No'] as num?)?.toInt(),
      hr_ci_department: json['hr_ci_department'] == null
          ? null
          : Department.fromJson(
              json['hr_ci_department'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
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
      'approved': instance.approved,
      'approved_remark': instance.approved_remark,
      'approved_by': instance.approved_by,
      'approved_at': instance.approved_at,
      'status': instance.status,
      'payment_voucher_no': instance.payment_voucher_no,
      'sync_his': instance.sync_his,
      'doc_no': instance.doc_no,
      'No': instance.No,
      'hr_ci_department': instance.hr_ci_department,
      'user': instance.user,
    };
