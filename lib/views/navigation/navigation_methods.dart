import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/views/common/dialog_content.dart';
import 'package:airscaper/views/home/success_screen.dart';
import 'package:airscaper/views/inventory/inventory_details_screen.dart';
import 'package:airscaper/views/mechanism/mechanism_screen.dart';
import 'package:flutter/material.dart';

import 'fade_page_route.dart';


Future navigateTo(BuildContext context, NavigationIntent intent) {
  return _doNavigate(context, intent, false);
}

Future navigateReplaceTo(BuildContext context, NavigationIntent intent) {
  return _doNavigate(context, intent, true);
}

Future _doNavigate(BuildContext context, NavigationIntent intent, bool replace) {
  return intent.when(
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

Future<T?> _pushTo<T>(BuildContext context, Route<T> route, bool replace, {bool root = false}) async {
  if(replace) {
    return Navigator.of(context, rootNavigator: root).pushReplacement(route);
  } else {
    return Navigator.of(context, rootNavigator: root).push(route);
  }
}

Future<void> navigateShowDialog(BuildContext context, DialogArguments arguments) {
  return showDialog(
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
