import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/models/scenario_loot.dart';
import 'package:flutter/cupertino.dart';

class AddLootUseCase {

  final InventoryLocalSource _localSource;

  AddLootUseCase(this._localSource);

  Future<AddLootResponse> execute(Iterable<ScenarioLoot> loots) async {
    var existingElement = false;

    try {

      loots.forEach((loot) {
        final result = _localSource.loadItem(loot.id);
        if (result != null) {
          existingElement = true;

        } else {
          _localSource.insertItem(loot.id, true);
        }
      });

      return (existingElement)
          ? AddLootResponse.ALREADY_FOUND
          : AddLootResponse.ADDED;
    } catch (exception, stack) {
      debugPrintStack(stackTrace: stack);
      return AddLootResponse.ERROR;
    }
  }
}

enum AddLootResponse { ADDED, ALREADY_FOUND, ERROR }



class FilterAvailableLootUseCase {
  final InventoryLocalSource _inventory;

  FilterAvailableLootUseCase(this._inventory);

  List<ScenarioLoot> execute(List<ScenarioLoot> baseLoot) {
    if (baseLoot.isEmpty) return [];

    final itemIds = (_inventory.loadAllItems()).map((it) => it.id).toList();

    return baseLoot.where((loot) => !itemIds.contains(loot.id)).toList();
  }
}
