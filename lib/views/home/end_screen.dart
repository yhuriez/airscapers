import 'package:airscaper/common/colors.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {

  static const routeName = "/gameover";

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
              child: Center(
            child: Text(
              "Le temps est écoulé",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
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
        () => Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            WelcomeScreen.createRoute(), (route) => false));
  }
}
