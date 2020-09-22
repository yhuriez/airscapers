import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';
import 'package:airscaper/model/entities/scenario_track.dart';
import 'package:airscaper/model/inventory_local_source.dart';
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
      await Future.forEach(loots, (loot) async {
        if (loot.type == trackKey) {
          final result = await _localSource.insertTrack(loot.id);
          if (result == -1) {
            existingElement = true;
          }
        } else if (loot.type == itemKey) {
          final result = await _localSource.loadItem(loot.id);
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

  Future<List<ScenarioLoot>> execute(List<ScenarioLoot> baseLoot) async {
    if (baseLoot == null || baseLoot.isEmpty) return [];

    final trackIds =
        (await _inventory.loadAllTracks()).map((it) => it.id).toList();
    final itemIds =
        (await _inventory.loadAllItems()).map((it) => it.id).toList();

    return baseLoot.where((loot) {
      if (loot.type == trackKey)
        return !trackIds.contains(loot.id);
      else if (loot.type == itemKey)
        return !itemIds.contains(loot.id);
      else
        return false;
    }).toList();
  }
}
