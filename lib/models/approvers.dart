import 'package:json_annotation/json_annotation.dart';

part 'approvers.g.dart';

@JsonSerializable()
class Approvers {
  int? id;
  int? project_id;
  int? sequence;
  int? user_id;
  String? status;
  String? approved_at;
  DateTime? created_at;
  DateTime? updated_at;
  String? name;
  String? position;
  String? role;
  String? remark;
  String? signature;
  String? prefix;
  String? positionType;
  String? department;
  String? employee;

  Approvers({
    this.id,
    this.project_id,
    this.sequence,
    this.user_id,
    this.status,
    this.approved_at,
    this.created_at,
    this.updated_at,
    this.name,
    this.position,
    this.role,
    this.remark,
    this.signature,
    this.prefix,
    this.positionType,
    this.department,
    this.employee,
  });

  factory Approvers.fromJson(Map<String, dynamic> json) => _$ApproversFromJson(json);

  Map<String, dynamic> toJson() => _$ApproversToJson(this);
}
