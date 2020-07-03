import 'package:airscaper/common/colors.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class CodeScreen extends StatelessWidget {
  static const routeName = "/code";

  final CodeInputUseCase _codeInputUseCase = sl();

  static NavigationIntent navigate(bool isWithResult) =>
      NavigationIntent(routeName, isWithResult);

  @override
  Widget build(BuildContext context) {

    bool isWithResult = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Entrer un code"),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          createCodeField(context, isWithResult),
        ],
      ),
    );
  }

  Widget createCodeField(BuildContext context, bool isWithResult) {
    return ARSCodeTextField(
      confirmBuilder: createConfirmButton,
      callback: (context, value){
        onValidClicked(context, value, isWithResult);
      },
      acceptedValues: [],
      hint: "Entrez le code",
      validationErrorMessage: "Code invalide",
    );
  }

  Widget createConfirmButton(Function(BuildContext) clickListener) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ARSButton(
          text: Text("Valider", style: TextStyle(color: Colors.white),),
          onClick: clickListener,
          height: 60,
          backgroundColor: startButtonColor,
        ),
      );

  onValidClicked(BuildContext context, String value, bool isWithResult) async {
    if (value != null) {
      if (isWithResult) {
        Navigator.of(context).pop(value);
      } else {
        final intent = await _codeInputUseCase.execute(context, value);
        navigateTo(context, intent);
      }
    }
  }
}
