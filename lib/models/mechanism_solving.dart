

import 'package:airscaper/models/scenario_loot.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mechanism_solving.freezed.dart';
part 'mechanism_solving.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
class MechanismSolving with _$MechanismSolving {

  @FreezedUnionValue("pick")
  const factory MechanismSolving.pick(String newItem) = MechanismSolvingPick;

  @FreezedUnionValue("search")
  const factory MechanismSolving.search(List<ScenarioLoot> loots) = MechanismSolvingSearch;

  @FreezedUnionValue("visual")
  const factory MechanismSolving.visual() = MechanismSolvingVisual;

  @FreezedUnionValue("code")
  const factory MechanismSolving.code(List<String> expectedCodes, String? codeHint, List<String> removedItems) = MechanismSolvingCode;

  @FreezedUnionValue("use")
  const factory MechanismSolving.use(String expectedItem, List<String> removedItems) = MechanismSolvingUse;

  @FreezedUnionValue("combine")
  const factory MechanismSolving.combine(List<String> expectedItemList, List<String> removedItems) = MechanismSolvingCombine;

  @FreezedUnionValue("activation")
  const factory MechanismSolving.activation(List<String> mechanismIds) = MechanismSolvingActivation;

  factory MechanismSolving.fromJson(Map<String, dynamic> json) =>
      _$MechanismSolvingFromJson(json);
}

