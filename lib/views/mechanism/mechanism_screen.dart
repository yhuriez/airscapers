import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/inventory/ars_details_box.dart';
import 'package:airscaper/views/mechanism/clue_dialog.dart';
import 'package:airscaper/views/mechanism/interactions/interaction_factory.dart';
import 'package:airscaper/views/mechanism/mechanism_screen_state.dart';
import 'package:airscaper/views/navigation/fade_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../navigation/navigation_methods.dart';

class MechanismFragment extends StatelessWidget {
  static const routeName = "/mechanism";

  final ScenarioMechanism mechanism;

  const MechanismFragment({Key? key, required this.mechanism});

  static Route route(ScenarioMechanism mechanism) {
    return FadeBlackPageRoute(
        builder: (_) => MechanismFragment(mechanism: mechanism),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MechanismScreenState(mechanism),
        child: MechanismStateRepresentation());
  }
}

class MechanismStateRepresentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final state = context.watch<MechanismScreenState>();

    if (state.nextIntent != null) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        navigateReplaceTo(context, state.nextIntent!);
      });
      return Container();
    }

    return ARSScaffold(
      title: state.mechanism.name,
      actions: [_createClueAction(context)],
      child: ARSDetailsBox(
        interactionsBuilder: (_) => createMechanismInteraction(context),
        imageUrl: state.mechanismState.image ?? "",
        description: state.mechanismState.description ?? "",
        name: state.mechanism.name,
        onAcceptedDropData: (_, item) => state.onItemUsed(item),
      ),
    );
  }

  Widget _createClueAction(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.help_outline),
      onPressed: () => _onClueClicked(context),
    );
  }

  _onClueClicked(BuildContext context) {
    final state = context.read<MechanismScreenState>();

    showDialog(
        context: context,
        builder: (_) => ClueDialog(mechanismId: state.mechanism.id, state: state.mechanismState));
  }
}
