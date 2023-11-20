import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/common/nfc_write_dialog.dart';
import 'package:airscaper/views/inventory/ars_details_box.dart';
import 'package:airscaper/views/mechanism/clue_dialog.dart';
import 'package:airscaper/views/mechanism/interactions/interaction_factory.dart';
import 'package:airscaper/views/mechanism/mechanism_screen_state.dart';
import 'package:airscaper/views/navigation/fade_page_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../navigation/navigation_methods.dart';

class MechanismFragment extends StatelessWidget {
  static const routeName = "/mechanism";

  final String mechanismId;

  const MechanismFragment({Key? key, required this.mechanismId});

  static Route route(String mechanismId) {
    return FadeBlackPageRoute(
        builder: (_) => MechanismFragment(mechanismId: mechanismId),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MechanismScreenState(mechanismId),
        child: MechanismStateRepresentation());
  }
}

class MechanismStateRepresentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final state = context.watch<MechanismScreenState>();

    if (state.nextIntent != null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        navigateReplaceTo(context, state.nextIntent!);
      });
      return Container();
    }

    return ARSScaffold(
      title: state.mechanism.name,
      actions: [
        _createClueAction(context),

        if(kDebugMode) IconButton(
            onPressed: () => onDisplayWriteNfcDialog(context, state.mechanism.id),
            icon: Icon(Icons.nfc, color: Colors.white,)
        )
      ],
      child: ARSDetailsBox(
        interactionsBuilder: (_) => createMechanismInteraction(context),
        imageUrl: state.mechanism.image ?? "",
        description: state.mechanism.description ?? "",
        name: state.mechanism.name,
        onAcceptedDropData: (_, item) => state.onItemUsed(item),
      ),
    );
  }

  Widget _createClueAction(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.saved_search, color: Colors.white),
      onPressed: () => _onClueClicked(context),
    );
  }

  onDisplayWriteNfcDialog(BuildContext context, String mechanismId) {
    showDialog(context: context, builder: (_) => NfcWriteDialog(link: "airscapers://$mechanismId"));
  }

  _onClueClicked(BuildContext context) {
    final state = context.read<MechanismScreenState>();

    showDialog(
        context: context,
        builder: (_) => ClueDialog(mechanism: state.mechanism));
  }
}
