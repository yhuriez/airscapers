import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scenario_mechanism.freezed.dart';

part 'scenario_mechanism.g.dart';


@freezed
class ScenarioMechanism with _$ScenarioMechanism {

  const ScenarioMechanism._();

  const factory ScenarioMechanism({
    required int id,
    required String name,
    @Default([]) List<MechanismState> states
  }) = _ScenarioMechanism;

  factory ScenarioMechanism.fromJson(Map<String, dynamic> json) =>
      _$ScenarioMechanismFromJson(json);
}


@freezed
class MechanismState with _$MechanismState {

  const MechanismState._();

  const factory MechanismState({
    required int id,
    required String description,
    required String image,
    @Default(false) bool start,
    int? endTrack,
    @Default([]) List<MechanismTransition> transitions,
    @Default([]) List<MechanismClue> clues,
    String? codeHint,
  }) = _MechanismState;

  factory MechanismState.fromJson(Map<String, dynamic> json) =>
      _$MechanismStateFromJson(json);
}



@freezed
class MechanismTransition with _$MechanismTransition {

  const MechanismTransition._();

  const factory MechanismTransition({
    required int stateId,
    required int transitionTo,
    int? expectedItem,
    @Default([]) List<int> expectedItemList,
    @Default([]) List<String> expectedCodes,
    @Default([]) List<int> removedItems,
  }) = _MechanismTransition;

  factory MechanismTransition.fromJson(Map<String, dynamic> json) =>
      _$MechanismTransitionFromJson(json);
}

@freezed
class MechanismClue with _$MechanismClue {

  const MechanismClue._();

  const factory MechanismClue({
    required int id,
    required String description
  }) = _MechanismClue;

  factory MechanismClue.fromJson(Map<String, dynamic> json) =>
      _$MechanismClueFromJson(json);
}