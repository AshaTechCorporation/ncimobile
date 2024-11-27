import 'package:json_annotation/json_annotation.dart';

part 'supItemType.g.dart';

@JsonSerializable()
class SupItemType {
  int? id;
  final String? code;
  final String? name;
  final String? short_name;
  final bool? status;

  SupItemType({
    this.id,
    this.code,
    this.name,
    this.short_name,
    this.status,
  });

  factory SupItemType.fromJson(Map<String, dynamic> json) => _$SupItemTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SupItemTypeToJson(this);
}
