// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Scenario _$$_ScenarioFromJson(Map<String, dynamic> json) => _$_Scenario(
      details:
          ScenarioDetails.fromJson(json['details'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => ScenarioItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      mechanisms: (json['mechanisms'] as List<dynamic>)
          .map((e) => ScenarioMechanism.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScenarioToJson(_$_Scenario instance) =>
    <String, dynamic>{
      'details': instance.details,
      'items': instance.items,
      'mechanisms': instance.mechanisms,
    };
