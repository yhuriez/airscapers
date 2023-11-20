import 'package:airscaper/common/exception/invalid_scenario_exception.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:collection/collection.dart';


/// Init storage with given scenario
class StartScenarioUseCase {

  final ScenarioStateStorage _prefs;
  final ScenarioRepository _repository;

  StartScenarioUseCase(this._repository, this._prefs);

  Future<void> execute(String scenarioId) async {

    _prefs.setCurrentId(scenarioId);

    if (!_repository.isScenarioInit) {
      final scenarioRef = _repository.scenarios.firstWhereOrNull(
              (element) => element.id == scenarioId);
      if(scenarioRef == null)
        throw InvalidScenarioException("Should have a scenario with id $scenarioId in memory");

      final scenarioInit = await _repository.initScenario(scenarioRef);
      if (!scenarioInit)
        throw InvalidScenarioException("Scenario $scenarioId cannot be initialize");
    }
  }
}