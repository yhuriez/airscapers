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
  final Box<InventoryMechanismState> _mechanismDb;
  final Box<InventoryClue> _clueDb;

  static Future<Box<InventoryItem>> createItemBox(int typeId) async {
    Hive.registerAdapter(JsonTypeAdapter<InventoryItem>(
        typeId, (json) => InventoryItem.fromJson(json), (obj) => obj.toJson()));
    return Hive.openBox<InventoryItem>(itemDbName);
  }

  static Future<Box<InventoryMechanismState>> createMechanismBox(int typeId) async {
    Hive.registerAdapter(JsonTypeAdapter<InventoryMechanismState>(
        typeId, (json) => InventoryMechanismState.fromJson(json), (obj) => obj.toJson()));
    return Hive.openBox<InventoryMechanismState>(mechanismDbName);
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

  InventoryItem? loadItem(int id)  {
    return _itemDb.get(id);
  }

  List<InventoryItem> loadAllItems()  {
    return _itemDb.values.toList();
  }

  InventoryMechanismState? loadMechanismState(int mechanismId)  {
    return _mechanismDb.values.firstWhereOrNull((it) => it.mechanismId == mechanismId);
  }

  bool insertItem(int id, bool isPickedUp)  {
    if(_itemDb.containsKey(id)) return false;

    _itemDb.put(id, InventoryItem(id: id, creationDate: DateTime.now(), isPickedUp: isPickedUp));
    return true;
  }

  updateItemUsed(int id) {
    final item = _itemDb.get(id);
    if(item != null) {
      _itemDb.put(id, item.copyWith(used: true));
    }
  }

  List<InventoryClue> loadAllClues() {
    return _clueDb.values.toList();
  }

  InventoryClue? loadClue(int id) {
    return _clueDb.get(id);
  }

  bool insertClue(int id) {
    if(_clueDb.containsKey(id)) return false;

    _clueDb.put(id, InventoryClue(id: id, creationDate: DateTime.now()));
    return true;
  }

  insertOrUpdateMechanismState(int mechanismId, int stateId) {

    InventoryMechanismState? existingState = _mechanismDb.get(mechanismId);

    if(existingState == null) {
      _mechanismDb.put(mechanismId, InventoryMechanismState(
          mechanismId: mechanismId,
          creationDate: DateTime.now(),
          currentStateId: stateId)
      );
    } else {
      _mechanismDb.put(mechanismId, existingState.copyWith(currentStateId: stateId));
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
