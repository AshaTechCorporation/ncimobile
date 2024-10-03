import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/user.dart';

part 'planProjectHeadApproves.g.dart';

@JsonSerializable()
class PlanProjectHeadApproves {
  int? id;
  int? plan_project_id;
  int? seq;
  int? user_id;
  String? approved;
  String? remark;
  String? approved_at;
  String? name;
  String? position;
  String? signature;
  String? prefix;
  String? position_type;
  String? department;
  String? role;
  String? type;
  bool? status;
  DateTime? created_at;
  DateTime? updated_at;
  User? user;
  PlanProjectHeadApproves({
    this.id,
    this.plan_project_id,
    this.seq,
    this.user_id,
    this.approved,
    this.remark,
    this.approved_at,
    this.name,
    this.position,
    this.signature,
    this.prefix,
    this.position_type,
    this.department,
    this.role,
    this.type,
    this.status,
    this.created_at,
    this.updated_at,
  });

  factory PlanProjectHeadApproves.fromJson(Map<String, dynamic> json) => _$PlanProjectHeadApprovesFromJson(json);

  Map<String, dynamic> toJson() => _$PlanProjectHeadApprovesToJson(this);
}
