import 'package:flutter/material.dart';

class NavigationIntent {
  final String screenName;
  final Object arguments;
  final bool rootNavigator;
  final Route<dynamic> route;

  NavigationIntent(this.screenName, this.arguments,
      {this.rootNavigator = false, this.route});
}
