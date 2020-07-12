import 'package:airscaper/common/colors.dart';
import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/common/ars_inner_shadow.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/common/ars_white_shadow.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
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

    return ARSScaffold(
      title: mechanism.name,
      child: MechanismStateRepresentation(
        mechanism: mechanism,
      ),
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

    return Column(
      children: <Widget>[
        // Image
        if (_state.image == null) Container() else Expanded(child: _createImageBox(context)),

        // Item box
        _createItemBox(context)
      ],
    );
  }

  Widget _createImageBox(BuildContext context) => BlocBuilder<InventoryBloc, InventoryState>(
    builder: (context, state) {
      final selectedId = state.selectedItem;
      return InkWell(
        onTap: () => _onItemUsed(context, selectedId),
        child: _createDragTarget(
            context,
            ARSInnerShadow(
              color: Colors.black,
              offset: Offset(20, 20),
              child: _createImageAsset(context),
            )),
      );
    },
  );

  Widget _createImageAsset(BuildContext context) {
    return Image.asset(
      _state.image,
      fit: BoxFit.fill,
    );
  }

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

  Widget _createItemBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: ARSWhiteShadow(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text description
            _createText(context),
            // Interaction
            _createInteraction(context)
          ],
        ),
      ),
    );
  }

  Widget _createText(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(_state.description,
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ),
      );

  Widget _createInteraction(BuildContext context) {
    if (_state.codeHint != null) {
      return _createCodeField(context);
    } else {
      return _backButton;
    }
  }

  Widget get _backButton => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ARSButton(
          onClick: _onContinueButtonClicked,
          text: Text(
            "Retour",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
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

  Widget _createConfirmButton(Function(BuildContext) clickListener) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ARSButton(
          text: Text(
            "Valider",
            style: TextStyle(color: Colors.white),
          ),
          onClick: clickListener,
          height: 60,
          backgroundColor: startButtonColor,
        ),
      );

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

  _onClueClicked(BuildContext context, ScenarioMechanism mechanism) {
    // TODO
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
}
