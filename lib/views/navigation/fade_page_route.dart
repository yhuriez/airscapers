import 'package:airscaper/views/navigation/fade_black_animation.dart';
import 'package:flutter/material.dart';


class FadeBlackPageRoute<T> extends MaterialPageRoute<T> {
  FadeBlackPageRoute({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeBlackAnimation(animation: animation, child: child);
  }
}


