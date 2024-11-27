import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/item/supItemCategory.dart';
import 'package:ncimobile/models/item/supItemType.dart';

part 'supItem.g.dart';

@JsonSerializable()
class SupItem {
  final int? id;
  final int? sup_item_type_id;
  final int? sup_item_category_id;
  final int? sup_item_sub_category_id;
  final String? code;
  final String? item_no;
  final String? name;
  final String? detail;
  final int? sup_unit_id;
  final String? price;
  final int? min;
  final int? max;
  final int? service_life;
  final String? exp_date;
  final String? cost_year;
  final String? location;
  final int? sup_vendor_id;
  final int? ac_money_type_id;
  final int? sup_pr_method_id;
  final int? hr_ci_department_id;
  final int? user_pr_id;
  final String? receive_date;
  final String? remark;
  final bool? status;
  final String? create_by;
  final String? update_by;
  final DateTime? created_at;
  final DateTime? updated_at;
  final String? unspsc;
  final String? hr_ci_work_id;
  final String? gpsc;
  final String? type;
  final String? code_his;
  final String? unit_gfmis;
  final String? med_type;
  final String? med_pack;
  final String? image;
  SupItemType? sup_item_type;
  SupItemCategory? sup_item_category;
  final String? sup_item_sub_category;
  SupItemType? sup_unit;
  final String? sup_vendor;
  final String? ac_money_type;
  final String? sup_pr_method;
  final String? hr_ci_department;
  final String? hr_ci_work;
  final String? user_pr;

  SupItem({
    this.id,
    this.sup_item_type_id,
    this.sup_item_category_id,
    this.sup_item_sub_category_id,
    this.code,
    this.item_no,
    this.name,
    this.detail,
    this.sup_unit_id,
    this.price,
    this.min,
    this.max,
    this.service_life,
    this.exp_date,
    this.cost_year,
    this.location,
    this.sup_vendor_id,
    this.ac_money_type_id,
    this.sup_pr_method_id,
    this.hr_ci_department_id,
    this.user_pr_id,
    this.receive_date,
    this.remark,
    this.status,
    this.create_by,
    this.update_by,
    this.created_at,
    this.updated_at,
    this.unspsc,
    this.hr_ci_work_id,
    this.gpsc,
    this.type,
    this.code_his,
    this.unit_gfmis,
    this.med_type,
    this.med_pack,
    this.image,
    this.sup_item_type,
    this.sup_item_category,
    this.sup_item_sub_category,
    this.sup_unit,
    this.sup_vendor,
    this.ac_money_type,
    this.sup_pr_method,
    this.hr_ci_department,
    this.hr_ci_work,
    this.user_pr,
  });

  factory SupItem.fromJson(Map<String, dynamic> json) => _$SupItemFromJson(json);

  Map<String, dynamic> toJson() => _$SupItemToJson(this);
}
