import 'package:json_annotation/json_annotation.dart';

part 'risk.g.dart';

@JsonSerializable()
class Risk {
  int? id;
  int? projectId;
  String? topic;
  String? risk;
  String? defensive_control;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? mt_proj_risk_id;
  Risk({
    this.id,
    this.projectId,
    this.topic,
    this.risk,
    this.defensive_control,
    this.createdAt,
    this.updatedAt,
    this.mt_proj_risk_id,
  });

  factory Risk.fromJson(Map<String, dynamic> json) => _$RiskFromJson(json);

  Map<String, dynamic> toJson() => _$RiskToJson(this);
}
