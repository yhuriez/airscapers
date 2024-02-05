
import 'package:airscaper/views/mechanism/interactions/code_input.dart';
import 'package:airscaper/views/mechanism/interactions/continue_button_view.dart';
import 'package:airscaper/views/mechanism/interactions/items_combination.dart';
import 'package:airscaper/views/mechanism/interactions/pick_button_view.dart';
import 'package:airscaper/views/mechanism/interactions/search_interaction_view.dart';
import 'package:airscaper/views/mechanism/mechanism_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget createMechanismInteraction(BuildContext context) {

  final state = context.read<MechanismScreenState>();
  final solving = state.mechanism.solving;

  // Code input
  return solving.map(
      pick: (it) => PickButtonView(state.mechanism, it),
      search: (it) => SearchButton(it),
      code: (it) => MechanismCodeInput(it),
      combine: (it) => MechanismItemsCombination(it),
      visual: (it) => ContinueButtonView(),
      activation: (it) => ContinueButtonView(),
      use: (it) => const Placeholder()
  );
}
