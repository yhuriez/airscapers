import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/models/scenario_mechanism.dart';

import 'load_available_clues_use_cases.dart';


class UseClueUseCase {
  final InventoryLocalSource _localSource;
  final LoadAvailableCluesUseCase _availableCluesUseCase;

  UseClueUseCase(this._localSource, this._availableCluesUseCase);

  List<MechanismClue> execute(ScenarioMechanism mechanism) {
    var availableClues = _availableCluesUseCase.execute(mechanism);
    var allClues = mechanism.getCluesObjects();

    if (availableClues.length < allClues.length) {
      availableClues.sort((a, b) => a.id.compareTo(b.id));
      allClues.sort((a, b) => a.id.compareTo(b.id));

      final nextClue = allClues[availableClues.length];
      _localSource.insertClue(nextClue.id);
      availableClues += [nextClue];
    }

    return availableClues;
  }
}
