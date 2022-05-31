import 'package:airscaper/common/ars_result.dart';
import 'package:airscaper/models/scenario_reference.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
import 'package:airscaper/views/home/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Init application
class InitAppUseCase {
  final ScenarioStateStorage _prefs;

  InitAppUseCase(this._prefs);

  InitAppResponse execute() {
    final scenarioId = _prefs.getCurrentId();
    if (scenarioId == null) {
      return NoScenarioResponse();
    } else {
      return HasScenarioResponse();
    }
  }
}

abstract class InitAppResponse {}

class HasScenarioResponse extends InitAppResponse {}

class NoScenarioResponse extends InitAppResponse {}

/// Init index containing all scenarios
class InitScenarioIndexUseCase {
  final ScenarioRepository _repository;

  InitScenarioIndexUseCase(this._repository);

  Future<InitIndexResponse> execute(BuildContext context) async {
    final initSucceeded = await _repository.initIndex(context);
    if (!initSucceeded) return FailedInitIndexResponse();

    return ScenarioChoiceInitResponse(_repository.scenarios);
  }
}

abstract class InitIndexResponse {}

class ScenarioChoiceInitResponse extends InitIndexResponse {
  final List<ScenarioReference> scenarios;

  ScenarioChoiceInitResponse(this.scenarios);
}

class FailedInitIndexResponse extends InitIndexResponse {}

/// Register given scenario as ongoing scenario
class RegisterScenarioUseCase {
  final ScenarioStateStorage _prefs;

  RegisterScenarioUseCase(this._prefs);

  execute(BuildContext context, ScenarioReference scenario) async {
    await _prefs.setCurrentId(scenario.id);
  }
}

/// Init storage with given scenario
class StartScenarioUseCase {
  final ScenarioRepository _repository;
  final ScenarioStateStorage _prefs;

  StartScenarioUseCase(this._repository, this._prefs);

  Future<ARSResult<StartResult>> execute(BuildContext context) async {
    final currentId = _prefs.getCurrentId();

    if (!_repository.isIndexInit) {
      final indexInit = await _repository.initIndex(context);
      if (!indexInit) return ARSResult.error("index_init_failed");
    }

    if (!_repository.isScenarioInit) {
      final scenarioRef = _repository.scenarios.firstWhere(
              (element) => element.id == currentId,
          orElse: () =>
          throw Exception("Scenario with id $currentId not found"));

      final scenarioInit = await _repository.initScenario(context, scenarioRef);
      if (!scenarioInit) return ARSResult.error("scenario_init_failed");
    }

    BlocProvider.of<TimerBloc>(context).add(InitTimerEvent());
    BlocProvider.of<InventoryBloc>(context).add(InitInventoryEvent());

    // Check if scenario is ended
    final endDate = _prefs.getEndDate();

    final result = (endDate != null)
        ? StartResult.ENDED
        : StartResult.ONGOING;

    return ARSResult.success(result);
  }
}

enum StartResult {
  ONGOING,
  ENDED
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
