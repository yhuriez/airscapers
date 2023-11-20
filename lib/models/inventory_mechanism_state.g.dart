// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_mechanism_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryMechanismStateImpl _$$InventoryMechanismStateImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryMechanismStateImpl(
      mechanismId: json['mechanismId'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
    );

Map<String, dynamic> _$$InventoryMechanismStateImplToJson(
        _$InventoryMechanismStateImpl instance) =>
    <String, dynamic>{
      'mechanismId': instance.mechanismId,
      'creationDate': instance.creationDate.toIso8601String(),
    };
