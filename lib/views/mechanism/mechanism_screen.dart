import 'package:airscaper/common/colors.dart';
import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_code_text_field.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class MechanismFragment extends StatelessWidget {
  static const routeName = "/mechanism";

  static NavigationIntent navigate(ScenarioMechanism mechanism,
          {BackStackBehavior backStackBehavior}) =>
      NavigationIntent(routeName, mechanism,
          backStackBehavior: backStackBehavior);

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
    refreshState(context);
  }

  @override
  Widget build(BuildContext context) {
    if (_state == null) {
      return Container();
    }

    return Column(
      children: <Widget>[
        // Image
        if (_state.image == null) Container() else createImage(context),

        // Text description
        Expanded(child: createText(context)),

        // Interaction
        createInteraction(context)
      ],
    );
  }

  Widget createImage(BuildContext context) =>
      BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          final selectedId = state.selectedItem;
          return InkWell(
            onTap: () => onImageClicked(context, selectedId),
            child: Image.asset(_state.image),
          );
        },
      );

  Widget createText(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(_state.description,
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      );

  Widget createInteraction(BuildContext context) {
    if (_state.codeHint != null) {
      return createCodeField(context);
    } else {
      return backButton;
    }
  }

  Widget get backButton => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ARSButton(
          onClick: onContinueButtonClicked,
          text: Text(
            "Retour",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );

  onContinueButtonClicked(BuildContext context) {
    Navigator.of(context).pop();
//    Navigator.of(context)
//        .pushNamedAndRemoveUntil(MainScanFragment.routeName, (route) => false);
  }

  Widget createCodeField(BuildContext context) {
    return ARSCodeTextField(
      callback: (context, textValue) => onCodeClicked(context, textValue),
      acceptedValues: [],
      hint: "Entrez le code",
      validationErrorMessage: "Code invalide",
    );
  }

  Widget createConfirmButton(Function(BuildContext) clickListener) => Padding(
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

  onCodeClicked(BuildContext context, String codeResult) async {
    if (codeResult != null) {
      final MechanismState newState = await widget._codeInputUseCase
          .execute(context, widget.mechanism, codeResult);
      if (newState != null) {
        refreshState(context, givenState: newState);
      } else {
        final intent = createDialogNavigationIntent("", "Rien ne se passe");
        navigateTo(context, intent);
      }
    }
  }

  onImageClicked(BuildContext context, int selectedId) async {
    final MechanismState result = await widget._itemSelectUseCase
        .execute(context, widget.mechanism, selectedId);
    if (result != null) {
      refreshState(context, givenState: result);
    }
  }

  onClueClicked(BuildContext context, ScenarioMechanism mechanism) {
    // TODO
  }

  refreshState(BuildContext context, {MechanismState givenState}) async {
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
