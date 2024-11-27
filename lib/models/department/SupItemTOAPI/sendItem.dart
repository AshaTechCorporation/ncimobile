import 'package:json_annotation/json_annotation.dart';

part 'sendItem.g.dart';

@JsonSerializable()
class SendItem {
  int? sup_item_id;
  int? sup_unit_id;
  int? volume;
  int? pack;
  int? qty;
  int? price_per_unit;
  int? price;
  int? price_pay;
  int? dept_current_balance;
  int? stock_current_balance;

  SendItem({
    this.sup_item_id,
    this.sup_unit_id,
    this.volume,
    this.pack,
    this.qty,
    this.price_per_unit,
    this.price,
    this.price_pay,
    this.dept_current_balance,
    this.stock_current_balance,
  });

  factory SendItem.fromJson(Map<String, dynamic> json) => _$SendItemFromJson(json);

  Map<String, dynamic> toJson() => _$SendItemToJson(this);
}
