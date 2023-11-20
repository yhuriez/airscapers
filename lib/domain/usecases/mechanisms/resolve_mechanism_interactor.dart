

import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/models/scenario_mechanism.dart';

import 'load_mechanism_interactor.dart';

class ResolveMechanismInteractor {

  final InventoryLocalSource _inventory;
  final LoadMechanismInteractor _loadMechanismInteractor;

  ResolveMechanismInteractor(this._inventory, this._loadMechanismInteractor);

  ScenarioMechanism? execute(ScenarioMechanism mechanism) {
    _inventory.insertMechanism(mechanism.id);

    final removedItems = mechanism.solving.mapOrNull(
      code: (it) => it.removedItems,
      use: (it) => it.removedItems,
      combine: (it) => it.removedItems,
    );

    removedItems?.forEach((itemId) {
      _inventory.updateItemUsed(itemId);
    });

    final transitionId = mechanism.transitionId;
    if (transitionId != null) {
      return _loadMechanismInteractor.execute(transitionId);
    }
    return null;
  }
}