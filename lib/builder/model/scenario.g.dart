// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scenario _$ScenarioFromJson(Map<String, dynamic> json) {
  return Scenario(
    json['creator'] as String,
    json['title'] as String,
    json['description'] as String,
    json['duration'] as int,
    json['image'] as String,
    json['endText'] as String,
    json['code'] as String,
    json['endWithTimer'] as bool,
  );
}

Map<String, dynamic> _$ScenarioToJson(Scenario instance) => <String, dynamic>{
      'creator': instance.creator,
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'image': instance.image,
      'endText': instance.endText,
      'code': instance.code,
      'endWithTimer': instance.endWithTimer,
    };
