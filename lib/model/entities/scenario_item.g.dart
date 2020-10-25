// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScenarioItem _$ScenarioItemFromJson(Map<String, dynamic> json) {
  return ScenarioItem(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    foundDescription: json['foundDescription'] as String,
    image: json['image'] as String,
    codeHint: json['codeHint'] as String,
    clues: (json['clues'] as List)?.map((e) => e as String)?.toList() ?? [],
    endTrack: json['endTrack'] as bool ?? false,
    isTrack: json['isTrack'] as bool ?? false,
    isInInventory: json['isInInventory'] as bool ?? false,
    hasQrCode: json['hasQrCode'] as bool ?? false,
    loots: (json['loots'] as List)
            ?.map((e) => e == null
                ? null
                : ScenarioLoot.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    transition: json['transition'] == null
        ? null
        : ScenarioTransition.fromJson(
            json['transition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScenarioItemToJson(ScenarioItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'foundDescription': instance.foundDescription,
      'image': instance.image,
      'codeHint': instance.codeHint,
      'transition': instance.transition,
      'clues': instance.clues,
      'loots': instance.loots,
      'endTrack': instance.endTrack,
      'isTrack': instance.isTrack,
      'isInInventory': instance.isInInventory,
      'hasQrCode': instance.hasQrCode,
    };
