
import 'package:airscaper/domain/storage/inventory_local_source.dart';

class CountCluesUseCase {

  final InventoryLocalSource _inventoryLocalSource;

  CountCluesUseCase(this._inventoryLocalSource);

  int execute() {
    final clues = _inventoryLocalSource.loadAllClues();
    return clues.length;
  }
}
