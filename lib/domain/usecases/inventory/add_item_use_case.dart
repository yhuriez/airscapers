import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:flutter/cupertino.dart';

class AddItemUseCase {
  final InventoryLocalSource _localSource;

  AddItemUseCase(this._localSource);

  AddLootResponse execute(String itemId, String originMechanismId) {
    var existingElement = false;
    var usedElement = false;

    try {
      final result = _localSource.loadItem(itemId);
      if (result != null) {
        usedElement = result.used;
        existingElement = true;
      } else {
        _localSource.insertItem(itemId, originMechanismId);
      }

      if (usedElement) return AddLootResponse.ALREADY_USED;
      if (existingElement) return AddLootResponse.ALREADY_FOUND;
      return AddLootResponse.ADDED;
    } catch (exception, stack) {
      debugPrintStack(stackTrace: stack);
      return AddLootResponse.ERROR;
    }
  }
}

enum AddLootResponse { ADDED, ALREADY_FOUND, ALREADY_USED, ERROR }
