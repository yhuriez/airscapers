import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/entities/scenario.dart';
import 'package:airscaper/common/entities/scenario_item.dart';
import 'package:airscaper/common/entities/scenario_reference.dart';
import 'package:airscaper/app/usecases/init_use_cases.dart';
import 'package:airscaper/app/views/common/ars_button.dart';
import 'package:airscaper/app/views/common/ars_dialog_base.dart';
import 'package:airscaper/app/views/home/home_screen.dart';
import 'package:airscaper/app/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  RegisterScenarioUseCase get registerScenarioUseCase => sl();

  @override
  Widget build(BuildContext context) {
    StartScenarioParameter arguments =
        ModalRoute
            .of(context)
            .settings
            .arguments;
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

            (scenario.name == "Tutoriel")
                ? createTutorialPDFAccessButton()
                : Container(),

            createStartScenarioButton(scenario)

          ],
        ),
      ),
    );
  }

  Widget createTutorialPDFAccessButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ARSButton(
        backgroundColor: Colors.green,
        text: Text(
          "Accéder aux QR codes",
          style: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
        ),
        onClick: _launchUrl,
        height: 50,
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
    await registerScenarioUseCase.execute(context, scenario);
    Navigator.of(context, rootNavigator: true)
        .pushAndRemoveUntil(HomeScreen.createRoute(true), (route) => false);
  }

  _launchUrl(BuildContext context) async {
    const url = "https://drive.google.com/file/d/1UU6Erdvv3bm_IoO_ft-tDvU6AMBAROFh/view?usp=sharing";
    if (await canLaunch(url))
      launch(url);
    else {
      showDialog(context: context,
          child: ARSDialogBase(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Une erreur est survenue, merci de vérifier votre connexion internet",
              textAlign: TextAlign.center,),
          ),));
    }
  }
}