import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';
import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/model/entities/scenario_track.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/inventory_use_cases.dart';
import 'package:airscaper/views/inventory/inventory_details_screen.dart';
import 'package:airscaper/views/mechanism/mechanism_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_link.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';

class InterpretLinkUseCase {
  final ScenarioRepository _repository;
  final AddLootUseCase _addLootUseCase;

  InterpretLinkUseCase(this._repository, this._addLootUseCase);

  Future<NavigationIntent> execute(NavigationLink link) async {
    if (link.route == mechanismKey) {
      // Mechanism
      return _interpretMechanism(link.id);

    } else if (link.route == trackKey) {
      // Track
      return _interpretTrack(link.id);

    } else if (link.route == itemKey) {
      // Item
      return _interpretItem(link.id);

    } else {
      return createDialogNavigationIntent(
          "QR code invalide", "Ce QR code n'existe pas pour ce scénario");
    }
  }

  Future<NavigationIntent> _interpretMechanism(int id) async {
    final scenarioMechanism = _repository.getMechanism(id);

    if (scenarioMechanism != null) {
      return MechanismFragment.navigate(scenarioMechanism);
    } else {
      return createDialogNavigationIntent(
          "QR code invalide", "Ce QR code n'existe pas pour ce scénario");
    }
  }

  Future<NavigationIntent> _interpretTrack(int id) async {
    final scenarioTrack = _repository.getTrack(id);

    if (scenarioTrack != null) {
      final loot = ScenarioLoot(trackKey, id);
      final response = await _addLootUseCase.execute([loot]);

      if (response == AddLootResponse.ERROR) {
        return createDialogNavigationIntent(
            "Erreur", "Une erreur est survenue");
      } else {
        // Add track's loots if there is some
        if (scenarioTrack.loots != null) {
          await _addLootUseCase.execute(scenarioTrack.loots);
        }

        return InventoryDetailsFragment.navigate(
            ScenarioElementDesc.fromTrack(scenarioTrack));
      }
    } else {
      return createDialogNavigationIntent(
          "", "Ce QR code n'existe pas pour ce scénario");
    }
  }

  Future<NavigationIntent> _interpretItem(int id) async {
    final scenarioItem = _repository.getItem(id);

    if (scenarioItem != null) {
      final loot = ScenarioLoot(itemKey, id);
      final response = await _addLootUseCase.execute([loot]);
      if (response == AddLootResponse.ERROR) {
        return createDialogNavigationIntent(
            "Erreur", "Une erreur est survenue");
      } else if (response == AddLootResponse.ALREADY_FOUND) {
        return createDialogNavigationIntent(
            "Objet déjà trouvé", "Vous possédez déjà cet objet");
      } else {
        return InventoryDetailsFragment.navigate(
            ScenarioElementDesc.fromItem(scenarioItem, found: false));
      }
    } else {
      return createDialogNavigationIntent(
          "", "Ce QR code n'existe pas pour ce scénario");
    }
  }
}

class ParseLinkUseCase {

  NavigationLink execute(String param) {
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
        return NavigationLink(route, id);
      }
    }
    return null;
  }
}