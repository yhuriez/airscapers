import 'package:airscaper/common/exception/invalid_scenario_exception.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/models/scenario_reference.dart';
import 'package:collection/collection.dart';


/// Init application
class InitAppUseCase {

  final ScenarioStateStorage _prefs;
  final ScenarioRepository _repository;
  final StartScenarioUseCase _startScenarioUseCase;


  InitAppUseCase(this._prefs, this._repository, this._startScenarioUseCase);

  Future<InitAppResponse> execute() async {

    final initSucceeded = await _repository.initIndex();
    if (!initSucceeded) throw InvalidScenarioException("Scenario index cannot be initialized");

    final scenarioId = _prefs.getCurrentId();
    if (scenarioId == null) {
      return InitAppResponse.NO_SCENARIO;

    } else {
      // Init scenario
      await _startScenarioUseCase.execute(scenarioId);

      return InitAppResponse.HAS_SCENARIO;
    }
  }
}


enum InitAppResponse {
  NO_SCENARIO,
  HAS_SCENARIO
}


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


/// Provide the list of all available scenario
class LoadAllScenariosUseCase {
  final ScenarioRepository _repository;

  LoadAllScenariosUseCase(this._repository);

  Map<String, ScenarioReference> execute() {
    return Map.fromIterable(_repository.scenarios,
        key: (it) => it.code, value: (it) => it);
  }
}

/// Start the scenario timer
class InitStartDateUseCase {
  final ScenarioStateStorage _sharedPrefs;

  InitStartDateUseCase(this._sharedPrefs);

  DateTime execute() {
    var startDate = _sharedPrefs.getStartDate();
    if (startDate == null) {
      startDate = DateTime.now();
      _sharedPrefs.setStartDate(startDate);
    }

    return startDate;
  }
}
