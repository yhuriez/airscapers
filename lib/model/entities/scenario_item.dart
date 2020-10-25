import 'scenario_loot.dart';
import 'scenario_transition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scenario_item.g.dart';

@JsonSerializable()
class ScenarioItem {
  int id;
  String title;
  String description;
  String foundDescription;
  String image;
  String codeHint;
  ScenarioTransition transition;

  @JsonKey(defaultValue: [])
  List<String> clues;

  @JsonKey(defaultValue: [])
  List<ScenarioLoot> loots;

  @JsonKey(defaultValue: false)
  bool endTrack;

  @JsonKey(defaultValue: false)
  bool isTrack;

  @JsonKey(defaultValue: false)
  bool isInInventory;

  @JsonKey(defaultValue: false)
  bool hasQrCode;

  ScenarioItem(
      {this.id,
      this.title,
      this.description,
      this.foundDescription,
      this.image,
      this.codeHint,
      this.clues,
      this.endTrack,
      this.isTrack,
      this.isInInventory,
      this.hasQrCode,
      this.loots,
      this.transition});

  factory ScenarioItem.fromJson(Map<String, dynamic> json) => _$ScenarioItemFromJson(json);

  Map<String, dynamic> toJson() => _$ScenarioItemToJson(this);
}
