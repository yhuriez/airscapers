
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';

/// Reset all scenario local data
class EndScenarioUseCase {
  final ScenarioStateStorage _sharedPrefs;
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

  int execute()  {
    final items = _inventoryLocalSource.loadAllItems();

    final foundElementsSize = items.length;
    final allElementsSize = _repository.items.length;

    return ((foundElementsSize / allElementsSize) * 100).toInt();
  }
}

class CountCluesUseCase {

  final InventoryLocalSource _inventoryLocalSource;

  CountCluesUseCase(this._inventoryLocalSource);

  int execute() {
    final clues = _inventoryLocalSource.loadAllClues();
    return clues.length;
  }
}


class TimeUsedUseCase {

  final ScenarioStateStorage _sharedPrefs;

  TimeUsedUseCase(this._sharedPrefs);

  int execute() {
    final startDate = _sharedPrefs.getStartDate();
    final endDate = _sharedPrefs.getEndDate();

    if(startDate == null || endDate == null) {
      throw new Exception("A start date and an end date should have been given at this point");
    }

    final durationLeft = endDate.difference(startDate);
    return durationLeft.inSeconds;
  }
}