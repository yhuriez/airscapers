// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InventoryItem _$$_InventoryItemFromJson(Map<String, dynamic> json) =>
    _$_InventoryItem(
      id: json['id'] as int,
      creationDate: DateTime.parse(json['creationDate'] as String),
      isPickedUp: json['isPickedUp'] as bool,
      used: json['used'] as bool? ?? false,
    );

Map<String, dynamic> _$$_InventoryItemToJson(_$_InventoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationDate': instance.creationDate.toIso8601String(),
      'isPickedUp': instance.isPickedUp,
      'used': instance.used,
    };
