import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/item/supItem.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  int? sup_item_id;
  int? stock_department;
  int? dept_current_balance;
  int? stock_current_balance;
  SupItem? sup_item;

  Item({
    this.sup_item_id,
    this.stock_department,
    this.dept_current_balance,
    this.stock_current_balance,
    this.sup_item,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
