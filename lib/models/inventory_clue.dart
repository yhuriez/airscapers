import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_clue.freezed.dart';
part 'inventory_clue.g.dart';


@freezed
class InventoryClue with _$InventoryClue {

  const InventoryClue._();

  const factory InventoryClue({
    required String id,
    required DateTime creationDate,
  }) = _InventoryClue;

  factory InventoryClue.fromJson(Map<String, dynamic> json) =>
      _$InventoryClueFromJson(json);
}