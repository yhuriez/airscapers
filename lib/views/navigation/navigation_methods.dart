import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fade_page_route.dart';

const String dialogRouteName = "dialog";

navigateTo(BuildContext context, NavigationIntent intent) {
  if(intent.route != null) {
    Navigator.of(context, rootNavigator: intent.rootNavigator)
        .push(intent.route);

  } else if (intent.screenName == dialogRouteName) {
    navigateShowDialog(context, intent.arguments);
  } else {
    Navigator.of(context, rootNavigator: intent.rootNavigator)
        .pushNamed(intent.screenName, arguments: intent.arguments);
  }
}

navigateReplaceTo(BuildContext context, NavigationIntent intent) {
  if(intent.route != null) {
    Navigator.of(context, rootNavigator: intent.rootNavigator)
        .pushReplacement(intent.route);

  } else if (intent.screenName == dialogRouteName) {
    navigateShowDialog(context, intent.arguments);
  } else {
    Navigator.of(context, rootNavigator: intent.rootNavigator)
        .pushReplacementNamed(intent.screenName, arguments: intent.arguments);
  }
}

createDialogNavigationIntent(String title, String message) {
  return NavigationIntent(dialogRouteName, DialogArguments(title, message));
}

navigateShowDialog(BuildContext context, DialogArguments arguments) {
  showDialog(
      context: context,
      child: DialogContent(
        arguments: arguments,
      ));
}

FadeBlackPageRoute createFadeRoute(Widget child, String name,
        {dynamic arguments}) =>
    FadeBlackPageRoute(
        builder: (context) => child,
        settings: RouteSettings(name: name, arguments: arguments));

class DialogArguments {
  final String title;
  final String message;

  DialogArguments(this.title, this.message);
}

class DialogContent extends StatelessWidget {
  final DialogArguments arguments;

  const DialogContent({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSDialogBase(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (arguments.title.isEmpty)
                ? Container(
                    width: 0,
                    height: 0,
                  )
                : Text(arguments.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(arguments.message, style: TextStyle(fontSize: 15)),
            )
          ],
        ),
      ),
    );
  }
}
