import 'dart:convert';
import 'dart:io';

import 'package:airscaper/domain/usecases/graph/build_graph_use_case.dart';
import 'package:airscaper/models/scenario.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BuildGraphUseCase Tests', () {
    late BuildGraphUseCase _useCase;

    setUp(() {
      _useCase = BuildGraphUseCase();
    });

    Future<Scenario> _loadScenarioFile(String filename) async {
      var filePath = 'test/assets/scenarios/$filename';
      var file = File(filePath);
      final jsonText = await file.readAsString();

      final indexJson = jsonDecode(jsonText);
      return Scenario.fromJson(indexJson);
    }

    test('With success', () async {
      final scenario = await _loadScenarioFile("valid_tutorial.json");

      final entryPoints = scenario.mechanisms
          .where((it) => it.isEntryPoint)
          .map((it) => it.id);
      print("Entry nodes : $entryPoints");

      final result = await _useCase.execute(scenario);

      print(result.rootNode.toString());

      final nodes = result.rootNode.allChildren;

      expect(nodes.length, equals(13));
      expect(result.errors.circularDependency, isEmpty);
      expect(result.errors.unresolvableMechanisms, isEmpty);
      expect(result.errors.unusedItems, isEmpty);
      expect(result.errors.notCollectableItems, isEmpty);
      expect(result.errors.missingEnd, isFalse);
    });

    test('With missing end', () async {
      final scenario = await _loadScenarioFile("missing_end_tutorial.json");

      final result = await _useCase.execute(scenario);

      final nodes = result.rootNode.allChildren;

      expect(nodes.length, equals(13));
      expect(result.errors.missingEnd, isTrue);
    });

    test('With unresolvable mechanism', () async {
      final scenario = await _loadScenarioFile("unresolvable_mechanism_tutorial.json");

      final result = await _useCase.execute(scenario);

      expect(result.errors.unresolvableMechanisms, equals(["69", "42"]));
    });

    test('With unused items', () async {
      final scenario = await _loadScenarioFile("unused_items_tutorial.json");

      final result = await _useCase.execute(scenario);

      expect(result.errors.unusedItems, equals(["11", "39"]));
    });

    test('With not collectible items', () async {
      final scenario = await _loadScenarioFile("not collectible_items_tutorial.json");

      final result = await _useCase.execute(scenario);

      expect(result.errors.notCollectableItems, equals(["35", "39"]));
    });

  });
}
