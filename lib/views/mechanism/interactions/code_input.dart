import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/mechanism/mechanism_screen_state.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MechanismCodeInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final state = context.read<MechanismScreenState>();

    return ARSCodeTextField(
      callback: (context, textValue) => _onCodeClicked(context, textValue),
      acceptedValues: [],
      hint: state.mechanismState.codeHint ?? "Entrer le code",
      validationErrorMessage: "Code invalide",
    );
  }

  _onCodeClicked(BuildContext context, String? codeResult) {

    final state = context.read<MechanismScreenState>();

    if (codeResult != null) {
      final result = state.onCodeInput(codeResult);

      if(!result) {
        final intent = NavigationIntent.dialog(arguments: DialogArguments("", "Rien ne se passe"));
        navigateTo(context, intent);
      }
    }
  }
}
