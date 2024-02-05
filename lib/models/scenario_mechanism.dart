import 'package:airscaper/models/mechanism_solving.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scenario_mechanism.freezed.dart';

part 'scenario_mechanism.g.dart';

@freezed
class ScenarioMechanism with _$ScenarioMechanism {

  const ScenarioMechanism._();

  const factory ScenarioMechanism(
      {required String id,
      required String title,
      String? description,
      String? image,
      required MechanismSolving solving,
      String? transitionId,
      @Default(false) bool isEnd,
      @Default(false) bool isEntryPoint,
      @Default([]) List<String> clues}) = _ScenarioMechanism;

  factory ScenarioMechanism.fromJson(Map<String, dynamic> json) =>
      _$ScenarioMechanismFromJson(json);

  List<MechanismClue> getCluesObjects() => clues.mapIndexed((index, clue) {
        final id = "${this.id}_$index";
        return MechanismClue(id: id, description: clue);
      }).toList();
}

@freezed
class MechanismClue with _$MechanismClue {
  const MechanismClue._();

  const factory MechanismClue({required String id, required String description}) = _MechanismClue;

  factory MechanismClue.fromJson(Map<String, dynamic> json) => _$MechanismClueFromJson(json);
}
