import 'package:json_annotation/json_annotation.dart';

part 'codeName.g.dart';

@JsonSerializable()
class CodeName {
  int? id;
  String? name;
  String? code;

  CodeName({
    this.id,
    this.name,
    this.code,
  });

  factory CodeName.fromJson(Map<String, dynamic> json) => _$CodeNameFromJson(json);

  Map<String, dynamic> toJson() => _$CodeNameToJson(this);
}
