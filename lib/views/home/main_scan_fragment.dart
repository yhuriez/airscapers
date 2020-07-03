

import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/home/scan_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class MainScanFragment extends StatelessWidget {

  static const routeName = "main";

  final ParseLinkUseCase _parseLinkUseCase = sl();
  final InterpretLinkUseCase _interpretLinkUseCase = sl();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                child: Text("Scanner un élément", style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
          height: 150,
          borderRadius: 30.0,
          onClick: onStartBarcodeScanner,
          onLongClick: onScanDebugClicked
      ),
    );
  }


  onScanDebugClicked(BuildContext context) {
    if(kDebugMode) {
      Navigator.of(context).pushNamed(ScanFragment.routeName);
    }
  }


  onStartBarcodeScanner(BuildContext context) async {
    var result = await BarcodeScanner.scan();
    var cameraScanResult = result.rawContent;

    final link = _parseLinkUseCase.execute(cameraScanResult);
    if(link != null) {
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