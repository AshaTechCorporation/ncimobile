import 'package:json_annotation/json_annotation.dart';

part 'responsible.g.dart';

@JsonSerializable()
class Responsible {
  int? id;
  int? project_id;
  int? user_id;
  String? name;
  String? position;
  String? role;
  String? remark;
  String? phone;
  String? email;
  DateTime? created_at;
  DateTime? updated_at;

  Responsible({
    this.id,
    this.project_id,
    this.user_id,
    this.name,
    this.position,
    this.role,
    this.remark,
    this.phone,
    this.email,
    this.created_at,
    this.updated_at,
  });

  factory Responsible.fromJson(Map<String, dynamic> json) => _$ResponsibleFromJson(json);

  Map<String, dynamic> toJson() => _$ResponsibleToJson(this);
}
