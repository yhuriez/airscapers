import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';
import 'package:airscaper/model/sharedprefs/scenario_shared_prefs.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/inventory_use_cases.dart';
import 'package:airscaper/views/home/bloc/inventory/inventory_bloc.dart';
import 'package:airscaper/views/home/success_screen.dart';
import 'package:airscaper/views/items/item_details_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterpretLinkUseCase {
  final ScenarioRepository _repository;
  final AddLootUseCase _addLootUseCase;
  final ScenarioSharedPrefs _sharedPrefs;

  InterpretLinkUseCase(
      this._repository, this._addLootUseCase, this._sharedPrefs);

  Future<NavigationIntent> execute(BuildContext context, int linkId) async {
    final scenarioItem = getCurrentStateItem(context, linkId);

    if (scenarioItem.isInInventory) {
      return _interpretInventoryItem(context, scenarioItem);

    } else if (scenarioItem.endTrack) {
      await _sharedPrefs.setEndDate(DateTime.now());
      return SuccessScreen.navigate();

    } else {
      return ItemDetailsFragment.navigate(
          ScenarioElementDesc(scenarioItem, found: false));
    }
  }

  Future<NavigationIntent> _interpretInventoryItem(
      BuildContext context, ScenarioItem scenarioItem) async {
    if (scenarioItem != null) {
      final loot = ScenarioLoot(id: scenarioItem.id);
      final response = await _addLootUseCase.execute(context, [loot]);
      if (response == AddLootResponse.ERROR) {
        return createDialogNavigationIntent(
            "Erreur", "Une erreur est survenue");
      } else if (response == AddLootResponse.ALREADY_FOUND) {
        return createDialogNavigationIntent(
            "Objet déjà trouvé", "Vous possédez déjà cet objet");
      } else {
        return ItemDetailsFragment.navigate(
            ScenarioElementDesc(scenarioItem, found: false));
      }
    } else {
      return createDialogNavigationIntent(
          "", "Ce QR code n'existe pas pour ce scénario");
    }
  }

  ScenarioItem getCurrentStateItem(BuildContext context, int baseLinkId) {
    final baseScenarioItem = _repository.getItem(baseLinkId);
    if (baseScenarioItem.transition != null) {
      // ignore: close_sinks
      final inventoryState = BlocProvider.of<InventoryBloc>(context).state;
      if (inventoryState.resolvedItems.contains(baseLinkId)) {
        return getCurrentStateItem(
            context, baseScenarioItem.transition.transitionTo);
      } else {
        return baseScenarioItem;
      }
    } else {
      return baseScenarioItem;
    }
  }
}

class ParseLinkUseCase {
  int execute(String param) {
    if (param == null || param.isEmpty) return null;

    String value;
    if (param.startsWith("airscapers://")) {
      value = param.split("//").last;
    } else {
      value = param;
    }

    final splitValue = value.split("/");
    if (splitValue.length == 2) {
      final scenarioId = splitValue[0];
      final id = int.tryParse(splitValue[1]);
      if (id != null) {
        return id;
      }
    }
    return null;
  }
}
