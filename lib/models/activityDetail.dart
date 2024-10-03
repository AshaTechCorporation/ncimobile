import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/activityDetailExpensesExpenses.dart';

part 'activityDetail.g.dart';

@JsonSerializable()
class ActivityDetail {
  int? id;
  int? activity_id;
  String? name;
  String? cost;
  String? create_by;
  String? update_by;
  DateTime? created_at;
  DateTime? updated_at;
  int? expen_id;
  int? expen_sub_id;
  String? code;
  List<ActivityDetailExpenses>? activity_detail_expenses;

  ActivityDetail({
    this.id,
    this.activity_id,
    this.name,
    this.cost,
    this.create_by,
    this.update_by,
    this.created_at,
    this.updated_at,
    this.expen_id,
    this.expen_sub_id,
    this.code,
    this.activity_detail_expenses,
  });

  factory ActivityDetail.fromJson(Map<String, dynamic> json) => _$ActivityDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityDetailToJson(this);
}
