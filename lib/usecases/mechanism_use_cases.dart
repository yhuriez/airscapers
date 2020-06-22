import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/model/inventory_local_source.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/views/inventory/inventory_details_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';

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
    final trackTransitions = mechanism.transitions
        .where((element) =>
            element.stateId == currentState.id && element.expectedTrack != null)
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
      ScenarioMechanism mechanism, String code) async {
    final currentState =
        await _loadCurrentMechanismStateUseCase.execute(mechanism);
    final availableTransitions =
        mechanism.getTransitionsForState(currentState.id);

    final nextTransition = availableTransitions.firstWhere((transition) {
      return code.toLowerCase() == transition.expectedCode.toLowerCase();
    }, orElse: () => null);

    if (nextTransition != null) {
      return await _stateTransitionUseCase.execute(mechanism, nextTransition);
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
      ScenarioMechanism mechanism, ScenarioItem item) async {
    final currentState =
        await _loadCurrentMechanismStateUseCase.execute(mechanism);
    final availableTransitions =
        mechanism.getTransitionsForState(currentState.id);

    final nextTransition = availableTransitions.firstWhere((transition) {
      return item != null && item.id == transition.expectedItemId;
    }, orElse: () => null);

    if (nextTransition != null) {
      return await _stateTransitionUseCase.execute(mechanism, nextTransition, item: item);
    }
    return null;
  }
}

class StateTransitionUseCase {
  final InventoryLocalSource _inventory;
  final LoadCurrentMechanismStateUseCase _currentMechanismStateUseCase;

  StateTransitionUseCase(this._inventory, this._currentMechanismStateUseCase);

  Future<MechanismState> execute(
      ScenarioMechanism mechanism,
      MechanismTransition transition,
      { ScenarioItem item }) async {
    final newStateId = transition.transitionTo;

    // Update current state for given mechanism
    await _inventory.insertOrUpdateMechanismState(mechanism.id, newStateId);

    // If item used for transition, mark item as used in database
    if(item != null) {
      await _inventory.updateItemUsed(item.id);
    }

    return await _currentMechanismStateUseCase.execute(mechanism);
  }
}

class MechanismFinishedUseCase {
  final ScenarioRepository _repository;
  final InventoryLocalSource _inventory;

  MechanismFinishedUseCase(this._repository, this._inventory);

  Future<NavigationIntent> execute(
      ScenarioMechanism mechanism, MechanismState endState) async {
    final track = _repository.getTrack(endState.endTrack);

    await _inventory.insertTrack(track.id);

    return InventoryDetailsScreen.navigate(
        ScenarioElementDesc.fromTrack(track));
  }
}
