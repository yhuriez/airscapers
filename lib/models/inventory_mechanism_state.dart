import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_mechanism_state.freezed.dart';
part 'inventory_mechanism_state.g.dart';


@freezed
class InventoryMechanism with _$InventoryMechanism {

  const InventoryMechanism._();

  const factory InventoryMechanism({
    required String mechanismId,
    required DateTime creationDate
  }) = _InventoryMechanismState;

  factory InventoryMechanism.fromJson(Map<String, dynamic> json) =>
      _$InventoryMechanismFromJson(json);
}