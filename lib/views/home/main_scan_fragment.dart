import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/usecases/end_use_cases.dart';
import 'package:airscaper/domain/usecases/link_use_cases.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/views/common/ars_confirm_dialog.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/home/nfc_reader_view.dart';
import 'package:airscaper/views/home/scenario_content_fragment.dart';
import 'package:airscaper/views/init/welcome_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        IconButton(
            key: const Key("home_debug_button"),
            onPressed: () => onUseDebugMenu(context), icon: Icon(Icons.menu_book)),

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
      key: const Key("home_quit_button"),
      icon: Icon(Icons.clear),
      onPressed: () => _onQuitClicked(context),
    );
  }

  onUseDebugMenu(BuildContext context) async {
    if (_repository.isTutorial || kDebugMode || await askDebugPassword(context)) {
      final String? scanResult = await Navigator.of(context).pushNamed(ScenarioContentFragment.routeName);
      parseLink(context, scanResult);
    }
  }

  Future<bool> askDebugPassword(BuildContext context) async {
    final result = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => ARSConfirmDialog(
            child: Text("Cette option permet d'acceder au objets et énigmes du scénario en direct (sans scan) et ne doit être utilisé qu'en cas de problème.\n\nEtes-vous sûr de vouloir accéder à ce menu ?"),
            onOkClicked: (_) => Navigator.of(dialogContext).pop(true),
            onCancelClicked: (_) => Navigator.of(dialogContext).pop(false),
        )
    );
    return result == true;
  }

  _onQuitClicked(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => ARSDialogConfirm(
          key: const Key("quit_confirm_dialog"),
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

parseLink(BuildContext context, String? scanResult) async {
  final link = sl<ParseLinkUseCase>().execute(scanResult);

  NavigationIntent? nextIntent;
  if (link != null) {
    nextIntent = await sl<InterpretLinkUseCase>().execute(link);
    navigateTo(context, nextIntent);
  }
}
