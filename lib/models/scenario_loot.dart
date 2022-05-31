import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scenario_loot.freezed.dart';

part 'scenario_loot.g.dart';


@freezed
class ScenarioLoot with _$ScenarioLoot {

  const ScenarioLoot._();

  const factory ScenarioLoot({
    required int id,
    required LootType type,
    String? interactionText
  }) = _ScenarioLoot;

  factory ScenarioLoot.fromJson(Map<String, dynamic> json) =>
      _$ScenarioLootFromJson(json);
}

enum LootType {
  item,
  mechanism
}