// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupItem _$SupItemFromJson(Map<String, dynamic> json) => SupItem(
      id: (json['id'] as num?)?.toInt(),
      sup_item_type_id: (json['sup_item_type_id'] as num?)?.toInt(),
      sup_item_category_id: (json['sup_item_category_id'] as num?)?.toInt(),
      sup_item_sub_category_id:
          (json['sup_item_sub_category_id'] as num?)?.toInt(),
      code: json['code'] as String?,
      item_no: json['item_no'] as String?,
      name: json['name'] as String?,
      detail: json['detail'] as String?,
      sup_unit_id: (json['sup_unit_id'] as num?)?.toInt(),
      price: json['price'] as String?,
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
      service_life: (json['service_life'] as num?)?.toInt(),
      exp_date: json['exp_date'] as String?,
      cost_year: json['cost_year'] as String?,
      location: json['location'] as String?,
      sup_vendor_id: (json['sup_vendor_id'] as num?)?.toInt(),
      ac_money_type_id: (json['ac_money_type_id'] as num?)?.toInt(),
      sup_pr_method_id: (json['sup_pr_method_id'] as num?)?.toInt(),
      hr_ci_department_id: (json['hr_ci_department_id'] as num?)?.toInt(),
      user_pr_id: (json['user_pr_id'] as num?)?.toInt(),
      receive_date: json['receive_date'] as String?,
      remark: json['remark'] as String?,
      status: json['status'] as bool?,
      create_by: json['create_by'] as String?,
      update_by: json['update_by'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      unspsc: json['unspsc'] as String?,
      hr_ci_work_id: json['hr_ci_work_id'] as String?,
      gpsc: json['gpsc'] as String?,
      type: json['type'] as String?,
      code_his: json['code_his'] as String?,
      unit_gfmis: json['unit_gfmis'] as String?,
      med_type: json['med_type'] as String?,
      med_pack: json['med_pack'] as String?,
      image: json['image'] as String?,
      sup_item_type: json['sup_item_type'] == null
          ? null
          : SupItemType.fromJson(json['sup_item_type'] as Map<String, dynamic>),
      sup_item_category: json['sup_item_category'] == null
          ? null
          : SupItemCategory.fromJson(
              json['sup_item_category'] as Map<String, dynamic>),
      sup_item_sub_category: json['sup_item_sub_category'] as String?,
      sup_unit: json['sup_unit'] == null
          ? null
          : SupItemType.fromJson(json['sup_unit'] as Map<String, dynamic>),
      sup_vendor: json['sup_vendor'] as String?,
      ac_money_type: json['ac_money_type'] as String?,
      sup_pr_method: json['sup_pr_method'] as String?,
      hr_ci_department: json['hr_ci_department'] as String?,
      hr_ci_work: json['hr_ci_work'] as String?,
      user_pr: json['user_pr'] as String?,
    );

Map<String, dynamic> _$SupItemToJson(SupItem instance) => <String, dynamic>{
      'id': instance.id,
      'sup_item_type_id': instance.sup_item_type_id,
      'sup_item_category_id': instance.sup_item_category_id,
      'sup_item_sub_category_id': instance.sup_item_sub_category_id,
      'code': instance.code,
      'item_no': instance.item_no,
      'name': instance.name,
      'detail': instance.detail,
      'sup_unit_id': instance.sup_unit_id,
      'price': instance.price,
      'min': instance.min,
      'max': instance.max,
      'service_life': instance.service_life,
      'exp_date': instance.exp_date,
      'cost_year': instance.cost_year,
      'location': instance.location,
      'sup_vendor_id': instance.sup_vendor_id,
      'ac_money_type_id': instance.ac_money_type_id,
      'sup_pr_method_id': instance.sup_pr_method_id,
      'hr_ci_department_id': instance.hr_ci_department_id,
      'user_pr_id': instance.user_pr_id,
      'receive_date': instance.receive_date,
      'remark': instance.remark,
      'status': instance.status,
      'create_by': instance.create_by,
      'update_by': instance.update_by,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'unspsc': instance.unspsc,
      'hr_ci_work_id': instance.hr_ci_work_id,
      'gpsc': instance.gpsc,
      'type': instance.type,
      'code_his': instance.code_his,
      'unit_gfmis': instance.unit_gfmis,
      'med_type': instance.med_type,
      'med_pack': instance.med_pack,
      'image': instance.image,
      'sup_item_type': instance.sup_item_type,
      'sup_item_category': instance.sup_item_category,
      'sup_item_sub_category': instance.sup_item_sub_category,
      'sup_unit': instance.sup_unit,
      'sup_vendor': instance.sup_vendor,
      'ac_money_type': instance.ac_money_type,
      'sup_pr_method': instance.sup_pr_method,
      'hr_ci_department': instance.hr_ci_department,
      'hr_ci_work': instance.hr_ci_work,
      'user_pr': instance.user_pr,
    };
