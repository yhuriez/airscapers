import 'dart:convert';

import 'package:airscaper/models/scenario.dart';
import 'package:airscaper/models/scenario_index.dart';
import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:airscaper/models/scenario_reference.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../models/inventory_item.dart';

class ScenarioRepository {

  ScenarioIndex? _index;
  Scenario? _scenario;

  List<ScenarioReference> get scenarios => _index?.scenarios ?? [];

  Scenario get scenario {
    if(_scenario == null) throw Exception("Scenario should be defined here");
    return _scenario!;
  }

  String get title => scenario.details.title;

  String get endText => scenario.details.endText;

  int get durationInMinute => scenario.details.duration;

  List<ScenarioItem> get items => scenario.items;

  List<ScenarioMechanism> get mechanisms => scenario.mechanisms;

  bool get isIndexInit => _index != null;

  bool get isScenarioInit => _scenario != null;

  bool get isTutorial => title == "Tutoriel";

  ScenarioItem? getItem(int itemId) => items.firstWhereOrNull((element) => element.id == itemId);

  List<ScenarioItem> getItems(List<InventoryItem> inventoryItems) =>
      inventoryItems.map((inventoryItem) {
        return items.firstWhere((scenarioItem) {
          return scenarioItem.id == inventoryItem.id;
        });
      } ).toList();

  ScenarioMechanism? getMechanism(int mechanismId)
      => mechanisms.firstWhereOrNull((element) => element.id == mechanismId);

  Future<bool> initIndex() async {
    try {
      final indexJsonStr =
          await rootBundle.loadString("assets/scenarios/index.json");
      final indexJson = jsonDecode(indexJsonStr);
      _index = ScenarioIndex.fromJson(indexJson);
      return true;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack, label: e.toString());
      return false;
    }
  }

  Future<bool> initScenario(ScenarioReference reference) async {
    try {
      final indexJsonStr = await rootBundle
          .loadString("assets/scenarios/${reference.linkedFile}");
      final indexJson = jsonDecode(indexJsonStr);
      _scenario = Scenario.fromJson(indexJson);
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
