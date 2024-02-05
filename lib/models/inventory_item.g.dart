// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryItemImpl _$$InventoryItemImplFromJson(Map<String, dynamic> json) =>
    _$InventoryItemImpl(
      id: json['id'] as String,
      originMechanismId: json['originMechanismId'] as String,
      inventoryMechanismId: json['inventoryMechanismId'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      used: json['used'] as bool? ?? false,
    );

Map<String, dynamic> _$$InventoryItemImplToJson(_$InventoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originMechanismId': instance.originMechanismId,
      'inventoryMechanismId': instance.inventoryMechanismId,
      'creationDate': instance.creationDate.toIso8601String(),
      'used': instance.used,
    };
