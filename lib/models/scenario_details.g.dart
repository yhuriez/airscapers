// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScenarioDetails _$$_ScenarioDetailsFromJson(Map<String, dynamic> json) =>
    _$_ScenarioDetails(
      title: json['title'] as String,
      duration: json['duration'] as int,
      maxDuration: json['maxDuration'] as int,
      endText: json['endText'] as String,
    );

Map<String, dynamic> _$$_ScenarioDetailsToJson(_$_ScenarioDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'duration': instance.duration,
      'maxDuration': instance.maxDuration,
      'endText': instance.endText,
    };
