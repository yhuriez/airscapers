
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/domain/usecases/inventory_use_cases.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/models/scenario_loot.dart';
import 'package:flutter/material.dart';

class InterpretLinkUseCase {
  final ScenarioRepository _repository;
  final AddLootUseCase _addLootUseCase;
  final ScenarioStateStorage _scenarioStateStorage;

  InterpretLinkUseCase(this._repository, this._addLootUseCase, this._scenarioStateStorage);

  Future<NavigationIntent> execute(ScenarioLoot loot) async {

    switch(loot.type) {
      case LootType.item: return _interpretItem( loot);
      case LootType.mechanism: return _interpretMechanism(loot);
      default: return NavigationIntent.dialog(arguments: DialogArguments(
          "QR code invalide", "Ce QR code n'existe pas pour ce scénario"));
    }
  }

  Future<NavigationIntent> _interpretMechanism(ScenarioLoot loot) async {
    final scenarioMechanism = _repository.getMechanism(loot.id);

    if (scenarioMechanism != null) {
      return NavigationIntent.mechanism(mechanism: scenarioMechanism);
    } else {
      return NavigationIntent.dialog(arguments: DialogArguments(
          "QR code invalide", "Ce QR code n'existe pas pour ce scénario"));
    }
  }


  Future<NavigationIntent> _interpretItem(ScenarioLoot loot) async {
    final scenarioItem = _repository.getItem(loot.id);

    if (scenarioItem != null) {

      // If end track, mark as ended and go to end screen
      if(scenarioItem.endTrack) {
        await _scenarioStateStorage.setEndDate(DateTime.now());
        return NavigationIntent.success();
      }

      final response = await _addLootUseCase.execute([loot]);

      if (response == AddLootResponse.ERROR) {
        return NavigationIntent.dialog(arguments: DialogArguments("Erreur", "Une erreur est survenue"));

      } else if (response == AddLootResponse.ALREADY_FOUND) {
        return NavigationIntent.dialog(arguments: DialogArguments("Objet déjà trouvé", "Vous possédez déjà cet objet"));

      } else {
        return NavigationIntent.itemDetails(item: scenarioItem);
      }
    } else {
      return NavigationIntent.dialog(arguments: DialogArguments(
          "", "Ce QR code n'existe pas pour ce scénario"));
    }
  }
}

class ParseLinkUseCase {

  ScenarioLoot? execute(String? param) {
    if (param == null || param.isEmpty) return null;

    String value;
    if (param.startsWith("airscapers://")) {
      value = param
          .split("//")
          .last;
    } else {
      value = param;
    }

    final splitValue = value.split("/");
    if (splitValue.length == 2) {
      final route = splitValue[0];
      final id = int.tryParse(splitValue[1]);
      if (id != null) {
        final lootType = LootType.values.firstWhere((element) => element.name == route);
        return ScenarioLoot(id: id, type: lootType);
      }
    }
    return null;
  }
}