import 'package:airscaper/common/colors.dart';
import 'package:airscaper/model/entities/scenario_reference.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/init/start_scenario_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../injection.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/choose";

  final InitScenarioIndexUseCase _initScenarioIndexUseCase = sl();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: FutureBuilder<InitIndexResponse>(
            future: _initScenarioIndexUseCase.execute(context),
            builder: (context, snapshot) {
              final scenarioResponse = snapshot.data;

              if (scenarioResponse is FailedInitIndexResponse) {
                return Container(
                  child: Center(
                    child: Text("Error while loading index"),
                  ),
                );
              } else if (scenarioResponse is ScenarioChoiceInitResponse) {
                final scenarios = scenarioResponse.scenarios;
                return createCoreScreen(context, scenarios);
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  createCoreScreen(BuildContext context, List<ScenarioReference> scenarios) =>
      SafeArea(
        child: Column(
          children: [
            // Header image
            (KeyboardVisibilityProvider.isKeyboardVisible(context))
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                            "assets/images/common/airscapers_inverted.png")),
                  ),

            // Title
            Center(
                child: Text(
              "Airscapers",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            )),

            // Space
            Expanded(child: Container()),

            // Code input
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ARSCodeTextField(
                acceptedValues: scenarios.map((it) => it.code).toList(),
                callback: (context, code) => onCodeValidated(context, code, scenarios),
                hint: "Entrez le code de votre scénario",
                validationErrorMessage: "Ce code n'existe pas",
              ),
            ),

            // Tutorial indicator
            Center(
                child: Text(
              "OU",
              style: TextStyle(fontSize: 16, color: Colors.white),
            )),

            // Tutorial button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ARSButton(
                text: Text(
                  "Démarrer le tutoriel",
                  style: TextStyle(fontSize: 16),
                ),
                onClick: (context) => onTutorialClicked(context, scenarios),
                height: 60,
              ),
            )
          ],
        ),
      );

  onCodeValidated(BuildContext context, String code, List<ScenarioReference> scenarios) {
    final scenario = scenarios.firstWhere((element) => element.code == code);
    if(scenario != null) {
      goToScenarioStart(context, scenario);
    }
  }

  onTutorialClicked(BuildContext context, List<ScenarioReference> scenarios) {
    onCodeValidated(context, "tuto", scenarios);
  }

  goToScenarioStart(BuildContext context, ScenarioReference scenario) {
    Navigator.pushNamed(context, StartScenarioScreen.routeName,
        arguments: StartScenarioParameter(scenario));
  }
}
