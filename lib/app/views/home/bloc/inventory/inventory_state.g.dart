// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryState _$InventoryStateFromJson(Map<String, dynamic> json) {
  return InventoryState(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : ScenarioItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resolvedItems:
        (json['resolvedItems'] as List)?.map((e) => e as int)?.toSet(),
    usedItems: (json['usedItems'] as List)?.map((e) => e as int)?.toSet(),
    usedClues: (json['usedClues'] as List)?.map((e) => e as int)?.toSet(),
    loading: json['loading'] as bool,
    hasEnded: json['hasEnded'] as bool,
    selectedItem: json['selectedItem'] as int,
    newItem: json['newItem'] as int,
  );
}

Map<String, dynamic> _$InventoryStateToJson(InventoryState instance) =>
    <String, dynamic>{
      'items': instance.items,
      'usedItems': instance.usedItems?.toList(),
      'resolvedItems': instance.resolvedItems?.toList(),
      'usedClues': instance.usedClues?.toList(),
      'loading': instance.loading,
      'selectedItem': instance.selectedItem,
      'newItem': instance.newItem,
      'hasEnded': instance.hasEnded,
    };
