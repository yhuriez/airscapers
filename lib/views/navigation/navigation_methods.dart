import 'package:airscaper/views/home/home_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String dialogRouteName = "dialog";

navigateTo(BuildContext context, NavigationIntent intent) {
  if (intent.screenName == dialogRouteName) {
    navigateShowDialog(context, intent.arguments);
  } else {
    if (intent.backStackBehavior != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          intent.screenName, getBackStackPredicate(intent.backStackBehavior),
          arguments: intent.arguments);
    } else {
      Navigator.of(context)
          .pushNamed(intent.screenName, arguments: intent.arguments);
    }
  }
}

navigateReplaceTo(BuildContext context, NavigationIntent intent) {
  if (intent.screenName == dialogRouteName) {
    navigateShowDialog(context, intent.arguments);
  } else {
    Navigator.of(context)
        .pushReplacementNamed(intent.screenName, arguments: intent.arguments);
  }
}

createDialogNavigationIntent(String title, String message) {
  return NavigationIntent(dialogRouteName, DialogArguments(title, message));
}

bool Function(Route<dynamic>) getBackStackPredicate(
    BackStackBehavior behavior) {
  if (behavior == BackStackBehavior.NO_BACK_STACK) {
    return (it) => false;
  } else if (behavior == BackStackBehavior.NO_BACK_STACK) {
    return (it) {
      print("-- Back name:" + it.settings.name);
      return it.settings.name == HomeScreen.routeName;
    };
  }
  return (it) => true;
}

navigateShowDialog(BuildContext context, DialogArguments arguments) {
  showDialog(
      context: context,
      child: DialogContent(
        arguments: arguments,
      ));
}

class DialogArguments {
  final String title;
  final String message;

  DialogArguments(this.title, this.message);
}

class DialogContent extends StatelessWidget {
  final DialogArguments arguments;

  const DialogContent({Key key, @required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                (arguments.title == null || arguments.title == "")
                    ? Container(
                        width: 0,
                        height: 0,
                      )
                    : Text(arguments.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(arguments.message, style: TextStyle(fontSize: 15)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
