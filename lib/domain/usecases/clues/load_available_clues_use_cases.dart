import 'package:airscaper/common/exception/invalid_scenario_exception.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';


class LoadAvailableCluesUseCase {
  final InventoryLocalSource _localSource;

  LoadAvailableCluesUseCase(this._localSource);

  List<MechanismClue> execute(ScenarioMechanism mechanism) {
    final clues = mechanism.getCluesObjects();
    final inventoryClues = _localSource.loadAllClues();

    return clues.where((clue) => inventoryClues.any((element) => element.id == clue.id)).toList();
  }
}
