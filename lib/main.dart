import 'package:airscaper/domain/usecases/init_use_cases.dart';
import 'package:airscaper/views/home/bloc/inventory_state.dart';
import 'package:airscaper/views/home/bloc/timer_state.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:airscaper/views/init/state/scenario_index_state.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  final initResponse = await sl<InitAppUseCase>().execute();

  var initialScreen;
  switch(initResponse) {
    case InitAppResponse.NO_SCENARIO:
      initialScreen = WelcomeScreen();
      break;
    case InitAppResponse.HAS_SCENARIO:
      initialScreen = HomeScreen();
      break;
  }

  runApp(MainApp(child: initialScreen,));
}

class MainApp extends StatelessWidget {
  final Widget child;

  const MainApp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: MaterialApp(
        title: 'Airscapers',
        theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: child
      ),
    );
  }

  List<ChangeNotifierProvider> getProviders() => [
    ChangeNotifierProvider(create: (_) => ScenarioIndexState()),
    ChangeNotifierProvider(create: (_) => InventoryState()),
    ChangeNotifierProvider(create: (_) => TimerState())
  ];
}
