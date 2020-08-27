import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/model/inventory_local_source.dart';
import 'package:airscaper/model/sharedprefs/scenario_shared_prefs.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
import 'package:airscaper/views/home/success_screen.dart';
import 'package:airscaper/views/inventory/inventory_details_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadCurrentMechanismStateUseCase {
  final InventoryLocalSource _inventory;

  LoadCurrentMechanismStateUseCase(this._inventory);

  Future<MechanismState> execute(ScenarioMechanism mechanism) async {
    final inventoryState = await _inventory.loadMechanismState(mechanism.id);

    MechanismState currentState;
    if (inventoryState == null) {
      currentState = mechanism.states.firstWhere((element) => element.start);
    } else {
      currentState = mechanism.states
          .firstWhere((element) => element.id == inventoryState.currentStateId);
    }

    currentState =
        await _updateStateIfTransitionAvailable(mechanism, currentState);

    return currentState;
  }

  Future<MechanismState> _updateStateIfTransitionAvailable(
      ScenarioMechanism mechanism, MechanismState currentState) async {
    final trackTransitions = currentState.transitions
        .where((element) => element.expectedTrack != null)
        .toList();

    if (trackTransitions != null && trackTransitions.isNotEmpty) {
      final tracks = await _inventory.loadAllTracks();

      final possibleTransition = trackTransitions.firstWhere((transition) {
        return tracks.firstWhere(
                (track) => track.id == transition.expectedTrack,
                orElse: () => null) !=
            null;
      }, orElse: () => null);

      if (possibleTransition != null) {
        final newStateId = possibleTransition.transitionTo;
        _inventory.insertOrUpdateMechanismState(mechanism.id, newStateId);
        return mechanism.states
            .firstWhere((element) => element.id == newStateId);
      }
    }
    // If no transition found, return current state (do nothing)
    return currentState;
  }
}

class MechanismCodeInputUseCase {
  final StateTransitionUseCase _stateTransitionUseCase;
  final LoadCurrentMechanismStateUseCase _loadCurrentMechanismStateUseCase;

  MechanismCodeInputUseCase(
      this._stateTransitionUseCase, this._loadCurrentMechanismStateUseCase);

  Future<MechanismState> execute(
      BuildContext context, ScenarioMechanism mechanism, String code) async {
    final currentState =
        await _loadCurrentMechanismStateUseCase.execute(mechanism);

    final nextTransition = currentState.transitions.firstWhere((transition) {
      final codeFormatted = code.toLowerCase().replaceAll(" ", "");

      return transition.expectedCodes != null &&
          transition.expectedCodes
              .any((element) => element.toLowerCase() == codeFormatted);
    }, orElse: () => null);

    if (nextTransition != null) {
      return await _stateTransitionUseCase.execute(
          context, mechanism, nextTransition);
    }
    return null;
  }
}

class MechanismItemSelectUseCase {
  final StateTransitionUseCase _stateTransitionUseCase;
  final LoadCurrentMechanismStateUseCase _loadCurrentMechanismStateUseCase;

  MechanismItemSelectUseCase(
      this._stateTransitionUseCase, this._loadCurrentMechanismStateUseCase);

  Future<MechanismState> execute(
      BuildContext context, ScenarioMechanism mechanism, int itemId) async {
    final currentState =
        await _loadCurrentMechanismStateUseCase.execute(mechanism);

    final nextTransition = currentState.transitions.firstWhere((transition) {
      return itemId != null && itemId == transition.expectedItemId;
    }, orElse: () => null);

    if (nextTransition != null) {
      return await _stateTransitionUseCase
          .execute(context, mechanism, nextTransition, itemId: itemId);
    }
    return null;
  }
}

class StateTransitionUseCase {
  final InventoryLocalSource _inventory;
  final LoadCurrentMechanismStateUseCase _currentMechanismStateUseCase;

  StateTransitionUseCase(this._inventory, this._currentMechanismStateUseCase);

  Future<MechanismState> execute(BuildContext context,
      ScenarioMechanism mechanism, MechanismTransition transition,
      {int itemId}) async {
    final newStateId = transition.transitionTo;

    // Update current state for given mechanism
    await _inventory.insertOrUpdateMechanismState(mechanism.id, newStateId);

    // ignore: close_sinks
    final InventoryBloc inventoryBloc = BlocProvider.of(context);

    List<int> removedItems = [];

    // Delete items that are no more useful
    if (transition.removedItems != null) {
      removedItems += transition.removedItems;
    }

    if (removedItems.isNotEmpty) {
      inventoryBloc.add(RemoveItemsInventoryEvent(removedItems));
    }

    return await _currentMechanismStateUseCase.execute(mechanism);
  }
}

class MechanismFinishedUseCase {
  final ScenarioRepository _repository;
  final InventoryLocalSource _inventory;
  final ScenarioSharedPrefs _sharedPrefs;

  MechanismFinishedUseCase(
      this._repository, this._inventory, this._sharedPrefs);

  Future<NavigationIntent> execute(
      ScenarioMechanism mechanism, MechanismState endState) async {
    final track = _repository.getTrack(endState.endTrack);

    await _inventory.insertTrack(track.id);

    // If end track, mark as ended and go to end screen
    if (track.endTrack) {
      await _sharedPrefs.setEndDate(DateTime.now());
      return SuccessScreen.navigate();
    }

    return InventoryDetailsFragment.navigate(
        ScenarioElementDesc.fromTrack(track, found: false));
  }
}

class LoadAvailableCluesUseCase {
  final InventoryLocalSource _localSource;

  LoadAvailableCluesUseCase(this._localSource);

  Future<List<MechanismClue>> execute(MechanismState state) async {
    final clues = state.clues;
    final inventoryClues = await _localSource.loadAllClues();

    return clues
        .where((clue) =>
            inventoryClues.any((element) => element.clueId == clue.id))
        .toList();
  }
}

class UseClueUseCase {
  final InventoryLocalSource _localSource;
  final LoadAvailableCluesUseCase _availableCluesUseCase;

  UseClueUseCase(this._localSource, this._availableCluesUseCase);

  Future<List<MechanismClue>> execute(MechanismState state) async {
    var availableClues = await _availableCluesUseCase.execute(state);
    var allClues = state.clues;

    if (availableClues.length < allClues.length) {
      availableClues.sort((a, b) => a.id - b.id);
      allClues.sort((a, b) => a.id - b.id);

      final nextClue = allClues[availableClues.length];
      await _localSource.insertClue(nextClue.id);
      availableClues += [nextClue];
    }

    return availableClues;
  }
}
