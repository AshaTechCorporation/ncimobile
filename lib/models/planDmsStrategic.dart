import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/planDmsDtrategicPlan.dart';

part 'planDmsStrategic.g.dart';

@JsonSerializable()
class PlanDmsStrategic {
  final int id;
  final String name;
  final bool status;
  final String? create_by;
  final String? update_by;
  final int plan_dms_strategic_plan_id;
  final DateTime created_at;
  final DateTime updated_at;
  final PlanDmsDtrategicPlan plan_dms_dtrategic_plan;

  PlanDmsStrategic({
    required this.id,
    required this.name,
    required this.status,
    this.create_by,
    this.update_by,
    required this.plan_dms_strategic_plan_id,
    required this.created_at,
    required this.updated_at,
    required this.plan_dms_dtrategic_plan,
  });

  factory PlanDmsStrategic.fromJson(Map<String, dynamic> json) => _$PlanDmsStrategicFromJson(json);

  Map<String, dynamic> toJson() => _$PlanDmsStrategicToJson(this);
}
