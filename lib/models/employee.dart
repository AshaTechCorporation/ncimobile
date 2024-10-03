import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/codeName.dart';
import 'package:ncimobile/models/prefix.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  int? id;
  String? code;
  String? fname;
  String? lname;
  String? fname_en;
  String? lname_en;
  DateTime? birthday;
  String? line;
  String? email;
  String? tel;
  String? tel_2;
  String? citizen_address;
  String? citizen_zip_code;
  String? current_address;
  String? current_zip_code;
  String? finger_scan_no;
  String? citizen_no;
  String? employee_no;
  String? position_no;
  String? salary;
  bool? status;
  String? sex;
  int? prefix_id;
  int? blood_type_id;
  int? branch_id;
  int? marital_status_id;
  int? nationality_id;
  int? ethnicity_id;
  int? religion_id;
  int? employee_type_id;
  int? position_type_id;
  int? position_level_id;
  int? position_id;
  int? ci_position_id;
  int? movement_type_id;
  int? qualification_id;
  int? education_id;
  int? special_government_type_id;
  int? special_government_project_id;
  int? ci_mission_id;
  int? ci_department_id;
  int? ci_work_id;
  int? ci_unit_id;
  int? md_mission_id;
  int? md_department_id;
  int? md_work_id;
  int? md_unit_id;
  DateTime? goverment_reg_date;
  DateTime? probation_pass_date;
  String? create_by;
  String? update_by;
  DateTime? created_at;
  DateTime? updated_at;
  int? citizen_province_id;
  int? citizen_amphure_id;
  int? citizen_tambon_id;
  int? current_province_id;
  int? current_amphure_id;
  int? current_tambon_id;
  DateTime? register_date;
  String? citizen_road;
  String? citizen_alley;
  String? current_road;
  String? current_alley;
  int? position_floor_id;
  String? compensation;
  String? signature;
  String? goverment_status;
  int? side_id;
  String? course_balance;
  DateTime? date_notify_position_advance;
  int? hr_group_work_education_id;
  String? detail_notify_position_advance;
  String? finger_scan_no_old;
  int? hr_work_shift_type_id;
  int? seq_ward;
  DateTime? resignation_date;
  DateTime? comeback_date;
  String? move_status;
  String? father_fname;
  String? father_lname;
  String? mother_fname;
  String? mother_lname;
  String? old_mother_lname;
  String? spouse_fname;
  String? spouse_lname;
  String? old_spouse_lname;
  bool? social_status;
  bool? pvd_status;
  bool? payroll_status;
  String? agency;
  Prefix? prefix;
  CodeName? employee_type;
  CodeName? position_type;
  CodeName? position_level;
  CodeName? position;
  CodeName? ci_mission;
  CodeName? ci_department;
  CodeName? ci_work;
  CodeName? ci_unit;
  CodeName? md_mission;
  CodeName? md_department;
  CodeName? md_work;
  CodeName? md_unit;

  Employee({
    this.id,
    this.code,
    this.fname,
    this.lname,
    this.fname_en,
    this.lname_en,
    this.birthday,
    this.line,
    this.email,
    this.tel,
    this.tel_2,
    this.citizen_address,
    this.citizen_zip_code,
    this.current_address,
    this.current_zip_code,
    this.finger_scan_no,
    this.citizen_no,
    this.employee_no,
    this.position_no,
    this.salary,
    this.status,
    this.sex,
    this.prefix_id,
    this.blood_type_id,
    this.branch_id,
    this.marital_status_id,
    this.nationality_id,
    this.ethnicity_id,
    this.religion_id,
    this.employee_type_id,
    this.position_type_id,
    this.position_level_id,
    this.position_id,
    this.ci_position_id,
    this.movement_type_id,
    this.qualification_id,
    this.education_id,
    this.special_government_type_id,
    this.special_government_project_id,
    this.ci_mission_id,
    this.ci_department_id,
    this.ci_work_id,
    this.ci_unit_id,
    this.md_mission_id,
    this.md_department_id,
    this.md_work_id,
    this.md_unit_id,
    this.goverment_reg_date,
    this.probation_pass_date,
    this.create_by,
    this.update_by,
    this.created_at,
    this.updated_at,
    this.citizen_province_id,
    this.citizen_amphure_id,
    this.citizen_tambon_id,
    this.current_province_id,
    this.current_amphure_id,
    this.current_tambon_id,
    this.register_date,
    this.citizen_road,
    this.citizen_alley,
    this.current_road,
    this.current_alley,
    this.position_floor_id,
    this.compensation,
    this.signature,
    this.goverment_status,
    this.side_id,
    this.course_balance,
    this.date_notify_position_advance,
    this.hr_group_work_education_id,
    this.detail_notify_position_advance,
    this.finger_scan_no_old,
    this.hr_work_shift_type_id,
    this.seq_ward,
    this.resignation_date,
    this.comeback_date,
    this.move_status,
    this.father_fname,
    this.father_lname,
    this.mother_fname,
    this.mother_lname,
    this.old_mother_lname,
    this.spouse_fname,
    this.spouse_lname,
    this.old_spouse_lname,
    this.social_status,
    this.pvd_status,
    this.payroll_status,
    this.agency,
    this.prefix,
    this.employee_type,
    this.position_type,
    this.position_level,
    this.position,
    this.ci_mission,
    this.ci_department,
    this.ci_work,
    this.ci_unit,
    this.md_mission,
    this.md_department,
    this.md_work,
    this.md_unit,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
