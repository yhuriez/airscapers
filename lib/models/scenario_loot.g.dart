// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_loot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScenarioLoot _$$_ScenarioLootFromJson(Map<String, dynamic> json) =>
    _$_ScenarioLoot(
      id: json['id'] as int,
      type: $enumDecode(_$LootTypeEnumMap, json['type']),
      interactionText: json['interactionText'] as String?,
    );

Map<String, dynamic> _$$_ScenarioLootToJson(_$_ScenarioLoot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$LootTypeEnumMap[instance.type],
      'interactionText': instance.interactionText,
    };

const _$LootTypeEnumMap = {
  LootType.item: 'item',
  LootType.mechanism: 'mechanism',
};
