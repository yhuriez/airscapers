
import 'dart:async';

class TimerManager {

  late Timer _globalTimer;
  late Timer _secondTimer;

  late int _timeLeft;

  late StreamController<int> _controller;

  Stream<int> get stream => _controller.stream;


  void startTimer(DateTime initialDate) {
    final scenarioDuration = Duration(hours: 1);

    final durationLeft = scenarioDuration - DateTime.now().difference(initialDate);
    _timeLeft = durationLeft.inSeconds;

    _controller = StreamController<int>.broadcast();

    _secondTimer = Timer(durationLeft, (){
      _controller.close();
    });

    _globalTimer = Timer.periodic(Duration(seconds: 1), (timer){
      if(!_controller.isClosed){
        _controller.add(_timeLeft);
        _timeLeft--;
      }
    });
  }
}