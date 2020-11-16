
import 'package:json_annotation/json_annotation.dart';

part 'scenario_transition.g.dart';

@JsonSerializable()
class ScenarioTransition {
  int expectedItem;
  List<int> expectedItemList;
  List<int> expectedTracks;
  List<String> expectedCodes;
  int transitionTo;
  List<int> removedItems;

  ScenarioTransition({this.expectedItem, this.expectedItemList, this.expectedTracks, this.expectedCodes, this.transitionTo, this.removedItems});

  factory ScenarioTransition.fromJson(Map<String, dynamic> json) => _$ScenarioTransitionFromJson(json);

  Map<String, dynamic> toJson() => _$ScenarioTransitionToJson(this);
}