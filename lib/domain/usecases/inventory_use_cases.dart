import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/models/scenario_loot.dart';
import 'package:flutter/cupertino.dart';

class AddLootUseCase {

  final InventoryLocalSource _localSource;

  AddLootUseCase(this._localSource);

  AddLootResponse execute(Iterable<ScenarioLoot> loots) {
    var existingElement = false;
    var usedElement = false;

    try {

      loots.forEach((loot) {
        final result = _localSource.loadItem(loot.id);
        if (result != null) {
          usedElement = result.used;
          existingElement = true;

        } else {
          _localSource.insertItem(loot.id, true);
        }
      });

      if (usedElement) return AddLootResponse.ALREADY_USED;
      if (existingElement) return AddLootResponse.ALREADY_FOUND;
      return AddLootResponse.ADDED;

    } catch (exception, stack) {
      debugPrintStack(stackTrace: stack);
      return AddLootResponse.ERROR;
    }
  }
}

enum AddLootResponse { ADDED, ALREADY_FOUND, ALREADY_USED, ERROR }



class FilterAvailableLootUseCase {
  final InventoryLocalSource _inventory;

  FilterAvailableLootUseCase(this._inventory);

  List<ScenarioLoot> execute(List<ScenarioLoot> baseLoot) {
    if (baseLoot.isEmpty) return [];

    final itemIds = (_inventory.loadAllItems()).map((it) => it.id).toList();

    return baseLoot.where((loot) => !itemIds.contains(loot.id)).toList();
  }
}
