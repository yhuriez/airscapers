import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/home/scan_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class MainScanFragment extends StatelessWidget {
  static const routeName = "main";

  final ScenarioRepository _repository = sl();
  final ParseLinkUseCase _parseLinkUseCase = sl();
  final InterpretLinkUseCase _interpretLinkUseCase = sl();

  @override
  Widget build(BuildContext context) {
    return ARSScaffold(
      title: _repository.title,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ARSButton(
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
              onLongClick: onScanDebugClicked),
        ),
      ),
    );
  }

  onScanDebugClicked(BuildContext context) async {
    if (kDebugMode) {
      final scanResult =
          await Navigator.of(context).pushNamed(ScanFragment.routeName);
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
}
