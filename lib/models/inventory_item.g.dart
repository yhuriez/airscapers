// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryItemImpl _$$InventoryItemImplFromJson(Map<String, dynamic> json) =>
    _$InventoryItemImpl(
      id: json['id'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      isPickedUp: json['isPickedUp'] as bool,
      used: json['used'] as bool? ?? false,
    );

Map<String, dynamic> _$$InventoryItemImplToJson(_$InventoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationDate': instance.creationDate.toIso8601String(),
      'isPickedUp': instance.isPickedUp,
      'used': instance.used,
    };
