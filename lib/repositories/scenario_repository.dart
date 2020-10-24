import 'dart:convert';

import 'package:airscaper/model/entities/scenario.dart';
import 'package:airscaper/model/entities/scenario_index.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_reference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class ScenarioRepository {
  ScenarioIndex _index;
  Scenario _scenario;

  List<ScenarioReference> get scenarios => _index?.scenarios ?? [];

  String get title => _scenario.details.title;

  String get endText => _scenario.details.endText;

  int get durationInMinute => _scenario.details.duration;

  List<ScenarioItem> get items => _scenario?.items ?? [];

  bool get isIndexInit => _index != null;

  bool get isScenarioInit => _scenario != null;

  bool get isTutorial => title == "Tutoriel";

  ScenarioItem getItem(int itemId) =>
      items.firstWhere((element) => element.id == itemId, orElse: () => null);


  Future<bool> initIndex(BuildContext context) async {
    try {
      final indexJsonStr =
          await rootBundle.loadString("assets/scenarios/index.json");
      final indexJson = jsonDecode(indexJsonStr);
      _index = ScenarioIndex.map(indexJson);
      return true;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack, label: e.toString());
      return false;
    }
  }

  Future<bool> initScenario(
      BuildContext context, ScenarioReference reference) async {
    try {
      final indexJsonStr = await rootBundle
          .loadString("assets/scenarios/${reference.linkedFile}");
      final indexJson = jsonDecode(indexJsonStr);
      _scenario = Scenario.map(indexJson);
      return true;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack, label: e.toString());
      return false;
    }
  }

  resetScenario() {
    _scenario = null;
  }
}
