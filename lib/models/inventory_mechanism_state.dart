import 'package:airscaper/models/scenario_loot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'inventory_mechanism_state.freezed.dart';

part 'inventory_mechanism_state.g.dart';


@freezed
class InventoryMechanismState with _$InventoryMechanismState {

  const InventoryMechanismState._();

  const factory InventoryMechanismState({
    required int mechanismId,
    required DateTime creationDate,
    required int currentStateId,
  }) = _InventoryMechanismState;

  factory InventoryMechanismState.fromJson(Map<String, dynamic> json) =>
      _$InventoryMechanismStateFromJson(json);
}