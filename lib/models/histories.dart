import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/user.dart';

part 'histories.g.dart';

@JsonSerializable()
class Histories {
  int? id;
  int? project_id;
  String? title;
  int? user_id;
  String? remark;
  DateTime? created_at;
  DateTime? updated_at;
  User? user;

  Histories({
    this.id,
    this.project_id,
    this.title,
    this.user_id,
    this.remark,
    this.created_at,
    this.updated_at,
    this.user,
  });

  factory Histories.fromJson(Map<String, dynamic> json) => _$HistoriesFromJson(json);

  Map<String, dynamic> toJson() => _$HistoriesToJson(this);
}
