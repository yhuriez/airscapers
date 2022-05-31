// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_clue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InventoryClue _$$_InventoryClueFromJson(Map<String, dynamic> json) =>
    _$_InventoryClue(
      id: json['id'] as int,
      creationDate: DateTime.parse(json['creationDate'] as String),
    );

Map<String, dynamic> _$$_InventoryClueToJson(_$_InventoryClue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationDate': instance.creationDate.toIso8601String(),
    };
