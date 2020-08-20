import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/mechanism/interactions/interaction_factory.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

import '../../../injection.dart';

class MechanismCodeInput extends StatelessWidget {
  final ScenarioMechanism mechanism;
  final MechanismState state;
  final OnNewState onNewState;

  const MechanismCodeInput(
      {Key key,
      @required this.mechanism,
      @required this.state,
      @required this.onNewState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSCodeTextField(
      callback: (context, textValue) => _onCodeClicked(context, textValue),
      acceptedValues: [],
      hint: state.codeHint ?? "Entrer le code",
      validationErrorMessage: "Code invalide",
    );
  }

  _onCodeClicked(BuildContext context, String codeResult) async {
    if (codeResult != null) {
      MechanismCodeInputUseCase _codeInputUseCase = sl();

      final MechanismState newState = await _codeInputUseCase.execute(
          context, mechanism, codeResult);
      if (newState != null) {
        onNewState(context, givenState: newState);
      } else {
        final intent = createDialogNavigationIntent("", "Rien ne se passe");
        navigateTo(context, intent);
      }
    }
  }
}
