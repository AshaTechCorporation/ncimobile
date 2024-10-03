import 'package:json_annotation/json_annotation.dart';

part 'prefix.g.dart';

@JsonSerializable()
class Prefix {
  int? id;
  String? code;
  String? name;
  String? short_name;
  bool? status;
  String? create_by;
  String? update_by;
  DateTime? created_at;
  DateTime? updated_at;
  String? gender;

  Prefix({
    this.id,
    this.code,
    this.name,
    this.short_name,
    this.status,
    this.create_by,
    this.update_by,
    this.created_at,
    this.updated_at,
    this.gender,
  });

  factory Prefix.fromJson(Map<String, dynamic> json) => _$PrefixFromJson(json);

  Map<String, dynamic> toJson() => _$PrefixToJson(this);
}
