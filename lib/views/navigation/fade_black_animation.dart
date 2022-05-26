


import 'package:flutter/material.dart';

class FadeBlackAnimation extends StatelessWidget {

  final Animation<double> animation;
  final Widget child;

  const FadeBlackAnimation({Key? key, this.animation, this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FadeTransition(
          opacity: new Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Interval(0.0, 0.5),
          )),
          child: Container(
            color: Colors.black,
          ),
        ),
        FadeTransition(
          opacity: new Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Interval(0.5, 1.0),
          )),
          child: child,
        )
      ],
    );
  }
}