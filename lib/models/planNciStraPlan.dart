import 'package:json_annotation/json_annotation.dart';

part 'planNciStraPlan.g.dart';

@JsonSerializable()
class PlanNciStraPlan {
  int? id;
  String? name;
  bool? status;
  String? create_by;
  String? update_by;
  int? plan_nci_stra_plan_id;
  DateTime? created_at;
  DateTime? updated_at;

  PlanNciStraPlan({
    this.id,
    this.name,
    this.status,
    this.create_by,
    this.update_by,
    this.plan_nci_stra_plan_id,
    this.created_at,
    this.updated_at,
  });

  factory PlanNciStraPlan.fromJson(Map<String, dynamic> json) => _$PlanNciStraPlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanNciStraPlanToJson(this);
}
