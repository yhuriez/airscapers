
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';

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