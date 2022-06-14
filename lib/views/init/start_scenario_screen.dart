import 'package:airscaper/common/colors.dart';
import 'package:airscaper/domain/usecases/init_use_cases.dart';
import 'package:airscaper/models/scenario_reference.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:airscaper/views/home/state/timer_state.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../injection.dart';

class StartScenarioParameter {
  final ScenarioReference scenario;

  StartScenarioParameter(this.scenario);
}

class StartScenarioScreen extends StatelessWidget {

  static const routeName = "/start";

  final ScenarioReference scenario;

  const StartScenarioScreen({Key? key, required this.scenario});

  static Route<Object> createRoute(ScenarioReference scenario) {
    return createFadeRoute(
        StartScenarioScreen(scenario: scenario,),
        StartScenarioScreen.routeName);
  }

  StartScenarioUseCase get _startScenarioUseCase => sl();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar:
      AppBar(
          backgroundColor: Colors.transparent,
          title: Text(scenario.name),
          centerTitle: true,
          elevation: 0
      ),

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

            createStartScenarioButton(scenario)

          ],
        ),
      ),
    );
  }

  Widget createStartScenarioButton(ScenarioReference scenario) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ARSButton(
        text: Text(
          "Démarrer le scénario",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        onClick: (context) {
          onStartClicked(context, scenario);
        },
        height: 60,
      ),
    );
  }

  onStartClicked(BuildContext context, ScenarioReference scenario) async {
    await _startScenarioUseCase.execute(scenario.id);
    context.read<TimerState>().initTimer();

    Navigator.of(context, rootNavigator: true)
        .pushAndRemoveUntil(HomeScreen.createRoute(), (route) => false);
  }
}