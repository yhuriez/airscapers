import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/views/common/dialog_content.dart';
import 'package:airscaper/views/home/success_screen.dart';
import 'package:airscaper/views/inventory/inventory_details_screen.dart';
import 'package:airscaper/views/mechanism/mechanism_screen.dart';
import 'package:flutter/material.dart';

import 'fade_page_route.dart';


navigateTo(BuildContext context, NavigationIntent intent) {
  intent.when(
    // Show success screen
      success: () => Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed(SuccessScreen.routeName),

      // Show mechanism page
      mechanism: (mechanism) => Navigator.of(context)
          .pushReplacement(MechanismFragment.route(mechanism)),

      // Show item details pages
      itemDetails: (item) => Navigator.of(context, rootNavigator: true)
          .pushReplacement(InventoryDetailsFragment.route(item)),

      // Show dialog
      dialog: (arguments) => navigateShowDialog(context, arguments)
  );
}

navigateReplaceTo(BuildContext context, NavigationIntent intent) {
  navigateTo(context, intent);
}


navigateShowDialog(BuildContext context, DialogArguments arguments) {
  showDialog(
      context: context,
      builder: (context) => DialogContent(
        arguments: arguments,
      ));
}

FadeBlackPageRoute<Object> createFadeRoute(Widget child, String name,
        {dynamic arguments}) =>
    FadeBlackPageRoute(
        builder: (context) => child,
        settings: RouteSettings(name: name, arguments: arguments));
