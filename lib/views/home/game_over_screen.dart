import 'package:airscaper/common/colors.dart';
import 'package:airscaper/usecases/end_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class GameOverScreen extends StatelessWidget {
  static const routeName = "/gameover";

  EndScenarioUseCase get _endScenarioUseCase => sl();
  ComputeCompletionUseCase get _completionUseCase => sl();

  static Route<dynamic> createRoute() {
    return createFadeRoute(GameOverScreen(), GameOverScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    "Le temps est écoulé",
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
                  ),

                  // Description
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Pourcentage d'achèvement :",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                    ),
                  ),

                  // Percentage
                  FutureBuilder<int>(
                    future: _completionUseCase.execute(),
                    builder: (context, snapshot) {
                      if(snapshot.data == null) return Container();

                      return _createPercentage(snapshot.data);
                    }
                  ),

                ]),
          ),

          // Finish button
          finishButton
        ],
      ),
    );
  }

  Widget _createPercentage(int percentage) => AnimatedOpacity(
    // If the widget is visible, animate to 0.0 (invisible).
    // If the widget is hidden, animate to 1.0 (fully visible).
    opacity: 1.0,
    duration: Duration(milliseconds: 3000),
    // The green box must be a child of the AnimatedOpacity widget.
    child: Text(
      "$percentage %",
      style: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: textColor),
    ),
  );

  Widget get finishButton =>
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ARSButton(
          text: Text(
            "Rejouer",
            style: TextStyle(color: Colors.black),
          ),
          onClick: onBackHomePressed,
          height: 60,
          backgroundColor: Colors.white,
        ),
      );

  onBackHomePressed(BuildContext context) async {
    await _endScenarioUseCase.execute();

    Future.delayed(
        Duration.zero,
            () =>
            Navigator.of(context, rootNavigator: true)
                .pushAndRemoveUntil(
                WelcomeScreen.createRoute(), (route) => false));
  }
}