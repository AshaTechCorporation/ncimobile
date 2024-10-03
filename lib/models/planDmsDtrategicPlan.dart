import 'package:json_annotation/json_annotation.dart';

part 'planDmsDtrategicPlan.g.dart';

@JsonSerializable()
class PlanDmsDtrategicPlan {
  int? id;
  String? name;

  PlanDmsDtrategicPlan({
    this.id,
    this.name,
  });

  factory PlanDmsDtrategicPlan.fromJson(Map<String, dynamic> json) => _$PlanDmsDtrategicPlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanDmsDtrategicPlanToJson(this);
}
