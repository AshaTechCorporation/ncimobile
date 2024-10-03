// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activityDetailExpensesExpenses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityDetailExpenses _$ActivityDetailExpensesFromJson(
        Map<String, dynamic> json) =>
    ActivityDetailExpenses(
      id: (json['id'] as num?)?.toInt(),
      price: json['price'] as String?,
      unit: json['unit'] as String?,
      plan_activity_detail_id:
          (json['plan_activity_detail_id'] as num?)?.toInt(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ActivityDetailExpensesToJson(
        ActivityDetailExpenses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'unit': instance.unit,
      'plan_activity_detail_id': instance.plan_activity_detail_id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
