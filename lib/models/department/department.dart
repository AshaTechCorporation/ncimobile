import 'package:json_annotation/json_annotation.dart';

part 'department.g.dart';

@JsonSerializable()
class Department {
  int? id;
  int? ci_mission_id;
  String? code;
  String? name;
  String? short_name;
  bool? status;
  String? code_his;
  String? type;
  String? tel;
  String? warehouse_key;
  String? name_eng;
  String? typci_missione;
  int? No;

  Department({
    this.id,
    this.ci_mission_id,
    this.code,
    this.name,
    this.short_name,
    this.status,
    this.code_his,
    this.type,
    this.tel,
    this.warehouse_key,
    this.name_eng,
    this.typci_missione,
    this.No,
  });

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
