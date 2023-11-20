// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScenarioItemImpl _$$ScenarioItemImplFromJson(Map<String, dynamic> json) =>
    _$ScenarioItemImpl(
      id: json['id'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      hasQrCode: json['hasQrCode'] as bool? ?? false,
    );

Map<String, dynamic> _$$ScenarioItemImplToJson(_$ScenarioItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'title': instance.title,
      'hasQrCode': instance.hasQrCode,
    };
