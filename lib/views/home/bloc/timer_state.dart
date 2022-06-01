



import 'dart:async';

import 'package:airscaper/common/helpers.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/usecases/init_use_cases.dart';
import 'package:airscaper/injection.dart';
import 'package:flutter/material.dart';

class TimerState extends ChangeNotifier {

  Duration? _durationLeft;
  Timer? _globalTimer;

  ScenarioRepository get _repository => sl();
  InitStartDateUseCase get _initStartDateUseCase => sl();

  int get _timeLeft => _durationLeft?.inSeconds ?? 0;

  bool get end {
    if(_durationLeft == null) {
      initTimer();
    }
    return _timeLeft < 0;
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

      _durationLeft = scenarioDuration - DateTime.now().difference(initialDate);

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

    if (_timeLeft < 0) {
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