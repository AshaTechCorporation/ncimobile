import 'package:json_annotation/json_annotation.dart';

part 'moneyType.g.dart';

@JsonSerializable()
class MoneyType {
  int? id;
  String? code;
  String? name;
  String? short_name;
  bool? status;
  String? createBy;
  String? updateBy;
  DateTime? created_at;
  DateTime? updated_at;

  MoneyType({
    this.id,
    this.code,
    this.name,
    this.short_name,
    this.status,
    this.createBy,
    this.updateBy,
    this.created_at,
    this.updated_at,
  });

  factory MoneyType.fromJson(Map<String, dynamic> json) => _$MoneyTypeFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyTypeToJson(this);
}
