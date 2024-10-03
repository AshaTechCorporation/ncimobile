import 'package:json_annotation/json_annotation.dart';

part 'activityDetailExpensesExpenses.g.dart';

@JsonSerializable()
class ActivityDetailExpenses {
  int? id;
  String? price;
  String? unit;
  int? plan_activity_detail_id;
  DateTime? created_at;
  DateTime? updated_at;

  ActivityDetailExpenses({
    this.id,
    this.price,
    this.unit,
    this.plan_activity_detail_id,
    this.created_at,
    this.updated_at,
  });

  factory ActivityDetailExpenses.fromJson(Map<String, dynamic> json) => _$ActivityDetailExpensesFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityDetailExpensesToJson(this);
}
