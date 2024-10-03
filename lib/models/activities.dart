import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/activityDetail.dart';

part 'activities.g.dart';

@JsonSerializable()
class Activity {
  int? id;
  int? projectId;
  String? name;
  String? cost;
  String? process_in_month;
  DateTime? created_at;
  DateTime? updated_at;
  List<ActivityDetail>? details;

  Activity({
    this.id,
    this.projectId,
    this.name,
    this.cost,
    this.process_in_month,
    this.created_at,
    this.updated_at,
    this.details,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
