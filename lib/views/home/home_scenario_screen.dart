import 'package:airscaper/common/ars_result.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/code/code_screen.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_clock.dart';
import 'package:airscaper/views/common/ars_icon_button.dart';
import 'package:airscaper/views/home/end_screen.dart';
import 'package:airscaper/views/home/scan_screen.dart';
import 'package:airscaper/views/inventory/inventory_items_screen.dart';
import 'package:airscaper/views/inventory/inventory_tracks_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../injection.dart';

class HomeScenarioScreen extends StatelessWidget {
  static const routeName = "/home";

  final ScenarioRepository _repository = sl();
  final StartScenarioUseCase _startScenarioUseCase = sl();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ARSResult<bool>>(
        future: _startScenarioUseCase.execute(context),
        initialData: ARSResult.loading(),
        builder: (context, snapshot) {
          final result = snapshot.data;
          if (result.errorCode != null) {
            return createErrorView(result.errorCode);
          } else if (result.loading) {
            return loadingView;
          }

          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(_repository.title),
                centerTitle: true,
                elevation: 0,
              ),
              body: HomeScreenContent());
        });
  }

  Widget createErrorView(errorCode) => Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        errorCode,
        style: TextStyle(fontSize: 20),
      )));

  Widget get loadingView => Container(
        color: Colors.white,
        child: Center(
          child: JumpingDotsProgressIndicator(
              numberOfDots: 4, fontSize: 40.0, dotSpacing: 2.0),
        ),
      );
}

/// Visual content of the home page
class HomeScreenContent extends StatelessWidget {

  final EndScenarioUseCase _endScenarioUseCase = sl();
  final ParseLinkUseCase _parseLinkUseCase = sl();
  final InterpretLinkUseCase _interpretLinkUseCase = sl();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // CLock
        SizedBox(height: 100, child: ARSClock(onEnd: doGameOverScreen,)),

        // Separator
        Expanded(child: Container()),

        // Scanner button
        Padding(
          padding: const EdgeInsets.all(16.0),
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
        ),

        // Separator
        Expanded(child: Container()),

        // Bottom buttons
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Center(
                      child: ARSIconButton(
                          text: "Code",
                          onClick: onCodeClicked,
                          backgroundColor: Colors.red,
                          icon: Icons.dialpad))),
              Expanded(
                  child: Center(
                      child: ARSIconButton(
                          text: "Inventaire",
                          onClick: onInventoryClicked,
                          backgroundColor: Colors.blue,
                          icon: Icons.work))),
              Expanded(
                  child: Center(
                      child: ARSIconButton(
                          text: "Pistes",
                          onClick: onTrackHistoryClicked,
                          backgroundColor: Colors.lightGreen,
                          icon: Icons.assignment)))
            ],
          ),
        )
      ],
    );
  }

  doGameOverScreen(BuildContext context) async {

    await _endScenarioUseCase.execute();

    Future.delayed(Duration.zero, () =>
        Navigator.of(context).pushReplacementNamed(GameOverScreen.routeName));
  }

  onScanDebugClicked(BuildContext context) {
    if(kDebugMode) {
      Navigator.of(context).pushNamed(ScanScreen.routeName);
    }
  }

  onCodeClicked(BuildContext context) {
    Navigator.of(context).pushNamed(CodeScreen.routeName);
  }

  onInventoryClicked(BuildContext context) {
    Navigator.of(context).pushNamed(InventoryItemsScreen.routeName);
  }

  onTrackHistoryClicked(BuildContext context) {
    Navigator.of(context).pushNamed(InventoryTracksScreen.routeName);
  }
  
  onStartBarcodeScanner(BuildContext context) async {
    var result = await BarcodeScanner.scan();
    var cameraScanResult = result.rawContent;

    final link = _parseLinkUseCase.execute(cameraScanResult);
    if(link != null) {
        final intent = await _interpretLinkUseCase.execute(link);
        navigateTo(context, intent);
    } else {
      navigateShowDialog(
          context,
          DialogArguments(
              "Code invalide", "Ce code n'existe pas dans l'application"));
    }
  }
}
