// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScenarioIndexImpl _$$ScenarioIndexImplFromJson(Map<String, dynamic> json) =>
    _$ScenarioIndexImpl(
      scenarios: (json['scenarios'] as List<dynamic>)
          .map((e) => ScenarioReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScenarioIndexImplToJson(_$ScenarioIndexImpl instance) =>
    <String, dynamic>{
      'scenarios': instance.scenarios.map((e) => e.toJson()).toList(),
    };
