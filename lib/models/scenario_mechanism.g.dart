// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_mechanism.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScenarioMechanismImpl _$$ScenarioMechanismImplFromJson(
        Map<String, dynamic> json) =>
    _$ScenarioMechanismImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      solving:
          MechanismSolving.fromJson(json['solving'] as Map<String, dynamic>),
      transitionId: json['transitionId'] as String?,
      endTrack: json['endTrack'] as bool? ?? false,
      clues:
          (json['clues'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$ScenarioMechanismImplToJson(
        _$ScenarioMechanismImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'solving': instance.solving.toJson(),
      'transitionId': instance.transitionId,
      'endTrack': instance.endTrack,
      'clues': instance.clues,
    };

_$MechanismClueImpl _$$MechanismClueImplFromJson(Map<String, dynamic> json) =>
    _$MechanismClueImpl(
      id: json['id'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$MechanismClueImplToJson(_$MechanismClueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
    };
