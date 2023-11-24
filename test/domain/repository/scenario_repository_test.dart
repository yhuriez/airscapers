import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/tools/test_assets_reader.dart';


void main() {
  group('ScenarioRepository Tests', () {
    late ScenarioRepository scenarioRepository;
    late TestAssetsReader testAssetsReader;

    setUp(() {
      testAssetsReader = TestAssetsReader();
      scenarioRepository = ScenarioRepository(testAssetsReader);
    });

    test('initIndex Success', () async {
      final result = await scenarioRepository.initIndex();

      expect(result, isTrue);
      expect(scenarioRepository.isScenarioInit, isFalse);
      expect(scenarioRepository.isIndexInit, isTrue);
      expect(scenarioRepository.scenarios.length, equals(1));
    });

    test('initScenario Success', () async {
      await scenarioRepository.initIndex();
      final result = await scenarioRepository.initScenario(scenarioRepository.scenarios.first);

      expect(result, isTrue);
      expect(scenarioRepository.isScenarioInit, isTrue);
      expect(scenarioRepository.scenario.items.length, equals(4));
      expect(scenarioRepository.scenario.mechanisms.length, equals(13));
      expect(scenarioRepository.durationInMinute, equals(10));
      expect(scenarioRepository.isTutorial, isTrue);
    });
  });
}
