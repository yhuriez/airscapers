import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/helpers.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/usecases/end_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_confirm_dialog.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class SuccessScreen extends StatelessWidget {
  static const routeName = "/success";

  ScenarioRepository get _repository => sl();
  EndScenarioUseCase get _endScenarioUseCase => sl();
  CountCluesUseCase get _countCluesUseCase => sl();
  TimeUsedUseCase get _timeUsedUseCase => sl();

  static Route<void> createRoute() {
    return createFadeRoute<void>(SuccessScreen(), SuccessScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Description
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  _repository.endText,
                  style: TextStyle(
                      fontSize: 20,

                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
              ),

              // Clues used
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: _createClueUsedRow(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: _createTimeUsedRow(),
              ),
            ],
          ),
        ),
        finishButton
      ]),
    );
  }

  Widget _createClueUsedRow() {

    final count = _countCluesUseCase.execute();

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Indices utilisés : ",
            style: TextStyle(fontSize: 20, color: textColor)),
        Text(count.toString(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor)),
      ],
    );
  }

  Widget _createTimeUsedRow() {

    final timeUsed = _timeUsedUseCase.execute();

    final formattedTime = formatDuration(Duration(seconds: timeUsed));

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Fini en : ",
            style: TextStyle(fontSize: 20, color: textColor)),
        Text(formattedTime,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor)),
      ],
    );
  }

  Widget get finishButton => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ARSButton(
          text: Text(
            "Quitter",
            style: TextStyle(color: Colors.black),
          ),
          onClick: _showQuitDialog,
          height: 60,
          backgroundColor: Colors.white,
        ),
      );

  _showQuitDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => ARSConfirmDialog(
          onCancelClicked: (context) =>
              Navigator.of(context, rootNavigator: true).pop(),
          onOkClicked: onBackHomePressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Quitter le scénario supprimera vos résultats et vous ramènera à la page d'accueil.\n\nEtes-vous sûr de vouloir quitter ?",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ));
  }

  onBackHomePressed(BuildContext context) async {
    await _endScenarioUseCase.execute();

    Future.delayed(
        Duration.zero,
        () => Navigator.of(context, rootNavigator: true)
            .pushAndRemoveUntil(WelcomeScreen.createRoute(), (route) => false));
  }
}
