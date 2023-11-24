import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ScenarioMechanism to/from Json', () {
    test('should convert a complete ScenarioMechanism instance into a JSON map', () {
      final mechanism = ScenarioMechanism(
        id: "1",
        title: 'Test Mechanism',
        description: 'A test mechanism description',
        image: 'image.png',
        transitionId: "2",
        solving: MechanismSolving.pick("3"),
        clues: ['Clue 1', 'Clue 2']
      );

      final json = mechanism.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Test Mechanism');
      expect(json['description'], 'A test mechanism description');
      expect(json['image'], 'image.png');
      expect(json['transitionId'], "2");
      expect(json['solving'], isA<Map<String, dynamic>>());
      expect(json['solving']['type'], 'pick');
      expect(json['solving']['expectedItem'], "3");
      expect(json['clues'], isA<List<dynamic>>());
      expect(json['clues'].length, 2);
    });

    test('should convert a JSON map into a complete ScenarioMechanism instance', () {
      final json = {
        'id': "1",
        'name': 'Test Mechanism',
        'description': 'A test mechanism description',
        'image': 'image.png',
        'transitionTo': "2",
        'solving': {
          'type': 'pick',
          'newItem': "3",
        },
        'clues': ['Clue 1', 'Clue 2']
      };

      final mechanism = ScenarioMechanism.fromJson(json);

      expect(mechanism.id, "1");
      expect(mechanism.title, 'Test Mechanism');
      expect(mechanism.description, 'A test mechanism description');
      expect(mechanism.image, 'image.png');
      expect(mechanism.transitionId, "2");
      expect(mechanism.solving, isA<MechanismSolving>());
      expect(mechanism.solving, isA<MechanismSolvingPick>());
      expect((mechanism.solving as MechanismSolvingPick).newItem, 3);
      expect(mechanism.clues, ['Clue 1', 'Clue 2']);
    });
  });
}
