import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:airscaper/domain/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/inventory/ars_details_box.dart';
import 'package:airscaper/views/mechanism/clue_dialog.dart';
import 'package:airscaper/views/mechanism/interactions/interaction_factory.dart';
import 'package:airscaper/views/navigation/fade_page_route.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

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
    return MechanismStateRepresentation(
      mechanism: mechanism,
    );
  }
}

class MechanismStateRepresentation extends StatefulWidget {
  final ScenarioMechanism mechanism;

  MechanismItemSelectUseCase get _itemSelectUseCase => sl();
  LoadCurrentMechanismStateUseCase get _loadMechanismStateUseCase => sl();
  MechanismFinishedUseCase get _mechanismFinishedUseCase => sl();

  const MechanismStateRepresentation({Key? key, required this.mechanism})
      : super(key: key);

  @override
  _MechanismStateRepresentationState createState() =>
      _MechanismStateRepresentationState();
}

class _MechanismStateRepresentationState
    extends State<MechanismStateRepresentation> {

  late MechanismState _state;

  @override
  void initState() {
    super.initState();
    _refreshState(context);
  }

  @override
  Widget build(BuildContext context) {

    return ARSScaffold(
      title: widget.mechanism.name,
      actions: [_createClueAction(context)],
      child: ARSDetailsBox(
        interactionsBuilder: (_) =>
            createMechanismInteraction(widget.mechanism, _state, _refreshState),
        imageUrl: _state.image ?? "",
        description: _state.description ?? "",
        name: widget.mechanism.name,
        onAcceptedDropData: _onItemUsed,
      ),
    );
  }

  List<int> get acceptedIds => _state.transitions
      .map((it) => it.expectedItem)
      .whereType<int>()
      .toList();

  _onItemUsed(BuildContext context, ScenarioItem selectedItem) {
    if (!acceptedIds.contains(selectedItem.id)) return null;

    final MechanismState? result = widget._itemSelectUseCase.execute(context, widget.mechanism, selectedItem.id);
    if (result != null) {
      _refreshState(context, givenState: result);
    }
  }

  _refreshState(BuildContext context, {MechanismState? givenState}) {
    final MechanismState newState = givenState ??
        widget._loadMechanismStateUseCase.execute(widget.mechanism);

    if (newState.endTrack != null) {
      final intent = widget._mechanismFinishedUseCase.execute(widget.mechanism, newState.endTrack!);
      navigateReplaceTo(context, intent);

    } else {
      setState(() {
        _state = newState;
      });
    }
  }

  Widget _createClueAction(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.help_outline),
      onPressed: () => _onClueClicked(context),
    );
  }

  _onClueClicked(BuildContext context) {
    showDialog(context: context, builder: (_) => ClueDialog(mechanismId: widget.mechanism.id, state: _state));
  }
}
