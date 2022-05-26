import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'injection.dart';

Future<void> main() async {
  await init();

  final initAppUseCase = sl<InitAppUseCase>();
  final initResponse = await initAppUseCase.execute();

  var initialRoute;
  if (initResponse is NoScenarioResponse) {
    initialRoute = WelcomeScreen.routeName;
  } else if (initResponse is HasScenarioResponse) {
    initialRoute = HomeScreen.routeName;
  }

  runApp(MainApp(initialRoute: initialRoute,));
}

class MainApp extends StatelessWidget {
  final String initialRoute;

  const MainApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airscapers',
      theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: _getHome()
    );
  }

  Widget _getHome() {
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
