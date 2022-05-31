// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScenarioIndex _$$_ScenarioIndexFromJson(Map<String, dynamic> json) =>
    _$_ScenarioIndex(
      scenarios: (json['scenarios'] as List<dynamic>)
          .map((e) => ScenarioReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScenarioIndexToJson(_$_ScenarioIndex instance) =>
    <String, dynamic>{
      'scenarios': instance.scenarios,
    };
