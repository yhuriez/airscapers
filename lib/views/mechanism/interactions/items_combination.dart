


import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/views/mechanism/interactions/interaction_factory.dart';
import 'package:flutter/material.dart';

class MechanismItemsCombination extends StatelessWidget {

  final ScenarioMechanism mechanism;
  final MechanismState state;
  final OnNewState onNewState;

  const MechanismItemsCombination(
      {Key key,
        @required this.mechanism,
        @required this.state,
        @required this.onNewState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}