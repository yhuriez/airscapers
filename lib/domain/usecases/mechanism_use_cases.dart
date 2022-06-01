import 'package:airscaper/common/exception/invalid_scenario_exception.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class LoadCurrentMechanismStateUseCase {
  final InventoryLocalSource _inventory;

  LoadCurrentMechanismStateUseCase(this._inventory);

  MechanismState execute(ScenarioMechanism mechanism) {
    final inventoryState = _inventory.loadMechanismState(mechanism.id);

    MechanismState currentState;
    if (inventoryState == null) {
      currentState = mechanism.states.firstWhere((element) => element.start);
    } else {
      currentState =
          mechanism.states.firstWhere((element) => element.id == inventoryState.currentStateId);
    }

    currentState = _updateStateIfTransitionAvailable(mechanism, currentState);

    return currentState;
  }

  // If the mechanism expect an item that is not picked up, we apply directly the transition
  MechanismState _updateStateIfTransitionAvailable(
      ScenarioMechanism mechanism, MechanismState currentState) {
    final transitions =
        currentState.transitions.where((element) => element.expectedItem != null).toList();

    if (transitions.isNotEmpty) {
      final items = _inventory.loadAllItems();

      final possibleTransition = transitions.firstWhereOrNull((transition) {
        return items.any((item) => item.id == transition.expectedItem && !item.isPickedUp);
      });

      final newStateId = possibleTransition?.transitionTo;
      if (newStateId != null) {
        _inventory.insertOrUpdateMechanismState(mechanism.id, newStateId);
        return mechanism.states.firstWhere((element) => element.id == newStateId);
      }
    }
    // If no transition found, return current state (do nothing)
    return currentState;
  }
}

class MechanismCodeInputUseCase {
  final StateTransitionUseCase _stateTransitionUseCase;
  final LoadCurrentMechanismStateUseCase _loadCurrentMechanismStateUseCase;

  MechanismCodeInputUseCase(this._stateTransitionUseCase, this._loadCurrentMechanismStateUseCase);

  MechanismState? execute(BuildContext context, ScenarioMechanism mechanism, String code) {
    final currentState = _loadCurrentMechanismStateUseCase.execute(mechanism);

    final nextTransition = currentState.transitions.firstWhereOrNull((transition) {
      final codeFormatted = code.toLowerCase().replaceAll(" ", "");
      return transition.expectedCodes.any((element) => element.toLowerCase() == codeFormatted);
    });

    if (nextTransition != null) {
      return _stateTransitionUseCase.execute(context, mechanism, nextTransition);
    }
    return null;
  }
}

class MechanismItemSelectUseCase {
  final StateTransitionUseCase _stateTransitionUseCase;
  final LoadCurrentMechanismStateUseCase _loadCurrentMechanismStateUseCase;

  MechanismItemSelectUseCase(this._stateTransitionUseCase, this._loadCurrentMechanismStateUseCase);

  MechanismState? execute(BuildContext context, ScenarioMechanism mechanism, int itemId) {
    final currentState = _loadCurrentMechanismStateUseCase.execute(mechanism);

    final nextTransition = currentState.transitions
        .firstWhereOrNull((transition) => itemId == transition.expectedItem);

    if (nextTransition != null) {
      return _stateTransitionUseCase.execute(context, mechanism, nextTransition, itemId: itemId);
    }
    return null;
  }
}

class StateTransitionUseCase {

  final InventoryLocalSource _inventory;
  final LoadCurrentMechanismStateUseCase _currentMechanismStateUseCase;
  final InventoryLocalSource _localSource;

  StateTransitionUseCase(this._inventory, this._currentMechanismStateUseCase, this._localSource);

  MechanismState execute(
      BuildContext context, ScenarioMechanism mechanism, MechanismTransition transition,
      {int? itemId}) {
    final newStateId = transition.transitionTo;

    // Update current state for given mechanism
    _inventory.insertOrUpdateMechanismState(mechanism.id, newStateId);

    List<int> removedItems = List.of(transition.removedItems);

    removedItems.forEach((itemId) => _localSource.updateItemUsed(itemId));

    return _currentMechanismStateUseCase.execute(mechanism);
  }
}

class MechanismFinishedUseCase {
  final ScenarioRepository _repository;
  final InventoryLocalSource _inventory;
  final ScenarioStateStorage _sharedPrefs;

  MechanismFinishedUseCase(this._repository, this._inventory, this._sharedPrefs);

  NavigationIntent execute(ScenarioMechanism mechanism, int endTrackId) {
    final item = _repository.getItem(endTrackId);

    if (item == null) throw InvalidScenarioException(
          "End track $endTrackId declared in mechanism ${mechanism.id} (${mechanism.name}) does not exists in the scenario");

    _inventory.insertItem(item.id, false);

    // If end track, mark as ended and go to end screen
    if (item.endTrack) {
      _sharedPrefs.setEndDate(DateTime.now());
      return NavigationIntent.success();
    }

    return NavigationIntent.itemDetails(item: item);
  }
}

class LoadAvailableCluesUseCase {
  final InventoryLocalSource _localSource;

  LoadAvailableCluesUseCase(this._localSource);

  List<MechanismClue> execute(MechanismState state) {
    final clues = state.clues;
    final inventoryClues = _localSource.loadAllClues();

    return clues
        .where((clue) => inventoryClues.any((element) => element.id == clue.id))
        .toList();
  }
}

class UseClueUseCase {
  final InventoryLocalSource _localSource;
  final LoadAvailableCluesUseCase _availableCluesUseCase;

  UseClueUseCase(this._localSource, this._availableCluesUseCase);

  List<MechanismClue> execute(MechanismState state) {
    var availableClues = _availableCluesUseCase.execute(state);
    var allClues = state.clues;

    if (availableClues.length < allClues.length) {
      availableClues.sort((a, b) => a.id - b.id);
      allClues.sort((a, b) => a.id - b.id);

      final nextClue = allClues[availableClues.length];
      _localSource.insertClue(nextClue.id);
      availableClues += [nextClue];
    }

    return availableClues;
  }
}
