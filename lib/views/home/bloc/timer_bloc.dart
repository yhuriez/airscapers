import 'dart:async';

import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final ScenarioRepository _repository = sl();
  final InitStartDateUseCase _initStartDateUseCase = sl();

  Timer _globalTimer;
  int timeLeft;

  @override
  TimerState get initialState => TimerState(loading: true);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    try {
      if (event is InitTimerEvent) {
        yield* initTimer();

      } else if (event is TickTimerEvent) {
        timeLeft--;
        if (timeLeft < 0) {
          this.add(EndTimerEvent());
        } else {
          yield TimerState(durationLeft: timeLeft);
        }

      } else if (event is EndTimerEvent) {
        _globalTimer.cancel();
        _globalTimer = null;
        timeLeft = null;
        yield TimerState(end: true);

      } else {
        throw Exception("Event not handled : $event");
      }
    } catch (exception, stack) {
      debugPrintStack(stackTrace: stack, label: exception.toString());
    }
  }

  Stream<TimerState> initTimer() async* {
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
        add(TickTimerEvent());
      });

      yield TimerState(durationLeft: timeLeft);

    } catch (exception, stack) {
      debugPrintStack(stackTrace: stack, label: exception.toString());
      yield null;
    }
  }
}

/// EVENT
abstract class TimerEvent {}

class InitTimerEvent extends TimerEvent {}

class TickTimerEvent extends TimerEvent {}

class EndTimerEvent extends TimerEvent {}

/// STATE
class TimerState {
  final int durationLeft;
  final bool loading;
  final bool end;

  TimerState({this.durationLeft, this.loading = false, this.end = false});
}
