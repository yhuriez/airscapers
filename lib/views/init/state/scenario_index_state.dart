


import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/models/scenario_reference.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ScenarioIndexState extends ChangeNotifier {

  final ScenarioRepository _repository = sl();

  late final List<ScenarioReference> scenarios;

  ScenarioIndexState() {
    scenarios = _repository.scenarios;
  }

  bool checkScenarioCode(String code) {
    final acceptedValues = scenarios.map((it) => it.code).toList();
    return acceptedValues.contains(code.toLowerCase());
  }

  ScenarioReference? getScenarioByCode(String code) {
    return scenarios.firstWhereOrNull(
            (element) => element.code.toLowerCase() == code.toLowerCase());
  }
}