import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_item.freezed.dart';
part 'inventory_item.g.dart';


@freezed
class InventoryItem with _$InventoryItem {

  const InventoryItem._();

  const factory InventoryItem({
    required String id,
    required String originMechanismId,
    required String inventoryMechanismId,
    required DateTime creationDate,
    @Default(false) bool used,
  }) = _InventoryItem;

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);
}