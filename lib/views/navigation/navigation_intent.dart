import 'package:flutter/material.dart';

class NavigationIntent {
  final String screenName;
  final dynamic arguments;
  final bool rootNavigator;
  final Route<Object> route;

  NavigationIntent(this.screenName, this.arguments,
      {this.rootNavigator = false, required this.route});
}
