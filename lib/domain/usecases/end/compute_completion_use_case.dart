
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';

class ComputeCompletionUseCase {

  final ScenarioRepository _repository;
  final InventoryLocalSource _inventoryLocalSource;

  ComputeCompletionUseCase(this._repository, this._inventoryLocalSource);

  int execute()  {
    final items = _inventoryLocalSource.loadAllItems();

    final foundElementsSize = items.length;
    final allElementsSize = _repository.items.length;

    return ((foundElementsSize / allElementsSize) * 100).toInt();
  }
}