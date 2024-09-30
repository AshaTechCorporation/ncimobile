// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disbursementList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisbursementList _$DisbursementListFromJson(Map<String, dynamic> json) =>
    DisbursementList(
      json['title'] as String,
      (json['subTitle'] as num).toInt(),
      (json['qty'] as num).toInt(),
    );

Map<String, dynamic> _$DisbursementListToJson(DisbursementList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'qty': instance.qty,
    };
