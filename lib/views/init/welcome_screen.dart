import 'package:airscaper/common/colors.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/models/scenario_reference.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/init/start_scenario_screen.dart';
import 'package:airscaper/views/init/state/scenario_index_state.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/choose";

  static Route createRoute() {
    return createFadeRoute(WelcomeScreen(), WelcomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(child: WelcomeScreenBody()),
      ),
    );
  }
}


class WelcomeScreenBody extends StatelessWidget {

  const WelcomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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

              Text(
                "Airscapers",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ],
          ),
        ),

        // Code input
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ARSCodeTextField(
              callback: (context, code) => checkScenarioCode(context, code),
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
            onClick: (context) => onTutorialClicked(context),
            height: 60,
          ),
        )
      ],
    );
  }

  checkScenarioCode(BuildContext context, String code) {

    final state = context.read<ScenarioIndexState>();

    if (state.checkScenarioCode(code)) {
      onCodeValidated(context, code);

    } else {
      navigateShowDialog(
          context,
          DialogArguments(
              "Code invalide", "Ce code n'existe pas dans l'application"));
    }
  }

  onCodeValidated(BuildContext context, String code) {

    final state = context.read<ScenarioIndexState>();

    final scenario = state.getScenarioByCode(code);
    if (scenario != null) {
      goToScenarioStart(context, scenario);
    }
  }

  onTutorialClicked(BuildContext context) {
    onCodeValidated(context, "tuto");
  }

  goToScenarioStart(BuildContext context, ScenarioReference scenario) {
    Navigator.of(context, rootNavigator: true)
        .push(StartScenarioScreen.createRoute(scenario));
  }
}
