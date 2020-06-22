import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';
import 'package:airscaper/model/entities/scenario_track.dart';
import 'package:airscaper/model/inventory_local_source.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_link.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/cupertino.dart';

class AddLootUseCase {
  final InventoryLocalSource _localSource;

  AddLootUseCase(this._localSource);

  Future<AddLootResponse> execute(Iterable<ScenarioLoot> loots) async {
    var existingElement = false;

    try {
      await Future.forEach(loots, (loot) async {
        if (loot.type == trackKey) {
          final result = await _localSource.insertTrack(loot.id);
          if (result == -1) {
            existingElement = true;
          }
        } else if (loot.type == itemKey) {
          final result = await _localSource.insertItem(loot.id);
          if (result == -1) {
            existingElement = true;
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

class LoadTracksUseCase {
  final ScenarioRepository _repository;
  final InventoryLocalSource _localSource;

  LoadTracksUseCase(this._repository, this._localSource);

  Future<List<ScenarioTrack>> execute() async {
    final inventoryTrackIds =
        (await _localSource.loadAllTracks()).map((e) => e.id).toList();
    return _repository.tracks
        .where((track) => inventoryTrackIds.contains(track.id))
        .toList();
  }
}

class LoadItemsUseCase {
  final ScenarioRepository _repository;
  final InventoryLocalSource _localSource;

  LoadItemsUseCase(this._repository, this._localSource);

  Future<List<ScenarioItem>> execute() async {
    final inventoryItemIds =
        (await _localSource.loadUnusedItems()).map((e) => e.id).toList();
    return _repository.items
        .where((item) => inventoryItemIds.contains(item.id))
        .toList();
  }
}

class CodeInputUseCase {
  final ScenarioRepository _repository;
  final InterpretLinkUseCase _interpretLinkUseCase;

  CodeInputUseCase(this._repository, this._interpretLinkUseCase);

  Future<NavigationIntent> execute(String code) async {
    final scenarioCode =
        _repository.codes.firstWhere((element) => element.code == code);
    if (scenarioCode != null) {
      final loot = scenarioCode.loot;
      if (loot == null) {
        return createDialogNavigationIntent(
            "Fausse piste", "Ce code ne correspond à rien");
      }
      return await _interpretLinkUseCase.execute(NavigationLink.fromLoot(loot));
    } else {
      return createDialogNavigationIntent(
          "Fausse piste", "Ce code ne correspond à rien");
    }
  }
}

class FilterAvailableLootUseCase {
  final InventoryLocalSource _inventory;

  FilterAvailableLootUseCase(this._inventory);

  Future<List<ScenarioLoot>> execute(List<ScenarioLoot> baseLoot) async {
    if (baseLoot == null || baseLoot.isEmpty) return [];

    final trackIds =
        (await _inventory.loadAllTracks()).map((it) => it.id).toList();
    final itemIds =
        (await _inventory.loadUnusedItems()).map((it) => it.id).toList();

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
