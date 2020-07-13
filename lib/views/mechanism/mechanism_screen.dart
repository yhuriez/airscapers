import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
import 'package:airscaper/views/inventory/ars_details_box.dart';
import 'package:airscaper/views/mechanism/clue_dialog.dart';
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

  MechanismCodeInputUseCase get _codeInputUseCase => sl();

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
        imageContainerBuilder: _createImageBox,
        interactionsBuilder: _createInteraction,
        imageUrl: _state.image,
        description: _state.description,
      ),
    );
  }

  Widget _createImageBox(BuildContext context, Widget child) =>
      BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          final selectedId = state.selectedItem;
          return GestureDetector(
            onTap: () => _onItemUsed(context, selectedId),
            child: _createDragTarget(context, child),
          );
        },
      );

  Widget _createDragTarget(BuildContext context, Widget child) {
    List<int> acceptedIds = _state.transitions
        .where((it) => it.expectedItemId != null)
        .map((it) => it.expectedItemId)
        .toList();

    return DragTarget<int>(
      builder: (context, incoming, rejected) {
        return child;
      },
      onWillAccept: (id) => acceptedIds.contains(id),
      onAccept: (id) {
        _onItemUsed(context, id);
      },
    );
  }

  Widget _createInteraction(BuildContext context) {
    if (_state.codeHint != null) {
      return _createCodeField(context);
    } else {
      return _backButton;
    }
  }

  Widget get _backButton => ARSButton(
    onClick: _onContinueButtonClicked,
    text: Text(
      "Retour",
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.green,
  );

  _onContinueButtonClicked(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _createCodeField(BuildContext context) {
    return ARSCodeTextField(
      callback: (context, textValue) => _onCodeClicked(context, textValue),
      acceptedValues: [],
      hint: "Entrez le code",
      validationErrorMessage: "Code invalide",
    );
  }

  _onCodeClicked(BuildContext context, String codeResult) async {
    if (codeResult != null) {
      final MechanismState newState = await widget._codeInputUseCase
          .execute(context, widget.mechanism, codeResult);
      if (newState != null) {
        _refreshState(context, givenState: newState);
      } else {
        final intent = createDialogNavigationIntent("", "Rien ne se passe");
        navigateTo(context, intent);
      }
    }
  }

  _onItemUsed(BuildContext context, int selectedId) async {
    final MechanismState result = await widget._itemSelectUseCase
        .execute(context, widget.mechanism, selectedId);
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
