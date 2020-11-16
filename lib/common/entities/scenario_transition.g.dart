// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_transition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScenarioTransition _$ScenarioTransitionFromJson(Map<String, dynamic> json) {
  return ScenarioTransition(
    expectedItem: json['expectedItem'] as int,
    expectedItemList:
        (json['expectedItemList'] as List)?.map((e) => e as int)?.toList(),
    expectedTracks:
        (json['expectedTracks'] as List)?.map((e) => e as int)?.toList(),
    expectedCodes:
        (json['expectedCodes'] as List)?.map((e) => e as String)?.toList(),
    transitionTo: json['transitionTo'] as int,
    removedItems:
        (json['removedItems'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$ScenarioTransitionToJson(ScenarioTransition instance) =>
    <String, dynamic>{
      'expectedItem': instance.expectedItem,
      'expectedItemList': instance.expectedItemList,
      'expectedTracks': instance.expectedTracks,
      'expectedCodes': instance.expectedCodes,
      'transitionTo': instance.transitionTo,
      'removedItems': instance.removedItems,
    };
