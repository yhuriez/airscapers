// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScenarioDetailsImpl _$$ScenarioDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$ScenarioDetailsImpl(
      title: json['title'] as String,
      duration: json['duration'] as int,
      maxDuration: json['maxDuration'] as int,
      endText: json['endText'] as String,
    );

Map<String, dynamic> _$$ScenarioDetailsImplToJson(
        _$ScenarioDetailsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'duration': instance.duration,
      'maxDuration': instance.maxDuration,
      'endText': instance.endText,
    };
