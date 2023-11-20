// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScenarioReferenceImpl _$$ScenarioReferenceImplFromJson(
        Map<String, dynamic> json) =>
    _$ScenarioReferenceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      code: json['code'] as String,
      linkedFile: json['linkedFile'] as String?,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ScenarioReferenceImplToJson(
        _$ScenarioReferenceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'code': instance.code,
      'linkedFile': instance.linkedFile,
      'description': instance.description,
    };
