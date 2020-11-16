import 'package:airscaper/builder/configuration/i18n_config.dart';
import 'package:airscaper/builder/domain/session_storage.dart';
import 'package:airscaper/builder/views/home/home_screen.dart';
import 'package:airscaper/builder/views/login/login_screen.dart';
import 'package:catcher/core/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/mode/dialog_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'injection.dart';

Future<void> initBuilder() async {
  await init();

  WidgetsFlutterBinding.ensureInitialized();

  final session = await loadSession();

  var initialRoute;
  if (session != null) {
    initialRoute = HomeScreen.screenName;
  } else {
    initialRoute = LoginScreen.screenName;
  }

  runApp(MainApp(
    initialRoute: initialRoute,
  ));

  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

  Catcher(MainApp(initialRoute: initialRoute), debugConfig: debugOptions);
}


class MainApp extends StatelessWidget {
  final String initialRoute;

  const MainApp({Key key, this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Catcher.navigatorKey,
        title: 'Airscapers',
        localizationsDelegates: localizationDelegates,
        theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: _getHome());
  }

  Widget _getHome() {
    if(initialRoute == HomeScreen.screenName) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
