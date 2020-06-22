import 'package:airscaper/common/colors.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/init/scenario_choose_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  static const routeName = "/gameover";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Text(
              "Le temps est écoulé",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ARSButton(
              text: Text("Rejouer", style: TextStyle(color: Colors.white),),
              onClick: onBackHomePressed,
              height: 60,
              backgroundColor: startButtonColor,
            ),
          )
        ],
      ),
    );
  }

  onBackHomePressed(BuildContext context) {
    Future.delayed(
        Duration.zero,
        () => Navigator.of(context).pushNamedAndRemoveUntil(
            ChooseScenarioScreen.routeName, (route) => false));
  }
}
