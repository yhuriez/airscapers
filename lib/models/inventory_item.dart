import 'package:airscaper/models/scenario_loot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'inventory_item.freezed.dart';

part 'inventory_item.g.dart';


@freezed
class InventoryItem with _$InventoryItem {

  const InventoryItem._();

  const factory InventoryItem({
    required int id,
    required DateTime creationDate,
    required bool isPickedUp,
    @Default(false) bool used,
  }) = _InventoryItem;

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);
}