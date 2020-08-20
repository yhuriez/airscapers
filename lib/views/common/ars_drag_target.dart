import 'package:flutter/material.dart';

class ARSDragTarget<T> extends StatelessWidget {
  final Widget child;
  final OnAcceptedData<T> acceptedData;

  const ARSDragTarget({Key key,
    @required this.child,
    @required this.acceptedData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<T>(
        builder: (context, incoming, rejected) {
          if (incoming.isNotEmpty) {
            // Add an overlay when draggable is above drag target
            return Stack(
              children: [child, Container(color: Colors.white30)],
            );
          }
          return child;
        },
        onWillAccept: (data) => true,
        onAccept: (data) => acceptedData(context, data)
    );
  }
}

typedef OnAcceptedData<T>(BuildContext context, T acceptedData);

typedef OnLeaveData<T>(BuildContext context, T acceptedData);
