import 'dart:convert';

import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/usecases/end_use_cases.dart';
import 'package:airscaper/domain/usecases/link_use_cases.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/home/scenario_content_fragment.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../injection.dart';

class MainScanFragment extends StatelessWidget {
  static const routeName = "main";

  static Route<void> createRoute() {
    return createFadeRoute<void>(MainScanFragment(), MainScanFragment.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return MainScanBody();
  }
}

class MainScanBody extends StatelessWidget {

  ScenarioRepository get _repository => sl();

  @override
  Widget build(BuildContext context) {

    return ARSScaffold(
      title: _repository.title,
      actions: [
        if(kDebugMode) IconButton(onPressed: () => onUseDebugMenu(context), icon: Icon(Icons.menu_book)),

        _createQuitAction(context),
      ],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: NfcReaderView(),
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

  onUseDebugMenu(BuildContext context) async {
    if (_repository.isTutorial || kDebugMode) {
      final String? scanResult = await Navigator.of(context).pushNamed(ScenarioContentFragment.routeName);
      parseLink(context, scanResult);
    }
  }

  _onQuitClicked(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => ARSDialogConfirm(
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
            .pushAndRemoveUntil(WelcomeScreen.createRoute(), (route) => false));
  }
}

class NfcReaderView extends StatefulWidget {

  @override
  State<NfcReaderView> createState() => _NfcReaderViewState();
}

class _NfcReaderViewState extends State<NfcReaderView> with WidgetsBindingObserver {

  bool isAvailable = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    refreshNfc();
  }

  @override
  Widget build(BuildContext context) {

    Widget child = NfcReadWaitingView();

    if(!isAvailable) {
      child = NfcDisabledView();
    }

    return Center(child: child);
  }

  refreshNfc () async {
    // Check availability
    final availability = await NfcManager.instance.isAvailable();
    setState(() {
      isAvailable = availability;
    });

    // Start Session
    if(availability) {
      NfcManager.instance.startSession(
        onDiscovered: _onTagDiscovered
      );
    }
  }

  Future<void> _onTagDiscovered(NfcTag tag) async {
    final ndefTag = Ndef.from(tag);
    final result = await ndefTag?.read();

    var record = result?.records.first;

    if (record != null) {
      final languageCodeLength = record.payload.first;
      final nextLink = utf8.decode(record.payload.sublist(1 + languageCodeLength));

      parseLink(context, nextLink);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused) {
      NfcManager.instance.stopSession();

    } else if(state == AppLifecycleState.resumed) {
      refreshNfc();
    }
  }

  @override
  void dispose() {
    super.dispose();
    NfcManager.instance.stopSession();
    WidgetsBinding.instance?.removeObserver(this);
  }
}

class NfcReadWaitingView extends StatelessWidget {
  const NfcReadWaitingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingAnimationWidget.beat(color: Colors.white, size: 150.0),

        SizedBox(height: 80,),

        Text(
            "Passez l'appareil devant un marqueur pour le visualiser",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)
        )
      ],
    );
  }
}

class NfcDisabledView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
            "Activez le NFC sur l'appareil pour pouvoir utiliser l'application",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)
        ),

        SizedBox(height: 36,),

        ARSButton(onClick: onActivateNfc,
          text: Text("Activer", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
          backgroundColor: Colors.green,)
      ],
    );
  }

  onActivateNfc(BuildContext context) {
    AppSettings.openNFCSettings();
  }
}

parseLink(BuildContext context, String? scanResult) async {
  final link = sl<ParseLinkUseCase>().execute(scanResult);

  NavigationIntent? nextIntent;
  if (link != null) {
    nextIntent = await sl<InterpretLinkUseCase>().execute(link);

  } else {
    nextIntent = NavigationIntent.dialog(arguments: DialogArguments(
        "Code invalide", "Ce code n'existe pas dans l'application"));
  }

  navigateTo(context, nextIntent);
}
