import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/employee.dart';

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
  bool? status;

  WithdrawItem({
    this.id,
    this.code,
    this.date,
    this.hr_ci_department_id,
    this.user_id,
    this.sup_pr_use,
    this.remark,
    this.status,
  });

  factory WithdrawItem.fromJson(Map<String, dynamic> json) => _$WithdrawItemFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawItemToJson(this);
}
