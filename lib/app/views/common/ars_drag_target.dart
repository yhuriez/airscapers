import 'package:flutter/material.dart';

class ARSDragTarget<T> extends StatelessWidget {

  final DragTargetBuilder<T> targetBuilder;
  final OnAcceptedData<T> acceptedData;

  const ARSDragTarget({Key key,
    @required this.targetBuilder,
    @required this.acceptedData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<T>(
        builder: targetBuilder,
        onWillAccept: (data) => true,
        onAccept: (data) => acceptedData(context, data)
    );
  }
}

typedef OnAcceptedData<T>(BuildContext context, T acceptedData);

typedef OnLeaveData<T>(BuildContext context, T acceptedData);
