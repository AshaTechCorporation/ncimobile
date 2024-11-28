import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/employee.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  int? permission_id;
  int? employee_id;
  String? username;
  bool? status;
  String? image;
  Employee? employee;
  Employee? hr_employee;

  User({
    this.id,
    this.permission_id,
    this.employee_id,
    this.username,
    this.status,
    this.image,
    this.employee,
    this.hr_employee,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
