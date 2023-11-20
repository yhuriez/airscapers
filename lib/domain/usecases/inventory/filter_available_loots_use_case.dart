import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/models/scenario_loot.dart';

class FilterAvailableLootUseCase {
  final InventoryLocalSource _inventory;

  FilterAvailableLootUseCase(this._inventory);

  List<ScenarioLoot> execute(List<ScenarioLoot> baseLoot) {
    if (baseLoot.isEmpty) return [];

    final itemIds = (_inventory.loadAllItems()).map((it) => it.id).toList();

    return baseLoot.where((loot) => !itemIds.contains(loot.id)).toList();
  }
}
