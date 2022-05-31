import 'package:airscaper/models/scenario_loot.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLootUseCase {
  final InventoryLocalSource _localSource;

  AddLootUseCase(this._localSource);

  Future<AddLootResponse> execute(BuildContext context, Iterable<ScenarioLoot> loots) async {
    var existingElement = false;

    // ignore: close_sinks
    final inventoryBloc = BlocProvider.of<InventoryBloc>(context);

    try {

      loots.forEach((loot) {
        if (loot.type == LootType.item) {
          final result = _localSource.loadItem(loot.id);
          if (result != null) {
            existingElement = true;
          } else {
            inventoryBloc.add(AddItemInventoryEvent(loot.id));
          }
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

    return baseLoot.where((loot) {
      if (loot.type == LootType.item)
        return !itemIds.contains(loot.id);
      else
        return false;
    }).toList();
  }
}
