import 'package:airscaper/common/colors.dart';
import 'package:airscaper/app/usecases/link_use_cases.dart';
import 'package:airscaper/app/views/common/ars_button.dart';
import 'package:airscaper/app/views/common/ars_code_text_field.dart';
import 'package:airscaper/app/views/common/ars_scaffold.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class ScanFragment extends StatelessWidget {
  static const routeName = "/scan";

  InterpretLinkUseCase get interpretLinkUseCase => sl();

  @override
  Widget build(BuildContext context) {
    return ARSScaffold(
        title: "Scan Debug", child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: createCodeField(context)),
        ));
  }

  Widget createCodeField(BuildContext context) {
    return ARSCodeTextField(
      callback: onValidClicked,
      acceptedValues: [],
      hint: "Entrez le code",
      validationErrorMessage: "Code invalide",
    );
  }

  Widget createConfirmButton(Function(BuildContext) clickListener) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ARSButton(
          text: Text(
            "Valider",
            style: TextStyle(color: Colors.white),
          ),
          onClick: clickListener,
          height: 60,
          backgroundColor: startButtonColor,
        ),
      );

  onValidClicked(BuildContext context, String value) async {
    Navigator.pop(context, value);
  }
}
