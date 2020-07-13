
import 'package:airscaper/model/inventory_local_source.dart';
import 'package:airscaper/model/sharedprefs/scenario_shared_prefs.dart';
import 'package:airscaper/repositories/scenario_repository.dart';

/// Reset all scenario local data
class EndScenarioUseCase {
  final ScenarioSharedPrefs _sharedPrefs;
  final ScenarioRepository _repository;
  final InventoryLocalSource _inventoryLocalSource;

  EndScenarioUseCase(this._sharedPrefs, this._repository,
      this._inventoryLocalSource);

  Future<bool> execute() async {
    await _sharedPrefs.clear();
    await _inventoryLocalSource.clear();
    _repository.resetScenario();
    return true;
  }
}

class ComputeCompletionUseCase {

  final ScenarioRepository _repository;
  final InventoryLocalSource _inventoryLocalSource;

  ComputeCompletionUseCase(this._repository, this._inventoryLocalSource);

  Future<int> execute() async {
    final items = await _inventoryLocalSource.loadAllItems();
    final tracks = await _inventoryLocalSource.loadAllTracks();

    final foundElementsSize = items.length + tracks.length;
    final allElementsSize = _repository.items.length + _repository.tracks.length;

    return ((foundElementsSize / allElementsSize) * 100).toInt();
  }
}

class CountCluesUseCase {

  final InventoryLocalSource _inventoryLocalSource;

  CountCluesUseCase(this._inventoryLocalSource);

  Future<int> execute() async {
    final clues = await _inventoryLocalSource.loadAllClues();
    return clues.length;
  }
}


class TimeUsedUseCase {

  final ScenarioSharedPrefs _sharedPrefs;

  TimeUsedUseCase(this._sharedPrefs);

  Future<int> execute() async {
    final startDate = await _sharedPrefs.getStartDate();
    final endDate = await _sharedPrefs.getEndDate();

    final durationLeft = endDate.difference(startDate);
    return durationLeft.inSeconds;
  }
}