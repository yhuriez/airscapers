import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/views/home/end_screen.dart';
import 'package:airscaper/views/home/home_scenario_screen.dart';
import 'package:airscaper/views/home/scan_screen.dart';
import 'package:airscaper/views/home/timer_bloc.dart';
import 'package:airscaper/views/init/scenario_choose_screen.dart';
import 'package:airscaper/views/init/scenario_start_screen.dart';
import 'package:airscaper/views/inventory/inventory_details_screen.dart';
import 'package:airscaper/views/inventory/inventory_items_screen.dart';
import 'package:airscaper/views/inventory/inventory_tracks_screen.dart';
import 'package:airscaper/views/code/code_screen.dart';
import 'package:airscaper/views/mechanism/mechanism_screen.dart';
import 'package:catcher/core/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/mode/dialog_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';

Future<void> main() async {
  await init();

  final initAppUseCase = sl<InitAppUseCase>();
  final initResponse = await initAppUseCase.execute();

  var initialRoute;
  if (initResponse is NoScenarioResponse) {
    initialRoute = ChooseScenarioScreen.routeName;
  } else if (initResponse is HasScenarioResponse) {
    initialRoute = HomeScenarioScreen.routeName;
  }

  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

  Catcher(MainApp(initialRoute: initialRoute), debugConfig: debugOptions);
}

class MainApp extends StatelessWidget {
  final String initialRoute;

  const MainApp({Key key, this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: initProviders(),
      child: MaterialApp(
        navigatorKey: Catcher.navigatorKey,
        title: 'Airscapers',
        theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.black),
        debugShowCheckedModeBanner: false,
        routes: {
          // init
          ChooseScenarioScreen.routeName: (context) => ChooseScenarioScreen(),
          ScenarioStartScreen.routeName: (context) => ScenarioStartScreen(),

          // Home
          HomeScenarioScreen.routeName: (context) => HomeScenarioScreen(),
          ScanScreen.routeName: (context) => ScanScreen(),
          InventoryItemsScreen.routeName: (context) => InventoryItemsScreen(),
          InventoryTracksScreen.routeName: (context) => InventoryTracksScreen(),
          InventoryDetailsScreen.routeName: (context) => InventoryDetailsScreen(),

          // Mechanism
          MechanismScreen.routeName: (context) => MechanismScreen(),
          CodeScreen.routeName: (context) => CodeScreen(),
          GameOverScreen.routeName: (context) => GameOverScreen()
        },
        initialRoute: initialRoute,
      ),
    );
  }

  List<BlocProvider> initProviders() {
    return [
      BlocProvider<TimerBloc>(
        create: (context) => TimerBloc(),
      )
    ];
  }
}
