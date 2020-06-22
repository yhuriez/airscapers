
import 'package:flutter/material.dart';

class NavigationIntent {
  final String screenName;
  final Object arguments;
  final BackStackBehavior backStackBehavior;

  NavigationIntent(this.screenName, this.arguments, {this.backStackBehavior});
}


enum BackStackBehavior {
  NO_BACK_STACK,
  HOME_TO_BACK_STACK
}