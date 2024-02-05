import 'package:airscaper/domain/configuration/hive_configuration.dart';
import 'package:airscaper/models/inventory_clue.dart';
import 'package:airscaper/models/inventory_item.dart';
import 'package:airscaper/models/inventory_mechanism_state.dart';
import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

class InventoryLocalSource {
  static const itemDbName = "items";
  static const mechanismDbName = "mechanisms";
  static const clueDbName = "clues";

  final Box<InventoryItem> _itemDb;
  final Box<InventoryMechanism> _mechanismDb;
  final Box<InventoryClue> _clueDb;

  static Future<Box<InventoryItem>> createItemBox(int typeId) async {
    Hive.registerAdapter(JsonTypeAdapter<InventoryItem>(
        typeId, (json) => InventoryItem.fromJson(json), (obj) => obj.toJson()));
    return Hive.openBox<InventoryItem>(itemDbName);
  }

  static Future<Box<InventoryMechanism>> createMechanismBox(int typeId) async {
    Hive.registerAdapter(JsonTypeAdapter<InventoryMechanism>(
        typeId, (json) => InventoryMechanism.fromJson(json), (obj) => obj.toJson()));
    return Hive.openBox<InventoryMechanism>(mechanismDbName);
  }

  static Future<Box<InventoryClue>> createClueBox(int typeId) async {
    Hive.registerAdapter(JsonTypeAdapter<InventoryClue>(
        typeId, (json) => InventoryClue.fromJson(json), (obj) => obj.toJson()));
    return Hive.openBox<InventoryClue>(clueDbName);
  }

  InventoryLocalSource(this._itemDb, this._mechanismDb, this._clueDb);

  List<InventoryItem> loadUnusedItems() {
    return _itemDb.values.where((it) => it.used == (false)).toList();
  }

  InventoryItem? loadItem(String id) {
    return _itemDb.get(id);
  }

  List<InventoryItem> loadAllItems() {
    return _itemDb.values.toList();
  }

  InventoryMechanism? loadResolvedMechanism(String mechanismId) {
    return _mechanismDb.values.firstWhereOrNull((it) => it.mechanismId == mechanismId);
  }

  bool insertItem(String id, String originMechanismId) {
    if (_itemDb.containsKey(id)) return false;

    _itemDb.put(id, InventoryItem(
        id: id,
        originMechanismId: originMechanismId,
        inventoryMechanismId: originMechanismId,
        creationDate: DateTime.now()
    ));
    return true;
  }

  updateItemUsed(String id) {
    final item = _itemDb.get(id);
    if (item != null) {
      _itemDb.put(id, item.copyWith(used: true));
    }
  }

  List<InventoryClue> loadAllClues() {
    return _clueDb.values.toList();
  }

  InventoryClue? loadClue(String id) {
    return _clueDb.get(id);
  }

  bool insertClue(String id) {
    if (_clueDb.containsKey(id)) return false;

    _clueDb.put(id, InventoryClue(id: id, creationDate: DateTime.now()));
    return true;
  }

  resolveMechanism(String mechanismId) {
    InventoryMechanism? existingState = _mechanismDb.get(mechanismId);

    if (existingState == null) {
      _mechanismDb.put(
          mechanismId, InventoryMechanism(mechanismId: mechanismId, creationDate: DateTime.now())
      );
    }
  }

  Stream watchItems() => _itemDb.watch();

  Future<bool> clear() async {
    await _itemDb.clear();
    await _mechanismDb.clear();
    await _clueDb.clear();
    return true;
  }
}
