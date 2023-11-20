import 'package:airscaper/common/exception/invalid_scenario_exception.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/models/scenario_reference.dart';
import 'package:collection/collection.dart';

import 'start_scenario_use_case.dart';


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