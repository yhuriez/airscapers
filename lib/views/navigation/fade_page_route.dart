import 'package:flutter/material.dart';


class FadeBPageRoute<T> extends MaterialPageRoute<T> {
  FadeBPageRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
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
