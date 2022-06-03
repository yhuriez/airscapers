
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:airscaper/views/mechanism/interactions/code_input.dart';
import 'package:airscaper/views/mechanism/interactions/items_combination.dart';
import 'package:airscaper/views/mechanism/mechanism_screen_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget createMechanismInteraction(BuildContext context) {

  final state = context.read<MechanismScreenState>();
  final firstTransition = state.mechanismState.transitions.firstOrNull;

  if(firstTransition == null) return Container();

  // Code input
  if (firstTransition.expectedCodes.isNotEmpty) {
    return MechanismCodeInput();

    // Items combination
  } else if (firstTransition.expectedItemList.isNotEmpty) {
    return MechanismItemsCombination();

  // Back button
  } else {
    return Container();
  }
}
