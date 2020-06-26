import 'package:airscaper/views/home/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';

class ARSClock extends StatefulWidget {

  final Function(BuildContext) onEnd;

  const ARSClock({Key key, this.onEnd}) : super(key: key);

  @override
  _ARSClockState createState() => _ARSClockState();
}

class _ARSClockState extends State<ARSClock> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        if (state.loading) {
          return loadingView;
        }

        if (state.end) {
          widget.onEnd(context);
          return Container();
        }

        final durationLeft = Duration(seconds: state.durationLeft);
        final textValue = formatDuration(durationLeft);
        return Text(textValue, style: TextStyle(fontSize: 80, color: Colors.white));
      },
    );
  }

  String formatDuration(Duration duration) {
    return "${twoDigits(duration.inMinutes)} : ${twoDigits(duration.inSeconds.remainder(60))}";
  }

  String twoDigits(int n) => (n >= 10) ? "$n" : "0$n";

  Widget get loadingView => JumpingDotsProgressIndicator(
      numberOfDots: 4, fontSize: 40.0, dotSpacing: 2.0);
}
