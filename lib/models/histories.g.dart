// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'histories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Histories _$HistoriesFromJson(Map<String, dynamic> json) => Histories(
      id: (json['id'] as num?)?.toInt(),
      project_id: (json['project_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      user_id: (json['user_id'] as num?)?.toInt(),
      remark: json['remark'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoriesToJson(Histories instance) => <String, dynamic>{
      'id': instance.id,
      'project_id': instance.project_id,
      'title': instance.title,
      'user_id': instance.user_id,
      'remark': instance.remark,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'user': instance.user,
    };
