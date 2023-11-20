// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_clue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryClueImpl _$$InventoryClueImplFromJson(Map<String, dynamic> json) =>
    _$InventoryClueImpl(
      id: json['id'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
    );

Map<String, dynamic> _$$InventoryClueImplToJson(_$InventoryClueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationDate': instance.creationDate.toIso8601String(),
    };
