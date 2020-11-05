import 'package:airscaper/graph/graph_screen.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:catcher/core/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/mode/dialog_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'injection.dart';

Future<void> main() async {
  await init();

  // WidgetsFlutterBinding.ensureInitialized();
  //
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationSupportDirectory()
  // );

  final initAppUseCase = sl<InitAppUseCase>();
  final initResponse = await initAppUseCase.execute();

  var initialRoute;
  if (initResponse is NoScenarioResponse) {
    initialRoute = WelcomeScreen.routeName;
  } else if (initResponse is HasScenarioResponse) {
    initialRoute = HomeScreen.routeName;
  }

  runApp(MainApp(initialRoute: initialRoute,));

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
      theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: _getHome()
    );
  }

  Widget _getHome() {

    if(kIsWeb) return GraphScreen();

    switch(this.initialRoute) {
      case WelcomeScreen.routeName:
        return WelcomeScreen();
      case HomeScreen.routeName:
        return HomeScreen();
      default:
        throw Exception("Unknown route");
    }
  }
}
