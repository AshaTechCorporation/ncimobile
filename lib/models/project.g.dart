// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['fiscal_year'] as String?,
      json['code'] as String?,
      json['main_depart_id'] as String?,
      json['sub_depart_id'] as String?,
      json['rational'] as String?,
      json['government_name'] as String?,
      json['private_name'] as String?,
      json['is_government'] as bool?,
      json['is_private'] as bool?,
      json['group_target'] as String?,
      json['area_target'] as String?,
      json['co_agency'] as String?,
      (json['start_month'] as num?)?.toInt(),
      (json['start_year'] as num?)?.toInt(),
      (json['end_month'] as num?)?.toInt(),
      (json['end_year'] as num?)?.toInt(),
      json['result'] as String?,
      json['status'] as String?,
      (json['ci_mission_id'] as num?)?.toInt(),
      (json['ci_department_id'] as num?)?.toInt(),
      (json['plan_dms_strategic_plan_id'] as num?)?.toInt(),
      (json['plan_dms_strategic_id'] as num?)?.toInt(),
      (json['plan_nci_strategic_plan_id'] as num?)?.toInt(),
      (json['current_approve_id'] as num?)?.toInt(),
      json['create_by'] as String?,
      json['update_by'] == null
          ? null
          : DateTime.parse(json['update_by'] as String),
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      (json['money_type_id'] as num?)?.toInt(),
      (json['money_cat_id'] as num?)?.toInt(),
      (json['money_sub_cat_id'] as num?)?.toInt(),
      (json['project_type_id'] as num?)?.toInt(),
      json['rational_shot'] as String?,
      json['purpose'] as String?,
      json['plan_mph'] as String?,
      (json['project_form_id'] as num?)?.toInt(),
      json['project_special'] as String?,
      (json['plan_nci_strategic_id'] as num?)?.toInt(),
      (json['user_id'] as num?)?.toInt(),
      json['scenario_remark'] as String?,
      json['remark_activity'] as String?,
      json['total'] as String?,
      json['file_approve'] as String?,
      json['operation_result'] as String?,
      json['total_used'] as String?,
      json['total_balance'] as String?,
      json['problem'] as String?,
      json['comment'] as String?,
      json['result_to_public'] as String?,
      json['send_dms'] as bool?,
      json['status_reject'] as String?,
      (json['ci_work_id'] as num?)?.toInt(),
      json['close_target'] as String?,
      json['close_people'] as String?,
      (json['activities'] as List<dynamic>?)
          ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['responsible'] as List<dynamic>?)
          ?.map((e) => Responsible.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['money_type'] == null
          ? null
          : MoneyType.fromJson(json['money_type'] as Map<String, dynamic>),
      (json['risks'] as List<dynamic>?)
          ?.map((e) => Risk.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['evaluates'] as List<dynamic>?)
          ?.map((e) => Evaluate.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['main_department'] as String?,
      json['plan_nci_stra_plan'] == null
          ? null
          : PlanNciStraPlan.fromJson(
              json['plan_nci_stra_plan'] as Map<String, dynamic>),
      (json['histories'] as List<dynamic>?)
          ?.map((e) => Histories.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['scenario'] as List<dynamic>?)
          ?.map((e) => Scenario.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['project_form'] == null
          ? null
          : ProjectForm.fromJson(json['project_form'] as Map<String, dynamic>),
      (json['approvers'] as List<dynamic>?)
          ?.map((e) => Approvers.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['plan_project_head_approves'] as List<dynamic>?)
          ?.map((e) =>
              PlanProjectHeadApproves.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['plan_project_send_plan_approves'] as List<dynamic>?)
          ?.map((e) =>
              PlanProjectHeadApproves.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['plan_project_send_board_approves'] as List<dynamic>?)
          ?.map((e) =>
              PlanProjectHeadApproves.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['plan_project_operation_approves'] as List<dynamic>?)
          ?.map((e) =>
              PlanProjectHeadApproves.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['plan_project_operation_close_project_approves'] as List<dynamic>?)
          ?.map((e) =>
              PlanProjectHeadApproves.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fiscal_year': instance.fiscal_year,
      'code': instance.code,
      'main_depart_id': instance.main_depart_id,
      'sub_depart_id': instance.sub_depart_id,
      'rational': instance.rational,
      'government_name': instance.government_name,
      'private_name': instance.private_name,
      'is_government': instance.is_government,
      'is_private': instance.is_private,
      'group_target': instance.group_target,
      'area_target': instance.area_target,
      'co_agency': instance.co_agency,
      'start_month': instance.start_month,
      'start_year': instance.start_year,
      'end_month': instance.end_month,
      'end_year': instance.end_year,
      'result': instance.result,
      'status': instance.status,
      'ci_mission_id': instance.ci_mission_id,
      'ci_department_id': instance.ci_department_id,
      'plan_dms_strategic_plan_id': instance.plan_dms_strategic_plan_id,
      'plan_dms_strategic_id': instance.plan_dms_strategic_id,
      'plan_nci_strategic_plan_id': instance.plan_nci_strategic_plan_id,
      'current_approve_id': instance.current_approve_id,
      'create_by': instance.create_by,
      'update_by': instance.update_by?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'money_type_id': instance.money_type_id,
      'money_cat_id': instance.money_cat_id,
      'money_sub_cat_id': instance.money_sub_cat_id,
      'project_type_id': instance.project_type_id,
      'rational_shot': instance.rational_shot,
      'purpose': instance.purpose,
      'plan_mph': instance.plan_mph,
      'project_form_id': instance.project_form_id,
      'project_special': instance.project_special,
      'plan_nci_strategic_id': instance.plan_nci_strategic_id,
      'user_id': instance.user_id,
      'scenario_remark': instance.scenario_remark,
      'remark_activity': instance.remark_activity,
      'total': instance.total,
      'file_approve': instance.file_approve,
      'operation_result': instance.operation_result,
      'total_used': instance.total_used,
      'total_balance': instance.total_balance,
      'problem': instance.problem,
      'comment': instance.comment,
      'result_to_public': instance.result_to_public,
      'send_dms': instance.send_dms,
      'status_reject': instance.status_reject,
      'ci_work_id': instance.ci_work_id,
      'close_target': instance.close_target,
      'close_people': instance.close_people,
      'activities': instance.activities,
      'responsible': instance.responsible,
      'money_type': instance.money_type,
      'risks': instance.risks,
      'evaluates': instance.evaluates,
      'main_department': instance.main_department,
      'plan_nci_stra_plan': instance.plan_nci_stra_plan,
      'histories': instance.histories,
      'scenario': instance.scenario,
      'project_form': instance.project_form,
      'approvers': instance.approvers,
      'plan_project_head_approves': instance.plan_project_head_approves,
      'plan_project_send_plan_approves':
          instance.plan_project_send_plan_approves,
      'plan_project_send_board_approves':
          instance.plan_project_send_board_approves,
      'plan_project_operation_approves':
          instance.plan_project_operation_approves,
      'plan_project_operation_close_project_approves':
          instance.plan_project_operation_close_project_approves,
    };
