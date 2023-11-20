
import 'package:airscaper/views/mechanism/interactions/code_input.dart';
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
  final widget = solving.mapOrNull(
      pick: (it) => PickButtonView(it),
      search: (it) => SearchInteractionView(it),
      code: (it) => MechanismCodeInput(it),
      combine: (it) => MechanismItemsCombination(it)
      // visual and activation don't have interactions,
  );

    return widget ?? Container();
}
