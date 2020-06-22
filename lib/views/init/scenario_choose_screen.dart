import 'package:airscaper/injection.dart';
import 'package:airscaper/model/entities/scenario_reference.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/init/scenario_start_screen.dart';
import 'package:flutter/material.dart';

class ChooseScenarioScreen extends StatelessWidget {

  static const routeName = "/choose";

  final InitScenarioIndexUseCase _initScenarioIndexUseCase = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text("Choisissez votre scénario",
                style: TextStyle(color: Colors.black))),
        body: FutureBuilder<Object>(
            future: _initScenarioIndexUseCase.execute(context),
            builder: (context, snapshot) {
              final scenarioResponse = snapshot.data;

              if (scenarioResponse is FailedInitIndexResponse) {
                return Container(
                  child: Center(
                    child: Text("Error while loading index"),
                  ),
                );
              } else if(scenarioResponse is ScenarioChoiceInitResponse) {

                final scenarios = scenarioResponse.scenarios;

                return Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: scenarios
                          .map((it) => Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ARSButton(
                                  text: Text(it.name,),
                                  onClick: (BuildContext context) {
                                    onScenarioClicked(context, it);
                                  },
                                  height: 100,
                                  image: it.image,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                );
              }
              else {
                return Container();
              }
            }));
  }

  onScenarioClicked(BuildContext context, ScenarioReference scenario) async {
    Navigator.pushNamed(context, ScenarioStartScreen.routeName,
        arguments: ScenarioStartParameter(scenario));
  }
}
