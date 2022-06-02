import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/views/common/dialog_content.dart';
import 'package:airscaper/views/home/success_screen.dart';
import 'package:airscaper/views/inventory/inventory_details_screen.dart';
import 'package:airscaper/views/mechanism/mechanism_screen.dart';
import 'package:flutter/material.dart';

import 'fade_page_route.dart';


navigateTo(BuildContext context, NavigationIntent intent) {
  _doNavigate(context, intent, false);
}

navigateReplaceTo(BuildContext context, NavigationIntent intent) {
  _doNavigate(context, intent, true);
}

_doNavigate(BuildContext context, NavigationIntent intent, bool replace) {
  intent.when(
    // Show success screen
      success: () => _pushTo(context, SuccessScreen.createRoute(), replace, root: true),

      // Show mechanism page
      mechanism: (mechanism) => _pushTo(context, MechanismFragment.route(mechanism), replace),

      // Show item details pages
      itemDetails: (item) => _pushTo(context, InventoryDetailsFragment.route(item), replace),

      // Show dialog
      dialog: (arguments) => navigateShowDialog(context, arguments)
  );
}

_pushTo<T>(BuildContext context, Route<T> route, bool replace, {bool root = false}) {
  if(replace) {
    Navigator.of(context, rootNavigator: root).pushReplacement(route);
  } else {
    Navigator.of(context, rootNavigator: root).push(route);
  }
}

navigateShowDialog(BuildContext context, DialogArguments arguments) {
  showDialog(
      context: context,
      builder: (context) => DialogContent(
        arguments: arguments,
      ));
}

FadeBlackPageRoute<T> createFadeRoute<T>(Widget child, String name,
        {dynamic arguments}) =>
    FadeBlackPageRoute<T>(
        builder: (context) => child,
        settings: RouteSettings(name: name, arguments: arguments));
