import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/entities/scenario_reference.dart';
import 'package:airscaper/app/usecases/init_use_cases.dart';
import 'package:airscaper/app/views/common/ars_button.dart';
import 'package:airscaper/app/views/common/ars_code_text_field.dart';
import 'package:airscaper/app/views/init/start_scenario_screen.dart';
import 'package:airscaper/app/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../injection.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/choose";

  static Route<dynamic> createRoute() {
    return createFadeRoute(WelcomeScreen(), WelcomeScreen.routeName);
  }

  InitScenarioIndexUseCase get _initScenarioIndexUseCase => sl();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Scaffold(
        backgroundColor: arsBackgroundColor,
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
                  callback: (context, code) =>
                      checkScenarioCode(context, code, scenarios),
                  hint: "Entrez le code de votre scénario"
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

  checkScenarioCode(BuildContext context, String code,
      List<ScenarioReference> scenarios) {
    final acceptedValues = scenarios.map((it) => it.code).toList();
    if (!acceptedValues.contains(code.toLowerCase())) {
      navigateShowDialog(
          context,
          DialogArguments(
              "Code invalide", "Ce code n'existe pas dans l'application"));

    } else {
      onCodeValidated(context, code, scenarios);
    }
  }

  onCodeValidated(BuildContext context, String code,
      List<ScenarioReference> scenarios) {
    final scenario = scenarios.firstWhere(
            (element) => element.code.toLowerCase() == code.toLowerCase());
    if (scenario != null) {
      goToScenarioStart(context, scenario);
    }
  }

  onTutorialClicked(BuildContext context, List<ScenarioReference> scenarios) {
    onCodeValidated(context, "tuto", scenarios);
  }

  goToScenarioStart(BuildContext context, ScenarioReference scenario) {
    Navigator.of(context, rootNavigator: true)
        .push(StartScenarioScreen.createRoute(scenario));
  }
}
