// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScenarioImpl _$$ScenarioImplFromJson(Map<String, dynamic> json) =>
    _$ScenarioImpl(
      details:
          ScenarioDetails.fromJson(json['details'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => ScenarioItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      mechanisms: (json['mechanisms'] as List<dynamic>)
          .map((e) => ScenarioMechanism.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScenarioImplToJson(_$ScenarioImpl instance) =>
    <String, dynamic>{
      'details': instance.details.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'mechanisms': instance.mechanisms.map((e) => e.toJson()).toList(),
    };
