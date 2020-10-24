import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

class ItemCodeInput extends StatelessWidget {

  final ScenarioItem item;
  final Function(BuildContext) onResolved;

  const ItemCodeInput( this.item, this.onResolved, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSCodeTextField(
      callback: (context, textValue) => _onCodeClicked(context, textValue),
      acceptedValues: [],
      hint: item.codeHint ?? "Entrer le code",
      validationErrorMessage: "Code invalide",
    );
  }

  _onCodeClicked(BuildContext context, String codeResult) async {
    if (codeResult != null) {

      if(item.transition.expectedCodes.contains(codeResult)) {
        onResolved(context);

      } else {
        final intent = createDialogNavigationIntent("", "Rien ne se passe");
        navigateTo(context, intent);
      }
    }
  }
}
