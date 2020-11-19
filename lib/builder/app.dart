import 'package:airscaper/builder/router.dart';
import 'package:airscaper/builder/views/home/home_screen.dart';
import 'package:catcher/core/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/mode/dialog_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'injection.dart';

Future<void> initBuilder() async {
  await initDI();

  WidgetsFlutterBinding.ensureInitialized();

  final app = initGlobalState(MainApp());

  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

  Catcher(app, debugConfig: debugOptions);
}

class MainApp extends StatelessWidget {
  final String initialRoute;

  const MainApp({Key key, this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Catcher.navigatorKey,
        title: 'Airscapers',
        // localizationsDelegates: localizationDelegates,
        theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.white),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoutes,
        initialRoute: HomeScreen.screenName);
  }
}