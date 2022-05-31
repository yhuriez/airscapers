
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:airscaper/views/mechanism/interactions/code_input.dart';
import 'package:airscaper/views/mechanism/interactions/items_combination.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Widget createMechanismInteraction(
    ScenarioMechanism mechanism, MechanismState state, OnNewState onNewState) {

  final firstTransition = state.transitions.firstOrNull;

  // Code input
  if (firstTransition?.expectedCodes != null) {
    return MechanismCodeInput(
      mechanism: mechanism,
      state: state,
      onNewState: onNewState,
    );

    // Items combination
  } else if (firstTransition?.expectedItemList != null) {
    return MechanismItemsCombination(
      mechanism: mechanism,
      state: state,
      onNewState: onNewState,
    );

  // Back button
  } else {
    return Container();
  }
}

typedef OnNewState(BuildContext context, {MechanismState givenState});
