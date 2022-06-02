// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_mechanism.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScenarioMechanism _$$_ScenarioMechanismFromJson(Map<String, dynamic> json) =>
    _$_ScenarioMechanism(
      id: json['id'] as int,
      name: json['name'] as String,
      states: (json['states'] as List<dynamic>?)
              ?.map((e) => MechanismState.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ScenarioMechanismToJson(
        _$_ScenarioMechanism instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'states': instance.states,
    };

_$_MechanismState _$$_MechanismStateFromJson(Map<String, dynamic> json) =>
    _$_MechanismState(
      id: json['id'] as int,
      description: json['description'] as String?,
      image: json['image'] as String?,
      start: json['start'] as bool? ?? false,
      endTrack: json['endTrack'] as int?,
      transitions: (json['transitions'] as List<dynamic>?)
              ?.map((e) =>
                  MechanismTransition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      clues:
          (json['clues'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      codeHint: json['codeHint'] as String?,
    );

Map<String, dynamic> _$$_MechanismStateToJson(_$_MechanismState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'start': instance.start,
      'endTrack': instance.endTrack,
      'transitions': instance.transitions,
      'clues': instance.clues,
      'codeHint': instance.codeHint,
    };

_$_MechanismTransition _$$_MechanismTransitionFromJson(
        Map<String, dynamic> json) =>
    _$_MechanismTransition(
      transitionTo: json['transitionTo'] as int,
      expectedItem: json['expectedItem'] as int?,
      expectedItemList: (json['expectedItemList'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      expectedCodes: (json['expectedCodes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      removedItems: (json['removedItems'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MechanismTransitionToJson(
        _$_MechanismTransition instance) =>
    <String, dynamic>{
      'transitionTo': instance.transitionTo,
      'expectedItem': instance.expectedItem,
      'expectedItemList': instance.expectedItemList,
      'expectedCodes': instance.expectedCodes,
      'removedItems': instance.removedItems,
    };

_$_MechanismClue _$$_MechanismClueFromJson(Map<String, dynamic> json) =>
    _$_MechanismClue(
      id: json['id'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_MechanismClueToJson(_$_MechanismClue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
    };
