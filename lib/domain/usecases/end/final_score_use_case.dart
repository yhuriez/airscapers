
import 'package:airscaper/domain/repositories/scenario_repository.dart';

import 'count_clues_use_case.dart';
import 'time_used_use_case.dart';

class FinalScoreUseCase {

  final TimeUsedUseCase _timeUsedUseCase;
  final ScenarioRepository _repository;
  final CountCluesUseCase _countCluesUseCase;

  FinalScoreUseCase(this._timeUsedUseCase, this._countCluesUseCase, this._repository);

  int execute() {
    final timeUsedSeconds = _timeUsedUseCase.execute();
    final timeUsedDuration = Duration(seconds: timeUsedSeconds);

    final maxScenarioDuration = _repository.maxDurationInMinute;
    final minuteLeft = maxScenarioDuration - timeUsedDuration.inMinutes;

    final minutePoints = minuteLeft * 10;
    final clueMalus = _countCluesUseCase.execute() * 2;

    return minutePoints - clueMalus;
  }
}