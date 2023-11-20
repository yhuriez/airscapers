



import 'dart:async';

import 'package:airscaper/common/helpers.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/usecases/init/init_start_date_use_case.dart';
import 'package:airscaper/injection.dart';
import 'package:flutter/material.dart';

class TimerState extends ChangeNotifier {

  Duration? _durationLeft;
  Duration? _maxDurationLeft;
  Timer? _globalTimer;

  ScenarioRepository get _repository => sl();
  InitStartDateUseCase get _initStartDateUseCase => sl();

  int get _timeLeft => _durationLeft?.inSeconds ?? 0;
  int get _maxTimeLeft => _maxDurationLeft?.inSeconds ?? 0;

  bool get end {
    if(_durationLeft == null || _maxDurationLeft == null) {
      initTimer();
    }
    return _maxTimeLeft < 0;
  }

  String get durationLeft {
    if(_durationLeft == null) {
      initTimer();
    }
    return formatDuration(_durationLeft!);
  }

  TimerState() {
    initTimer();
  }

  initTimer() {
    try {
      final initialDate = _initStartDateUseCase.execute();
      final scenarioDuration = Duration(minutes: _repository.durationInMinute);
      final scenarioMaxDuration = Duration(minutes: _repository.maxDurationInMinute);

      _durationLeft = scenarioDuration - DateTime.now().difference(initialDate);
      _maxDurationLeft = scenarioMaxDuration - DateTime.now().difference(initialDate);

      if(_globalTimer != null) {
        _globalTimer?.cancel();
      }

      _globalTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        _tickTimer();
      });

    } catch (exception, stack) {
      debugPrintStack(stackTrace: stack, label: exception.toString());
    }
  }

  _tickTimer() {
    _durationLeft = Duration(seconds: _timeLeft - 1);
    _maxDurationLeft = Duration(seconds: _maxTimeLeft - 1);

    if (_maxTimeLeft < 0) {
      endTimer();
    }

    notifyListeners();
  }

  endTimer() {
    _globalTimer?.cancel();
    _globalTimer = null;
  }

  @override
  void dispose() {
    super.dispose();
    endTimer();
  }
}