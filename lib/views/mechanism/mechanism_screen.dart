import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
import 'package:airscaper/views/inventory/ars_details_box.dart';
import 'package:airscaper/views/mechanism/clue_dialog.dart';
import 'package:airscaper/views/mechanism/interactions/interaction_factory.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class MechanismFragment extends StatelessWidget {
  static const routeName = "/mechanism";

  static NavigationIntent navigate(ScenarioMechanism mechanism) =>
      NavigationIntent(routeName, mechanism);

  @override
  Widget build(BuildContext context) {
    ScenarioMechanism mechanism = ModalRoute.of(context).settings.arguments;

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

  const MechanismStateRepresentation({Key key, @required this.mechanism})
      : super(key: key);

  @override
  _MechanismStateRepresentationState createState() =>
      _MechanismStateRepresentationState();
}

class _MechanismStateRepresentationState
    extends State<MechanismStateRepresentation> {
  MechanismState _state;

  @override
  void initState() {
    super.initState();
    _refreshState(context);
  }

  @override
  Widget build(BuildContext context) {
    if (_state == null) {
      return Container();
    }

    return ARSScaffold(
      title: widget.mechanism.name,
      actions: [_createClueAction(context)],
      child: ARSDetailsBox(
        interactionsBuilder: (_) =>
            createMechanismInteraction(widget.mechanism, _state, _refreshState),
        imageUrl: _state.image,
        description: _state.description,
        name: widget.mechanism.name,
        onAcceptedDropData: _onItemUsed,
      ),
    );
  }

  List<int> get acceptedIds => _state.transitions
      .where((it) => it.expectedItemId != null)
      .map((it) => it.expectedItemId)
      .toList();

  _onItemUsed(BuildContext context, ScenarioItem selectedItem) async {
    if (!acceptedIds.contains(selectedItem.id)) return null;

    final MechanismState result = await widget._itemSelectUseCase
        .execute(context, widget.mechanism, selectedItem.id);
    if (result != null) {
      _refreshState(context, givenState: result);
    }
  }

  _refreshState(BuildContext context, {MechanismState givenState}) async {
    final newState = givenState ??
        await widget._loadMechanismStateUseCase.execute(widget.mechanism);

    if (newState.end) {
      final intent = await widget._mechanismFinishedUseCase
          .execute(widget.mechanism, newState);
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
    showDialog(context: context, child: ClueDialog(state: _state));
  }
}
