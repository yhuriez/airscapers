



import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/usecases/init_use_cases.dart';
import 'package:airscaper/injection.dart';
import 'package:flutter/material.dart';

class TimerState extends ChangeNotifier {

  late int _durationLeft;
  bool _loading = true;
  bool _end = false;

  ScenarioRepository get _repository => sl();
  InitStartDateUseCase get _initStartDateUseCase => sl();



  initTimer() async {
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