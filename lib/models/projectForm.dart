import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/planDmsStrategic.dart';

part 'projectForm.g.dart';

@JsonSerializable()
class ProjectForm {
  int? id;
  String? name;
  String? strategy_on;
  String? strategy_target;
  String? strategy_point;
  String? under_strategy_point;
  String? under_strategy_target;
  String? under_strategy_sub_plan;
  String? under_strategy_sub_plan_target;
  String? action_plan_of_mph;
  String? dms_target;
  String? dms_acition_title;
  String? dms_strategy;
  String? dms_indicator;
  bool? status;
  String? create_by;
  String? update_by;
  DateTime? created_at;
  DateTime? updated_at;
  int? plan_dms_strategic_id;
  PlanDmsStrategic? plan_dms_strategic;

  ProjectForm({
    this.id,
    this.name,
    this.strategy_on,
    this.strategy_target,
    this.strategy_point,
    this.under_strategy_point,
    this.under_strategy_target,
    this.under_strategy_sub_plan,
    this.under_strategy_sub_plan_target,
    this.action_plan_of_mph,
    this.dms_target,
    this.dms_acition_title,
    this.dms_strategy,
    this.dms_indicator,
    this.status,
    this.create_by,
    this.update_by,
    this.created_at,
    this.updated_at,
    this.plan_dms_strategic_id,
    this.plan_dms_strategic,
  });

  factory ProjectForm.fromJson(Map<String, dynamic> json) => _$ProjectFormFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectFormToJson(this);
}
