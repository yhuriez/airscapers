import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/views/home/bloc/inventory/inventory_state.dart';
import 'package:airscaper/views/items/interactions/continue_button.dart';
import 'package:airscaper/views/items/interactions/search_button.dart';
import 'package:flutter/material.dart';

import 'code_input.dart';
import 'items_combination.dart';

Widget createInteractionWidget(InventoryState state, ScenarioItem item, Function(BuildContext) onResolved) {

  final transition = item.transition;

  // Code input
  if (transition?.expectedCodes != null) {
    return ItemCodeInput(item, onResolved);

    // Items combination
  } else if (transition?.expectedItemList != null) {
    return ItemCombination(item, onResolved);

    // Search loot button
  } else if (state.filterAvailableLoots(item.loots).isNotEmpty) {
    return ItemSearchButton(state, item, onResolved);

    // Continue button
  } else if (transition?.transitionTo != null) {
    return ItemContinueButton(onResolved);

    // No interaction
  } else {
    return Container();
  }
}