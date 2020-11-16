import 'dart:async';

import 'package:airscaper/app/domain/scenario_repository.dart';
import 'package:airscaper/app/usecases/init_use_cases.dart';
import 'package:cubit/cubit.dart';
import 'package:flutter/material.dart';

import '../../../../injection.dart';

class TimerCubit extends Cubit< TimerState> {

  TimerCubit() : super(TimerState(loading: true));

  ScenarioRepository get _repository => sl();
  InitStartDateUseCase get _initStartDateUseCase => sl();

  Timer _globalTimer;
  int timeLeft;

  init() async {
    try {
      final initialDate = await _initStartDateUseCase.execute();
      final scenarioDuration = Duration(minutes: _repository.durationInMinute);

      final durationLeft =
          scenarioDuration - DateTime.now().difference(initialDate);
      timeLeft = durationLeft.inSeconds;

      print("TimerBloc: timeLeft => $timeLeft");

      if(_globalTimer != null) {
        _globalTimer.cancel();
      }

      _globalTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        tickTimer();
      });

      emit(TimerState(durationLeft: timeLeft));

    } catch (exception, stack) {
      debugPrintStack(stackTrace: stack, label: exception.toString());
      emit(null);
    }
  }

  tickTimer() {
    timeLeft--;
    if (timeLeft < 0) {
      endTimer();
    } else {
      emit(TimerState(durationLeft: timeLeft));
    }
  }

  endTimer() {
    _globalTimer.cancel();
    _globalTimer = null;
    timeLeft = null;
    emit(TimerState(end: true));
  }
}

/// STATE
class TimerState {
  final int durationLeft;
  final bool loading;
  final bool end;

  TimerState({this.durationLeft, this.loading = false, this.end = false});
}
