// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_mechanism_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InventoryMechanismState _$$_InventoryMechanismStateFromJson(
        Map<String, dynamic> json) =>
    _$_InventoryMechanismState(
      mechanismId: json['mechanismId'] as int,
      creationDate: DateTime.parse(json['creationDate'] as String),
      currentStateId: json['currentStateId'] as int,
    );

Map<String, dynamic> _$$_InventoryMechanismStateToJson(
        _$_InventoryMechanismState instance) =>
    <String, dynamic>{
      'mechanismId': instance.mechanismId,
      'creationDate': instance.creationDate.toIso8601String(),
      'currentStateId': instance.currentStateId,
    };
