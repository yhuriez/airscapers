import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/helpers.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/end_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_confirm_dialog.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class SuccessScreen extends StatelessWidget {
  static const routeName = "/success";

  ScenarioRepository get _repository => sl();
  EndScenarioUseCase get _endScenarioUseCase => sl();
  CountCluesUseCase get _countCluesUseCase => sl();
  TimeUsedUseCase get _timeUsedUseCase => sl();

  static Route<dynamic> createRoute() {
    return createFadeRoute(SuccessScreen(), SuccessScreen.routeName);
  }

  static NavigationIntent navigate() => NavigationIntent(routeName, null,
      rootNavigator: true, route: createRoute());

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
                padding: const EdgeInsets.symmetric(vertical: 16.0),
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
    return FutureBuilder<int>(
        future: _countCluesUseCase.execute(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Indices utilisés : ",
                  style: TextStyle(fontSize: 20, color: textColor)),
              Text(snapshot.data.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor)),
            ],
          );
        });
  }

  Widget _createTimeUsedRow() {
    return FutureBuilder<int>(
        future: _timeUsedUseCase.execute(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          final formattedTime =
              formatDuration(Duration(seconds: snapshot.data));

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
        });
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
        child: ARSConfirmDialog(
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
