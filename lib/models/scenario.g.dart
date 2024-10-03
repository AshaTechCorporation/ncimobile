// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scenario _$ScenarioFromJson(Map<String, dynamic> json) => Scenario(
      id: (json['id'] as num?)?.toInt(),
      topic: json['topic'] as String?,
      jan_price: json['jan_price'] as String?,
      feb_price: json['feb_price'] as String?,
      mar_price: json['mar_price'] as String?,
      apr_price: json['apr_price'] as String?,
      may_price: json['may_price'] as String?,
      jun_price: json['jun_price'] as String?,
      jul_price: json['jul_price'] as String?,
      aug_price: json['aug_price'] as String?,
      sept_price: json['sept_price'] as String?,
      oct_price: json['oct_price'] as String?,
      nov_price: json['nov_price'] as String?,
      dec_price: json['dec_price'] as String?,
      jan_check: json['jan_check'] as bool?,
      feb_check: json['feb_check'] as bool?,
      mar_check: json['mar_check'] as bool?,
      apr_check: json['apr_check'] as bool?,
      may_check: json['may_check'] as bool?,
      jun_check: json['jun_check'] as bool?,
      jul_check: json['jul_check'] as bool?,
      aug_check: json['aug_check'] as bool?,
      sept_check: json['sept_check'] as bool?,
      oct_check: json['oct_check'] as bool?,
      nov_check: json['nov_check'] as bool?,
      dec_check: json['dec_check'] as bool?,
      project_id: (json['project_id'] as num?)?.toInt(),
      total: json['total'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ScenarioToJson(Scenario instance) => <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'jan_price': instance.jan_price,
      'feb_price': instance.feb_price,
      'mar_price': instance.mar_price,
      'apr_price': instance.apr_price,
      'may_price': instance.may_price,
      'jun_price': instance.jun_price,
      'jul_price': instance.jul_price,
      'aug_price': instance.aug_price,
      'sept_price': instance.sept_price,
      'oct_price': instance.oct_price,
      'nov_price': instance.nov_price,
      'dec_price': instance.dec_price,
      'jan_check': instance.jan_check,
      'feb_check': instance.feb_check,
      'mar_check': instance.mar_check,
      'apr_check': instance.apr_check,
      'may_check': instance.may_check,
      'jun_check': instance.jun_check,
      'jul_check': instance.jul_check,
      'aug_check': instance.aug_check,
      'sept_check': instance.sept_check,
      'oct_check': instance.oct_check,
      'nov_check': instance.nov_check,
      'dec_check': instance.dec_check,
      'project_id': instance.project_id,
      'total': instance.total,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
