import 'package:airscaper/models/scenario_loot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scenario_item.freezed.dart';

part 'scenario_item.g.dart';


@freezed
class ScenarioItem with _$ScenarioItem {

  const ScenarioItem._();

  const factory ScenarioItem({
    required int id,
    required String description,
    String? image,
    required String title,
    String? foundDescription,
    @Default([]) List<ScenarioLoot> loots,
    @Default(false) bool isPickup,
    @Default(false) bool endTrack,
    @Default(false) bool hasQrCode,
  }) = _ScenarioItem;

  factory ScenarioItem.fromJson(Map<String, dynamic> json) =>
      _$ScenarioItemFromJson(json);
}