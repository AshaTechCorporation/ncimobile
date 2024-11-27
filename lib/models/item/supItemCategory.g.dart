// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supItemCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupItemCategory _$SupItemCategoryFromJson(Map<String, dynamic> json) =>
    SupItemCategory(
      id: (json['id'] as num?)?.toInt(),
      sup_item_type_id: (json['sup_item_type_id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      short_name: json['short_name'] as String?,
      status: json['status'] as bool?,
      item_group: json['item_group'] as String?,
      service_life: (json['service_life'] as num?)?.toInt(),
      sup_item_type: json['sup_item_type'] == null
          ? null
          : SupItemType.fromJson(json['sup_item_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SupItemCategoryToJson(SupItemCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sup_item_type_id': instance.sup_item_type_id,
      'code': instance.code,
      'name': instance.name,
      'short_name': instance.short_name,
      'status': instance.status,
      'item_group': instance.item_group,
      'service_life': instance.service_life,
      'sup_item_type': instance.sup_item_type,
    };
