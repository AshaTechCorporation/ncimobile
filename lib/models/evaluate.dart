import 'package:json_annotation/json_annotation.dart';

part 'evaluate.g.dart';

@JsonSerializable()
class Evaluate {
  int? id;
  int? project_id;
  String? topic;
  String? indicator_quantitative;
  String? indicator_qualitative;
  String? target_value;
  String? create_by;
  String? update_by;
  DateTime? created_at;
  DateTime? updated_at;
  String? topic_detail;
  Evaluate({
    this.id,
    this.project_id,
    this.topic,
    this.indicator_quantitative,
    this.indicator_qualitative,
    this.target_value,
    this.create_by,
    this.update_by,
    this.created_at,
    this.updated_at,
    this.topic_detail,
  });

  factory Evaluate.fromJson(Map<String, dynamic> json) => _$EvaluateFromJson(json);

  Map<String, dynamic> toJson() => _$EvaluateToJson(this);
}
