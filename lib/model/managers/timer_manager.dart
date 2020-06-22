
import 'dart:async';

class TimerManager {

  Timer _globalTimer;
  Timer _secondTimer;

  int timeLeft;

  StreamController<int> _controller;

  Stream<int> get stream => _controller.stream;


  void startTimer(DateTime initialDate) {
    final scenarioDuration = Duration(hours: 1);

    final durationLeft = scenarioDuration - DateTime.now().difference(initialDate);
    timeLeft = durationLeft.inSeconds;

    _controller = StreamController<int>.broadcast();

    _secondTimer = Timer(durationLeft, (){
      _controller.close();
    });

    _globalTimer = Timer.periodic(Duration(seconds: 1), (timer){
      if(!_controller.isClosed){
        _controller.add(timeLeft);
        timeLeft--;
      }
    });
  }
}