// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      fname_en: json['fname_en'] as String?,
      lname_en: json['lname_en'] as String?,
      birthday: json['birthday'] == null ? null : DateTime.parse(json['birthday'] as String),
      line: json['line'] as String?,
      email: json['email'] as String?,
      tel: json['tel'] as String?,
      tel_2: json['tel_2'] as String?,
      citizen_address: json['citizen_address'] as String?,
      citizen_zip_code: json['citizen_zip_code'] as String?,
      current_address: json['current_address'] as String?,
      current_zip_code: json['current_zip_code'] as String?,
      finger_scan_no: json['finger_scan_no'] as String?,
      citizen_no: json['citizen_no'] as String?,
      employee_no: json['employee_no'] as String?,
      position_no: json['position_no'] as String?,
      salary: json['salary'] as String?,
      status: json['status'] as bool?,
      sex: json['sex'] as String?,
      prefix_id: (json['prefix_id'] as num?)?.toInt(),
      blood_type_id: (json['blood_type_id'] as num?)?.toInt(),
      branch_id: (json['branch_id'] as num?)?.toInt(),
      marital_status_id: (json['marital_status_id'] as num?)?.toInt(),
      nationality_id: (json['nationality_id'] as num?)?.toInt(),
      ethnicity_id: (json['ethnicity_id'] as num?)?.toInt(),
      religion_id: (json['religion_id'] as num?)?.toInt(),
      employee_type_id: (json['employee_type_id'] as num?)?.toInt(),
      position_type_id: (json['position_type_id'] as num?)?.toInt(),
      position_level_id: (json['position_level_id'] as num?)?.toInt(),
      position_id: (json['position_id'] as num?)?.toInt(),
      ci_position_id: (json['ci_position_id'] as num?)?.toInt(),
      movement_type_id: (json['movement_type_id'] as num?)?.toInt(),
      qualification_id: (json['qualification_id'] as num?)?.toInt(),
      education_id: (json['education_id'] as num?)?.toInt(),
      special_government_type_id: (json['special_government_type_id'] as num?)?.toInt(),
      special_government_project_id: (json['special_government_project_id'] as num?)?.toInt(),
      ci_mission_id: (json['ci_mission_id'] as num?)?.toInt(),
      ci_department_id: (json['ci_department_id'] as num?)?.toInt(),
      ci_work_id: (json['ci_work_id'] as num?)?.toInt(),
      ci_unit_id: (json['ci_unit_id'] as num?)?.toInt(),
      md_mission_id: (json['md_mission_id'] as num?)?.toInt(),
      md_department_id: (json['md_department_id'] as num?)?.toInt(),
      md_work_id: (json['md_work_id'] as num?)?.toInt(),
      md_unit_id: (json['md_unit_id'] as num?)?.toInt(),
      goverment_reg_date: json['goverment_reg_date'] == null ? null : DateTime.parse(json['goverment_reg_date'] as String),
      probation_pass_date: json['probation_pass_date'] == null ? null : DateTime.parse(json['probation_pass_date'] as String),
      create_by: json['create_by'] as String?,
      update_by: json['update_by'] as String?,
      created_at: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
      citizen_province_id: (json['citizen_province_id'] as num?)?.toInt(),
      citizen_amphure_id: (json['citizen_amphure_id'] as num?)?.toInt(),
      citizen_tambon_id: (json['citizen_tambon_id'] as num?)?.toInt(),
      current_province_id: (json['current_province_id'] as num?)?.toInt(),
      current_amphure_id: (json['current_amphure_id'] as num?)?.toInt(),
      current_tambon_id: (json['current_tambon_id'] as num?)?.toInt(),
      register_date: json['register_date'] == null ? null : DateTime.parse(json['register_date'] as String),
      citizen_road: json['citizen_road'] as String?,
      citizen_alley: json['citizen_alley'] as String?,
      current_road: json['current_road'] as String?,
      current_alley: json['current_alley'] as String?,
      position_floor_id: (json['position_floor_id'] as num?)?.toInt(),
      compensation: json['compensation'] as String?,
      signature: json['signature'] as String?,
      goverment_status: json['goverment_status'] as String?,
      side_id: (json['side_id'] as num?)?.toInt(),
      course_balance: json['course_balance'] as String?,
      date_notify_position_advance: json['date_notify_position_advance'] == null ? null : DateTime.parse(json['date_notify_position_advance'] as String),
      hr_group_work_education_id: (json['hr_group_work_education_id'] as num?)?.toInt(),
      detail_notify_position_advance: json['detail_notify_position_advance'] as String?,
      finger_scan_no_old: json['finger_scan_no_old'] as String?,
      hr_work_shift_type_id: (json['hr_work_shift_type_id'] as num?)?.toInt(),
      seq_ward: (json['seq_ward'] as num?)?.toInt(),
      resignation_date: json['resignation_date'] == null ? null : DateTime.parse(json['resignation_date'] as String),
      comeback_date: json['comeback_date'] == null ? null : DateTime.parse(json['comeback_date'] as String),
      move_status: json['move_status'] as String?,
      father_fname: json['father_fname'] as String?,
      father_lname: json['father_lname'] as String?,
      mother_fname: json['mother_fname'] as String?,
      mother_lname: json['mother_lname'] as String?,
      old_mother_lname: json['old_mother_lname'] as String?,
      spouse_fname: json['spouse_fname'] as String?,
      spouse_lname: json['spouse_lname'] as String?,
      old_spouse_lname: json['old_spouse_lname'] as String?,
      social_status: json['social_status'] as bool?,
      pvd_status: json['pvd_status'] as bool?,
      payroll_status: json['payroll_status'] as bool?,
      agency: json['agency'] as String?,
      prefix: json['prefix'] == null ? null : Prefix.fromJson(json['prefix'] as Map<String, dynamic>),
      employee_type: json['employee_type'] == null ? null : CodeName.fromJson(json['employee_type'] as Map<String, dynamic>),
      position_type: json['position_type'] == null ? null : CodeName.fromJson(json['position_type'] as Map<String, dynamic>),
      position_level: json['position_level'] == null ? null : CodeName.fromJson(json['position_level'] as Map<String, dynamic>),
      position: json['position'] == null ? null : CodeName.fromJson(json['position'] as Map<String, dynamic>),
      ci_mission: json['ci_mission'] == null ? null : CodeName.fromJson(json['ci_mission'] as Map<String, dynamic>),
      ci_department: json['ci_department'] == null ? null : CodeName.fromJson(json['ci_department'] as Map<String, dynamic>),
      ci_work: json['ci_work'] == null ? null : CodeName.fromJson(json['ci_work'] as Map<String, dynamic>),
      ci_unit: json['ci_unit'] == null ? null : CodeName.fromJson(json['ci_unit'] as Map<String, dynamic>),
      md_mission: json['md_mission'] == null ? null : CodeName.fromJson(json['md_mission'] as Map<String, dynamic>),
      md_department: json['md_department'] == null ? null : CodeName.fromJson(json['md_department'] as Map<String, dynamic>),
      md_work: json['md_work'] == null ? null : CodeName.fromJson(json['md_work'] as Map<String, dynamic>),
      md_unit: json['md_unit'] == null ? null : CodeName.fromJson(json['md_unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'fname': instance.fname,
      'lname': instance.lname,
      'fname_en': instance.fname_en,
      'lname_en': instance.lname_en,
      'birthday': instance.birthday?.toIso8601String(),
      'line': instance.line,
      'email': instance.email,
      'tel': instance.tel,
      'tel_2': instance.tel_2,
      'citizen_address': instance.citizen_address,
      'citizen_zip_code': instance.citizen_zip_code,
      'current_address': instance.current_address,
      'current_zip_code': instance.current_zip_code,
      'finger_scan_no': instance.finger_scan_no,
      'citizen_no': instance.citizen_no,
      'employee_no': instance.employee_no,
      'position_no': instance.position_no,
      'salary': instance.salary,
      'status': instance.status,
      'sex': instance.sex,
      'prefix_id': instance.prefix_id,
      'blood_type_id': instance.blood_type_id,
      'branch_id': instance.branch_id,
      'marital_status_id': instance.marital_status_id,
      'nationality_id': instance.nationality_id,
      'ethnicity_id': instance.ethnicity_id,
      'religion_id': instance.religion_id,
      'employee_type_id': instance.employee_type_id,
      'position_type_id': instance.position_type_id,
      'position_level_id': instance.position_level_id,
      'position_id': instance.position_id,
      'ci_position_id': instance.ci_position_id,
      'movement_type_id': instance.movement_type_id,
      'qualification_id': instance.qualification_id,
      'education_id': instance.education_id,
      'special_government_type_id': instance.special_government_type_id,
      'special_government_project_id': instance.special_government_project_id,
      'ci_mission_id': instance.ci_mission_id,
      'ci_department_id': instance.ci_department_id,
      'ci_work_id': instance.ci_work_id,
      'ci_unit_id': instance.ci_unit_id,
      'md_mission_id': instance.md_mission_id,
      'md_department_id': instance.md_department_id,
      'md_work_id': instance.md_work_id,
      'md_unit_id': instance.md_unit_id,
      'goverment_reg_date': instance.goverment_reg_date?.toIso8601String(),
      'probation_pass_date': instance.probation_pass_date?.toIso8601String(),
      'create_by': instance.create_by,
      'update_by': instance.update_by,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'citizen_province_id': instance.citizen_province_id,
      'citizen_amphure_id': instance.citizen_amphure_id,
      'citizen_tambon_id': instance.citizen_tambon_id,
      'current_province_id': instance.current_province_id,
      'current_amphure_id': instance.current_amphure_id,
      'current_tambon_id': instance.current_tambon_id,
      'register_date': instance.register_date?.toIso8601String(),
      'citizen_road': instance.citizen_road,
      'citizen_alley': instance.citizen_alley,
      'current_road': instance.current_road,
      'current_alley': instance.current_alley,
      'position_floor_id': instance.position_floor_id,
      'compensation': instance.compensation,
      'signature': instance.signature,
      'goverment_status': instance.goverment_status,
      'side_id': instance.side_id,
      'course_balance': instance.course_balance,
      'date_notify_position_advance': instance.date_notify_position_advance?.toIso8601String(),
      'hr_group_work_education_id': instance.hr_group_work_education_id,
      'detail_notify_position_advance': instance.detail_notify_position_advance,
      'finger_scan_no_old': instance.finger_scan_no_old,
      'hr_work_shift_type_id': instance.hr_work_shift_type_id,
      'seq_ward': instance.seq_ward,
      'resignation_date': instance.resignation_date?.toIso8601String(),
      'comeback_date': instance.comeback_date?.toIso8601String(),
      'move_status': instance.move_status,
      'father_fname': instance.father_fname,
      'father_lname': instance.father_lname,
      'mother_fname': instance.mother_fname,
      'mother_lname': instance.mother_lname,
      'old_mother_lname': instance.old_mother_lname,
      'spouse_fname': instance.spouse_fname,
      'spouse_lname': instance.spouse_lname,
      'old_spouse_lname': instance.old_spouse_lname,
      'social_status': instance.social_status,
      'pvd_status': instance.pvd_status,
      'payroll_status': instance.payroll_status,
      'agency': instance.agency,
      'prefix': instance.prefix,
      'employee_type': instance.employee_type,
      'position_type': instance.position_type,
      'position_level': instance.position_level,
      'position': instance.position,
      'ci_mission': instance.ci_mission,
      'ci_department': instance.ci_department,
      'ci_work': instance.ci_work,
      'ci_unit': instance.ci_unit,
      'md_mission': instance.md_mission,
      'md_department': instance.md_department,
      'md_work': instance.md_work,
      'md_unit': instance.md_unit,
    };