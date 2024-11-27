import 'package:json_annotation/json_annotation.dart';
import 'package:ncimobile/models/item/supItemType.dart';

part 'supItemCategory.g.dart';

@JsonSerializable()
class SupItemCategory {
  int? id;
  int? sup_item_type_id;
  final String? code;
  final String? name;
  final String? short_name;
  final bool? status;
  final String? item_group;
  int? service_life;
  SupItemType? sup_item_type;

  SupItemCategory({
    this.id,
    this.sup_item_type_id,
    this.code,
    this.name,
    this.short_name,
    this.status,
    this.item_group,
    this.service_life,
    this.sup_item_type,
  });

  factory SupItemCategory.fromJson(Map<String, dynamic> json) => _$SupItemCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SupItemCategoryToJson(this);
}
