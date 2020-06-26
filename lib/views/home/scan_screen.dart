import 'package:airscaper/common/colors.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class ScanFragment extends StatelessWidget {

  static const routeName = "/scan";

  final InterpretLinkUseCase interpretLinkUseCase = sl();
  final ParseLinkUseCase _parseLinkUseCase = sl();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          createScannerButton(context),
          createCodeField(context),
        ],
      );
  }

  Widget createScannerButton(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ARSButton(
          text: Text("Scanner", style: TextStyle(color: Colors.white),),
          onClick: onScannerClicked,
          height: 60,
          backgroundColor: scanButtonColor,
        ),
      );

  Widget createCodeField(BuildContext context) {
    return ARSCodeTextField(
      confirmBuilder: createConfirmButton,
      callback: onValidClicked,
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

  onValidClicked(BuildContext context, String value) async {
    final link = _parseLinkUseCase.execute(value);
    if (link != null) {
      final intent = await interpretLinkUseCase.execute(link);
      navigateReplaceTo(context, intent);
    } else {
      navigateShowDialog(
          context,
          DialogArguments(
              "Code invalide", "Ce code n'existe pas dans l'application"));
    }
  }

  onScannerClicked(BuildContext context) async {
    var result = await BarcodeScanner.scan();
    var cameraScanResult = result.rawContent;

    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text(cameraScanResult)));

    await onValidClicked(context, cameraScanResult);
  }
}
