import 'package:airscaper/common/colors.dart';
import 'package:airscaper/model/entities/scenario_reference.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:airscaper/views/home/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';


class ScenarioStartParameter {
  final ScenarioReference scenario;

  ScenarioStartParameter(this.scenario);
}

class ScenarioStartScreen extends StatelessWidget {

  static const routeName = "/start";

  @override
  Widget build(BuildContext context) {
    ScenarioStartParameter arguments = ModalRoute
        .of(context)
        .settings
        .arguments;
    ScenarioReference scenario = arguments.scenario;

    return Scaffold(
      appBar: AppBar(
        title: Text(scenario.name, style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
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
                        style: TextStyle(fontSize: 16.0)),
                  )
                ],
              ),
            ),

            ScenarioCodeInput(scenario: scenario, confirmCallback: onConfirm)
          ],
        ),
      ),
    );
  }

  onConfirm(BuildContext context){
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
  }
}

class ScenarioCodeInput extends StatefulWidget {

  final Function(BuildContext) confirmCallback;
  final ScenarioReference scenario;

  final registerScenarioUseCase = sl<RegisterScenarioUseCase>();

  ScenarioCodeInput({Key key, @required this.confirmCallback, @required this.scenario})
      : super(key: key);

  @override
  _ScenarioCodeInputState createState() => _ScenarioCodeInputState();
}

class _ScenarioCodeInputState extends State<ScenarioCodeInput> {


  @override
  Widget build(BuildContext context) {
    return ARSCodeTextField(
      confirmBuilder: createConfirmButton,
      callback: onStartClicked,
      acceptedValues: (widget.scenario.code.isEmpty) ? [] : [widget.scenario.code],
      hint: "Entrez le code du scénario",
      validationErrorMessage: "Code invalide",
    );
  }

  Widget createConfirmButton(Function(BuildContext) clickListener) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: ARSButton(
      text: Text("Démarrer le scénario", style: TextStyle(color: Colors.white),),
      onClick: clickListener,
      height: 60,
      backgroundColor: startButtonColor,
    ),
  );

  onStartClicked(BuildContext context, String value) async {
      await widget.registerScenarioUseCase.execute(context, widget.scenario);

      widget.confirmCallback(context);
  }
}