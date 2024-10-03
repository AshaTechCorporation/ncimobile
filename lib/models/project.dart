import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/activities.dart';
import 'package:ncimobile/models/approvers.dart';
import 'package:ncimobile/models/evaluate.dart';
import 'package:ncimobile/models/histories.dart';
import 'package:ncimobile/models/moneyType.dart';
import 'package:ncimobile/models/planNciStraPlan.dart';
import 'package:ncimobile/models/planProjectHeadApproves.dart';
import 'package:ncimobile/models/projectForm.dart';
import 'package:ncimobile/models/responsible.dart';
import 'package:ncimobile/models/risk.dart';
import 'package:ncimobile/models/scenario.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  int? id;
  String? name;
  String? fiscal_year;
  String? code;
  String? main_depart_id;
  String? sub_depart_id;
  String? rational;
  String? government_name;
  String? private_name;
  bool? is_government;
  bool? is_private;
  String? group_target;
  String? area_target;
  String? co_agency;
  int? start_month;
  int? start_year;
  int? end_month;
  int? end_year;
  String? result;
  String? status;
  int? ci_mission_id;
  int? ci_department_id;
  int? plan_dms_strategic_plan_id;
  int? plan_dms_strategic_id;
  int? plan_nci_strategic_plan_id;
  int? current_approve_id;
  String? create_by;
  DateTime? update_by;
  DateTime? created_at;
  DateTime? updated_at;
  int? money_type_id;
  int? money_cat_id;
  int? money_sub_cat_id;
  int? project_type_id;
  String? rational_shot;
  String? purpose;
  String? plan_mph;
  int? project_form_id;
  String? project_special;
  int? plan_nci_strategic_id;
  int? user_id;
  String? scenario_remark;
  String? remark_activity;
  String? total;
  String? file_approve;
  String? operation_result;
  String? total_used;
  String? total_balance;
  String? problem;
  String? comment;
  String? result_to_public;
  bool? send_dms;
  String? status_reject;
  int? ci_work_id;
  String? close_target;
  String? close_people;
  List<Activity>? activities;
  List<Responsible>? responsible;
  MoneyType? money_type;
  List<Risk>? risks;
  List<Evaluate>? evaluates;
  String? main_department;
  PlanNciStraPlan? plan_nci_stra_plan;
  List<Histories>? histories;
  List<Scenario>? scenario;
  ProjectForm? project_form;
  List<Approvers>? approvers;
  List<PlanProjectHeadApproves>? plan_project_head_approves;
  List<PlanProjectHeadApproves>? plan_project_send_plan_approves;
  List<PlanProjectHeadApproves>? plan_project_send_board_approves;
  List<PlanProjectHeadApproves>? plan_project_operation_approves;
  List<PlanProjectHeadApproves>? plan_project_operation_close_project_approves;

  Project(
    this.id,
    this.name,
    this.fiscal_year,
    this.code,
    this.main_depart_id,
    this.sub_depart_id,
    this.rational,
    this.government_name,
    this.private_name,
    this.is_government,
    this.is_private,
    this.group_target,
    this.area_target,
    this.co_agency,
    this.start_month,
    this.start_year,
    this.end_month,
    this.end_year,
    this.result,
    this.status,
    this.ci_mission_id,
    this.ci_department_id,
    this.plan_dms_strategic_plan_id,
    this.plan_dms_strategic_id,
    this.plan_nci_strategic_plan_id,
    this.current_approve_id,
    this.create_by,
    this.update_by,
    this.created_at,
    this.updated_at,
    this.money_type_id,
    this.money_cat_id,
    this.money_sub_cat_id,
    this.project_type_id,
    this.rational_shot,
    this.purpose,
    this.plan_mph,
    this.project_form_id,
    this.project_special,
    this.plan_nci_strategic_id,
    this.user_id,
    this.scenario_remark,
    this.remark_activity,
    this.total,
    this.file_approve,
    this.operation_result,
    this.total_used,
    this.total_balance,
    this.problem,
    this.comment,
    this.result_to_public,
    this.send_dms,
    this.status_reject,
    this.ci_work_id,
    this.close_target,
    this.close_people,
    this.activities,
    this.responsible,
    this.money_type,
    this.risks,
    this.evaluates,
    this.main_department,
    this.plan_nci_stra_plan,
    this.histories,
    this.scenario,
    this.project_form,
    this.approvers,
    this.plan_project_head_approves,
    this.plan_project_send_plan_approves,
    this.plan_project_send_board_approves,
    this.plan_project_operation_approves,
    this.plan_project_operation_close_project_approves,
  );

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
