// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mechanism_solving.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MechanismSolvingPickImpl _$$MechanismSolvingPickImplFromJson(
        Map<String, dynamic> json) =>
    _$MechanismSolvingPickImpl(
      json['newItem'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MechanismSolvingPickImplToJson(
        _$MechanismSolvingPickImpl instance) =>
    <String, dynamic>{
      'newItem': instance.newItem,
      'type': instance.$type,
    };

_$MechanismSolvingSearchImpl _$$MechanismSolvingSearchImplFromJson(
        Map<String, dynamic> json) =>
    _$MechanismSolvingSearchImpl(
      (json['loots'] as List<dynamic>)
          .map((e) => ScenarioLoot.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MechanismSolvingSearchImplToJson(
        _$MechanismSolvingSearchImpl instance) =>
    <String, dynamic>{
      'loots': instance.loots.map((e) => e.toJson()).toList(),
      'type': instance.$type,
    };

_$MechanismSolvingVisualImpl _$$MechanismSolvingVisualImplFromJson(
        Map<String, dynamic> json) =>
    _$MechanismSolvingVisualImpl(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MechanismSolvingVisualImplToJson(
        _$MechanismSolvingVisualImpl instance) =>
    <String, dynamic>{
      'type': instance.$type,
    };

_$MechanismSolvingCodeImpl _$$MechanismSolvingCodeImplFromJson(
        Map<String, dynamic> json) =>
    _$MechanismSolvingCodeImpl(
      (json['expectedCodes'] as List<dynamic>).map((e) => e as String).toList(),
      json['codeHint'] as String?,
      (json['removedItems'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MechanismSolvingCodeImplToJson(
        _$MechanismSolvingCodeImpl instance) =>
    <String, dynamic>{
      'expectedCodes': instance.expectedCodes,
      'codeHint': instance.codeHint,
      'removedItems': instance.removedItems,
      'type': instance.$type,
    };

_$MechanismSolvingUseImpl _$$MechanismSolvingUseImplFromJson(
        Map<String, dynamic> json) =>
    _$MechanismSolvingUseImpl(
      json['expectedItem'] as String,
      (json['removedItems'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MechanismSolvingUseImplToJson(
        _$MechanismSolvingUseImpl instance) =>
    <String, dynamic>{
      'expectedItem': instance.expectedItem,
      'removedItems': instance.removedItems,
      'type': instance.$type,
    };

_$MechanismSolvingCombineImpl _$$MechanismSolvingCombineImplFromJson(
        Map<String, dynamic> json) =>
    _$MechanismSolvingCombineImpl(
      (json['expectedItemList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['removedItems'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MechanismSolvingCombineImplToJson(
        _$MechanismSolvingCombineImpl instance) =>
    <String, dynamic>{
      'expectedItemList': instance.expectedItemList,
      'removedItems': instance.removedItems,
      'type': instance.$type,
    };

_$MechanismSolvingActivationImpl _$$MechanismSolvingActivationImplFromJson(
        Map<String, dynamic> json) =>
    _$MechanismSolvingActivationImpl(
      (json['mechanismIds'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MechanismSolvingActivationImplToJson(
        _$MechanismSolvingActivationImpl instance) =>
    <String, dynamic>{
      'mechanismIds': instance.mechanismIds,
      'type': instance.$type,
    };
