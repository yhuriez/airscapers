import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/state/timer_state.dart';

class ARSClock extends StatelessWidget {

  final Function(BuildContext) onEnd;

  const ARSClock({Key? key, required this.onEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final state = context.watch<TimerState>();

    if (state.end) {
      onEnd(context);
      return Container();
    }

    return Text(state.durationLeft,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white));
  }
}
