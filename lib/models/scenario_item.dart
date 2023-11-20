import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scenario_item.freezed.dart';
part 'scenario_item.g.dart';


@freezed
class ScenarioItem with _$ScenarioItem {

  const ScenarioItem._();

  const factory ScenarioItem({
    required String id,
    required String description,
    required String image,
    required String title,
    @Default(false) bool hasQrCode,
  }) = _ScenarioItem;

  factory ScenarioItem.fromJson(Map<String, dynamic> json) =>
      _$ScenarioItemFromJson(json);
}