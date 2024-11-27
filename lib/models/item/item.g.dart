// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      sup_item_id: (json['sup_item_id'] as num?)?.toInt(),
      stock_department: (json['stock_department'] as num?)?.toInt(),
      dept_current_balance: (json['dept_current_balance'] as num?)?.toInt(),
      stock_current_balance: (json['stock_current_balance'] as num?)?.toInt(),
      sup_item: json['sup_item'] == null
          ? null
          : SupItem.fromJson(json['sup_item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'sup_item_id': instance.sup_item_id,
      'stock_department': instance.stock_department,
      'dept_current_balance': instance.dept_current_balance,
      'stock_current_balance': instance.stock_current_balance,
      'sup_item': instance.sup_item,
    };
