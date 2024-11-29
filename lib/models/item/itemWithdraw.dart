import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/item/supItem.dart';

part 'itemWithdraw.g.dart';

@JsonSerializable()
class ItemWithdraw {
  int? sup_item_id;
  int? stock_department;
  String? dept_current_balance;
  String? stock_current_balance;
  SupItem? sup_item;
  int? id;
  String? doc_type;
  String? type;
  String? sup_control_register_id;
  String? sup_acceptance_id;
  String? sup_withdraw_id;
  String? sup_transfer_id;
  String? sup_return_id;
  String? sup_borrow_id;
  String? date;
  int? stock;
  int? qty;
  int? balance;
  String? price_per_unit;
  String? price;
  String? price_pay;
  String? discount;
  String? total;
  int? hr_ci_department_id;
  int? hr_ci_department_2_id;
  bool? status;
  String? sup_vendor_id;
  String? exp_date;
  String? sup_item_return_id;
  String? lot_maker;
  String? asset_status;
  String? price_stock;
  String? price_qty;
  String? price_balance;
  int? sup_sub_withdraw_id;
  int? qty_req_withdraw;
  String? sup_deposit_id;
  String? brand;
  String? model;
  String? sup_acceptance_free_id;
  int? sup_unit_id;
  int? volume;
  int? pack;
  bool? register_asset_status;
  bool? send_his_status;
  String? sup_item_borrow_id;
  String? sup_item_trans_ref_id;
  String? sup_withdraw_line_id;
  String? remark;

  ItemWithdraw({
    this.sup_item_id,
    this.stock_department,
    this.dept_current_balance,
    this.stock_current_balance,
    this.sup_item,
    this.id,
    this.doc_type,
    this.type,
    this.sup_control_register_id,
    this.sup_acceptance_id,
    this.sup_withdraw_id,
    this.sup_transfer_id,
    this.sup_return_id,
    this.sup_borrow_id,
    this.date,
    this.stock,
    this.qty,
    this.balance,
    this.price_per_unit,
    this.price,
    this.price_pay,
    this.discount,
    this.total,
    this.hr_ci_department_id,
    this.hr_ci_department_2_id,
    this.status,
    this.sup_vendor_id,
    this.exp_date,
    this.sup_item_return_id,
    this.lot_maker,
    this.asset_status,
    this.price_stock,
    this.price_qty,
    this.price_balance,
    this.sup_sub_withdraw_id,
    this.qty_req_withdraw,
    this.sup_deposit_id,
    this.brand,
    this.model,
    this.sup_acceptance_free_id,
    this.sup_unit_id,
    this.volume,
    this.pack,
    this.register_asset_status,
    this.send_his_status,
    this.sup_item_borrow_id,
    this.sup_item_trans_ref_id,
    this.sup_withdraw_line_id,
    this.remark,
  });

  factory ItemWithdraw.fromJson(Map<String, dynamic> json) => _$ItemWithdrawFromJson(json);

  Map<String, dynamic> toJson() => _$ItemWithdrawToJson(this);
}
