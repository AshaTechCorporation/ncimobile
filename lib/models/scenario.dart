import 'package:json_annotation/json_annotation.dart';

part 'scenario.g.dart';

@JsonSerializable()
class Scenario {
  int? id;
  String? topic;
  String? jan_price;
  String? feb_price;
  String? mar_price;
  String? apr_price;
  String? may_price;
  String? jun_price;
  String? jul_price;
  String? aug_price;
  String? sept_price;
  String? oct_price;
  String? nov_price;
  String? dec_price;
  bool? jan_check;
  bool? feb_check;
  bool? mar_check;
  bool? apr_check;
  bool? may_check;
  bool? jun_check;
  bool? jul_check;
  bool? aug_check;
  bool? sept_check;
  bool? oct_check;
  bool? nov_check;
  bool? dec_check;
  int? project_id;
  String? total;
  DateTime? created_at;
  DateTime? updated_at;
  Scenario({
    this.id,
    this.topic,
    this.jan_price,
    this.feb_price,
    this.mar_price,
    this.apr_price,
    this.may_price,
    this.jun_price,
    this.jul_price,
    this.aug_price,
    this.sept_price,
    this.oct_price,
    this.nov_price,
    this.dec_price,
    this.jan_check,
    this.feb_check,
    this.mar_check,
    this.apr_check,
    this.may_check,
    this.jun_check,
    this.jul_check,
    this.aug_check,
    this.sept_check,
    this.oct_check,
    this.nov_check,
    this.dec_check,
    this.project_id,
    this.total,
    this.created_at,
    this.updated_at,
  });

  factory Scenario.fromJson(Map<String, dynamic> json) => _$ScenarioFromJson(json);

  Map<String, dynamic> toJson() => _$ScenarioToJson(this);
}
