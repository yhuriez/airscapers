import 'package:airscaper/common/colors.dart';
import 'package:airscaper/model/entities/scenario.dart';
import 'package:airscaper/model/entities/scenario_reference.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class StartScenarioParameter {
  final ScenarioReference scenario;

  StartScenarioParameter(this.scenario);
}

class StartScenarioScreen extends StatelessWidget {
  static const routeName = "/start";

  static Route<dynamic> createRoute(ScenarioReference scenario) {
    return createFadeRoute(StartScenarioScreen(), StartScenarioScreen.routeName,
        arguments: StartScenarioParameter(scenario));
  }

  final registerScenarioUseCase = sl<RegisterScenarioUseCase>();

  @override
  Widget build(BuildContext context) {
    StartScenarioParameter arguments =
        ModalRoute.of(context).settings.arguments;
    ScenarioReference scenario = arguments.scenario;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar:
          AppBar(title: Text(scenario.name), centerTitle: true, elevation: 0),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(scenario.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ARSButton(
                text: Text(
                  "Démarrer le scénario",
                  style: TextStyle(color: Colors.black),
                ),
                onClick: (context) {
                  onStartClicked(context, scenario);
                },
                height: 60,
              ),
            )
          ],
        ),
      ),
    );
  }

  onStartClicked(BuildContext context, ScenarioReference scenario) async {
    await registerScenarioUseCase.execute(context, scenario);
    Navigator.of(context, rootNavigator: true)
        .pushAndRemoveUntil(HomeScreen.createRoute(), (route) => false);
  }
}
