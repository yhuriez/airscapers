import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/models/scenario_mechanism.dart';

class LoadMechanismInteractor {
  final InventoryLocalSource _inventory;
  final ScenarioRepository _repository;

  LoadMechanismInteractor(this._inventory, this._repository);

  ScenarioMechanism execute(String id) {

    final mechanism = _repository.getMechanism(id);

    if (mechanism == null) {
      throw Exception("Illegal state : should not have a stored mechanism that doesn't exists in scenario.");
    }

    final resolvedMechanism = _inventory.loadResolvedMechanism(id);
    if (resolvedMechanism != null) {
      var transitionId = mechanism.transitionId;

      if (transitionId != null) {
        return execute(transitionId);
      }
    }

    // If is activation mechanism, mark related mechanisms as resolved
    var solving = mechanism.solving;
    if (solving is MechanismSolvingActivation) {
      solving.mechanismIds.forEach((mechanismId) {
        _inventory.resolveMechanism(mechanismId);
      });
    }

    return mechanism;
  }
}
