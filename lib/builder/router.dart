import 'package:airscaper/builder/views/editor/editor_screen.dart';
import 'package:airscaper/builder/views/home/home_screen.dart';
import 'package:airscaper/builder/views/login/create_account_screen.dart';
import 'package:airscaper/builder/views/login/login_screen.dart';
import 'package:airscaper/builder/views/session/logged_screen.dart';
import 'package:airscaper/builder/views/session/not_logged_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> loggedRoutes = {
  HomeScreen.screenName: (context) => HomeScreen(),
  EditorScreen.screenName: (context) => EditorScreen()
};

final Map<String, Widget Function(BuildContext)> notLoggedRoutes = {
  LoginScreen.screenName: (context) => LoginScreen(),
  CreateAccountScreen.screenName: (context) => CreateAccountScreen()
};


Route<dynamic> generateRoutes(RouteSettings settings) {
  var routeBuilder = loggedRoutes[settings.name];
  if (routeBuilder != null) {
    return MaterialPageRoute(
        builder: (context) => LoggedScreen(builder: routeBuilder));
  }

  routeBuilder = notLoggedRoutes[settings.name];
  if (routeBuilder != null) {
    return MaterialPageRoute(
        builder: (context) => NotLoggedScreen(builder: routeBuilder));
  }

  throw UnsupportedError("No screen defined for ${settings.name}");
}