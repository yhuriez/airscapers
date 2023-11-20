
import 'package:airscaper/views/home/state/inventory_state.dart';
import 'package:airscaper/views/home/state/timer_state.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:airscaper/views/init/state/scenario_index_state.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/usecases/init/init_app_use_case.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  final initResponse = await sl<InitAppUseCase>().execute();

  var initialScreen;
  switch (initResponse) {
    case InitAppResponse.NO_SCENARIO:
      initialScreen = WelcomeScreen();
      break;
    case InitAppResponse.HAS_SCENARIO:
      initialScreen = HomeScreen();
      break;
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ScenarioIndexState()),
      ChangeNotifierProvider(create: (_) => InventoryState()),
      ChangeNotifierProvider(create: (_) => TimerState())
    ],
    child: MainApp(
      child: initialScreen,
    ),
  ));
}

class MainApp extends StatelessWidget {
  final Widget child;

  const MainApp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Airscapers',
        theme: ThemeData(
          primaryColor: Colors.black,
          colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: child);
  }
}
