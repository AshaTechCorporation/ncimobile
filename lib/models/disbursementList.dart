import 'package:json_annotation/json_annotation.dart';

part 'disbursementList.g.dart';

@JsonSerializable()
class DisbursementList {
  String title;
  int subTitle;
  int qty;

  DisbursementList(
    this.title,
    this.subTitle,
    this.qty,
  );

  factory DisbursementList.fromJson(Map<String, dynamic> json) => _$DisbursementListFromJson(json);

  Map<String, dynamic> toJson() => _$DisbursementListToJson(this);
}
