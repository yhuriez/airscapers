// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScenarioItem _$$_ScenarioItemFromJson(Map<String, dynamic> json) =>
    _$_ScenarioItem(
      id: json['id'] as int,
      description: json['description'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      foundDescription: json['foundDescription'] as String?,
      loots: (json['loots'] as List<dynamic>?)
              ?.map((e) => ScenarioLoot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isPickedUp: json['isPickedUp'] as bool? ?? false,
      isZoomable: json['isZoomable'] as bool? ?? false,
      endTrack: json['endTrack'] as bool? ?? false,
      hasQrCode: json['hasQrCode'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ScenarioItemToJson(_$_ScenarioItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'title': instance.title,
      'foundDescription': instance.foundDescription,
      'loots': instance.loots,
      'isPickedUp': instance.isPickedUp,
      'isZoomable': instance.isZoomable,
      'endTrack': instance.endTrack,
      'hasQrCode': instance.hasQrCode,
    };
