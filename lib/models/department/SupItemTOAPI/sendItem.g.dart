// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sendItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendItem _$SendItemFromJson(Map<String, dynamic> json) => SendItem(
      sup_item_id: (json['sup_item_id'] as num?)?.toInt(),
      sup_unit_id: (json['sup_unit_id'] as num?)?.toInt(),
      volume: (json['volume'] as num?)?.toInt(),
      pack: (json['pack'] as num?)?.toInt(),
      qty: (json['qty'] as num?)?.toInt(),
      price_per_unit: (json['price_per_unit'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      price_pay: (json['price_pay'] as num?)?.toInt(),
      dept_current_balance: (json['dept_current_balance'] as num?)?.toInt(),
      stock_current_balance: (json['stock_current_balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SendItemToJson(SendItem instance) => <String, dynamic>{
      'sup_item_id': instance.sup_item_id,
      'sup_unit_id': instance.sup_unit_id,
      'volume': instance.volume,
      'pack': instance.pack,
      'qty': instance.qty,
      'price_per_unit': instance.price_per_unit,
      'price': instance.price,
      'price_pay': instance.price_pay,
      'dept_current_balance': instance.dept_current_balance,
      'stock_current_balance': instance.stock_current_balance,
    };
