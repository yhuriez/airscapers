import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';
import '../code/code_screen.dart';

class MechanismFragment extends StatelessWidget {
  static const routeName = "/mechanism";

  static NavigationIntent navigate(ScenarioMechanism mechanism,
          {BackStackBehavior backStackBehavior}) =>
      NavigationIntent(routeName, mechanism,
          backStackBehavior: backStackBehavior);

  @override
  Widget build(BuildContext context) {
    ScenarioMechanism mechanism = ModalRoute.of(context).settings.arguments;

    return MechanismStateRepresentation(mechanism: mechanism,);
  }
}

class MechanismStateRepresentation extends StatefulWidget {
  final ScenarioMechanism mechanism;

  MechanismCodeInputUseCase get _mechanismCodeInputUseCase => sl();

  LoadCurrentMechanismStateUseCase get _loadCurrentMechanismStateUseCase =>
      sl();

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
        (_state.image == null)
            ? Container()
            : Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(_state.image),
                ),
              ),
        Flexible(
          flex: 3,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_state.description, style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }

  onCodeClicked(BuildContext context, ScenarioMechanism mechanism) async {
    final codeResult = await Navigator.of(context)
        .pushNamed(CodeScreen.routeName, arguments: true);
    if (codeResult != null) {
      final MechanismState newState = await widget._mechanismCodeInputUseCase
          .execute(mechanism, codeResult);
      if (newState != null) {
        refreshState(context, givenState: newState);
      } else {
        final intent = createDialogNavigationIntent("", "Rien ne se passe");
        navigateTo(context, intent);
      }
    }
  }

  onClueClicked(BuildContext context, ScenarioMechanism mechanism) {
    // TODO
  }

  refreshState(BuildContext context, {MechanismState givenState}) async {
    final newState = givenState ??
        await widget._loadCurrentMechanismStateUseCase
            .execute(widget.mechanism);

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