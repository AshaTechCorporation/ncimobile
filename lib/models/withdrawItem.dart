import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/department/department.dart';
import 'package:ncimobile/models/item/item.dart';
import 'package:ncimobile/models/item/itemWithdraw.dart';
import 'package:ncimobile/models/user.dart';

part 'withdrawItem.g.dart';

@JsonSerializable()
class WithdrawItem {
  int? id;
  String? code;
  String? date;
  int? hr_ci_department_id;
  int? user_id;
  String? sup_pr_use;
  String? remark;
  String? approved;
  String? approved_remark;
  String? approved_by;
  String? approved_at;
  bool? status;
  String? payment_voucher_no;
  bool? sync_his;
  String? doc_no;
  int? No;
  Department? hr_ci_department;
  List<ItemWithdraw>? sup_item_trans;
  User? user;

  WithdrawItem({
    this.id,
    this.code,
    this.date,
    this.hr_ci_department_id,
    this.user_id,
    this.sup_pr_use,
    this.remark,
    this.approved,
    this.approved_remark,
    this.approved_by,
    this.approved_at,
    this.status,
    this.payment_voucher_no,
    this.sync_his,
    this.doc_no,
    this.No,
    this.hr_ci_department,
    this.sup_item_trans,
    this.user,
  });

  factory WithdrawItem.fromJson(Map<String, dynamic> json) => _$WithdrawItemFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawItemToJson(this);
}
