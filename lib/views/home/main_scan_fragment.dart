import 'package:airscaper/common/colors.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/end_use_cases.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/home/scan_screen.dart';
import 'package:airscaper/views/home/scenario_content_fragment.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class MainScanFragment extends StatelessWidget {
  static const routeName = "main";

  ScenarioRepository get _repository => sl();

  ParseLinkUseCase get _parseLinkUseCase => sl();

  InterpretLinkUseCase get _interpretLinkUseCase => sl();

  @override
  Widget build(BuildContext context) {
    return ARSScaffold(
      title: _repository.title,
      actions: [_createQuitAction(context)],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ARSButton(
                  text: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/common/qrcode.png",
                        width: 80,
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Scanner un élément",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  height: 150,
                  borderRadius: 30.0,
                  onClick: onStartBarcodeScanner,
                  onLongClick: onScanLongPress),

              // Helper text for tutorial
              (_repository.isTutorial)
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Maintenez le bouton Scan pour afficher la liste des éléments, si vous ne possédez pas les QR codes.",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _createQuitAction(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.clear),
      onPressed: () => _onQuitClicked(context),
    );
  }

  onScanLongPress(BuildContext context) async {
    if (_repository.isTutorial || kDebugMode) {
      final scanResult =
          await Navigator.of(context).pushNamed(ScenarioContentFragment.routeName);
      parseLink(context, scanResult);
    }
  }

  onStartBarcodeScanner(BuildContext context) async {
    var result = await BarcodeScanner.scan();
    var scanResult = result.rawContent;

    parseLink(context, scanResult);
  }

  parseLink(BuildContext context, String scanResult) async {
    final link = _parseLinkUseCase.execute(scanResult);
    if (link != null) {
      final intent = await _interpretLinkUseCase.execute(context, link);
      navigateTo(context, intent);
    } else {
      navigateShowDialog(
          context,
          DialogArguments(
              "Code invalide", "Ce code n'existe pas dans l'application"));
    }
  }

  _onQuitClicked(BuildContext context) {
    showDialog(
        context: context,
        child: ARSDialogConfirm(
          title: "Etes-vous sûr de vouloir quitter ?",
          message:
              "Vous perdrez toute votre progression en quittant le scénario en cours.",
          okAction: doQuitApp,
          okText: "Oui",
          cancelText: "Non",
        ));
  }

  doQuitApp(BuildContext context) async {
    EndScenarioUseCase _endScenarioUseCase = sl();

    await _endScenarioUseCase.execute();

    Future.delayed(
        Duration.zero,
        () => Navigator.of(context, rootNavigator: true)
            .pushReplacement(WelcomeScreen.createRoute()));
  }
}
