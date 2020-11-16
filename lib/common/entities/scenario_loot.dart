
import 'package:json_annotation/json_annotation.dart';

part 'scenario_loot.g.dart';

@JsonSerializable()
class ScenarioLoot {
  String interactionText;
  int id;

  ScenarioLoot({this.interactionText, this.id});

  factory ScenarioLoot.fromJson(Map<String, dynamic> json) => _$ScenarioLootFromJson(json);

  Map<String, dynamic> toJson() => _$ScenarioLootToJson(this);
}