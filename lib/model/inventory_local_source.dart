import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

class InventoryLocalSource {
  final InventoryDatabase db;

  InventoryLocalSource(this.db);

  Future<List<InventoryItem>> loadUnusedItems() {
    return (db.doSelect(db.inventoryItems)
          ..where((it) => it.used.equals(false)))
        .get();
  }

  Future<InventoryItem> loadItem(int id) {
    return (db.doSelect(db.inventoryItems)..where((it) => it.id.equals(id)))
        .getSingle();
  }

  Future<List<InventoryItem>> loadAllItems() {
    return db.doSelect(db.inventoryItems).get();
  }


  Future<List<InventoryTrack>> loadAllTracks() {
    return db.doSelect(db.inventoryTracks).get();
  }

  Future<InventoryTrack> loadTrack(int id) {
    return (db.doSelect(db.inventoryTracks)..where((it) => it.id.equals(id)))
        .getSingle();
  }

  Future<InventoryMechanismState> loadMechanismState(int mechanismId) {
    return (db.doSelect(db.inventoryMechanismStates)
          ..where((it) => it.mechanismId.equals(mechanismId)))
        .getSingle();
  }

  Future<int> insertItem(int id) async {
    final InventoryItem existing = await (db.doSelect(db.inventoryItems)
          ..where((it) => it.id.equals(id)))
        .getSingle();
    if (existing != null) {
      return -1;
    }

    var companion = InventoryItemsCompanion.insert(
        id: id, creationDate: DateTime.now(), used: Value(false));
    return db.doInsert(db.inventoryItems).insert(companion);
  }

  Future<int> updateItemUsed(int id) async {
    return (db.doUpdate(db.inventoryItems)..where((it) => it.id.equals(id)))
        .write(InventoryItemsCompanion(used: Value(true)));
  }

  Future<List<InventoryClue>> loadAllClues() {
    return db.doSelect(db.inventoryClues).get();
  }

  Future<int> insertTrack(int id) async {
    final InventoryTrack existing = await (db.doSelect(db.inventoryTracks)
          ..where((it) => it.id.equals(id)))
        .getSingle();
    if (existing != null) {
      return -1;
    }

    var companion =
        InventoryTracksCompanion.insert(id: id, creationDate: DateTime.now());
    return db.doInsert(db.inventoryTracks).insert(companion);
  }

  Future<int> insertClue(int id) async {
    final InventoryClue existing = await (db.doSelect(db.inventoryClues)
          ..where((it) => it.clueId.equals(id)))
        .getSingle();
    if (existing != null) {
      return -1;
    }

    var companion = InventoryCluesCompanion.insert(
        clueId: id, creationDate: DateTime.now());
    return db.doInsert(db.inventoryClues).insert(companion);
  }

  Future<int> insertOrUpdateMechanismState(int mechanismId, int stateId) async {
    final InventoryMechanismState existingMechanism =
        await (db.doSelect(db.inventoryMechanismStates)
              ..where((it) => it.mechanismId.equals(mechanismId)))
            .getSingle();

    if (existingMechanism == null) {
      // Insert
      var companion = InventoryMechanismStatesCompanion.insert(
          mechanismId: mechanismId,
          currentStateId: stateId,
          creationDate: DateTime.now());
      return db.doInsert(db.inventoryMechanismStates).insert(companion);
    } else {
      // Update
      return (db.doUpdate(db.inventoryMechanismStates)
            ..where((it) => it.mechanismId.equals(mechanismId)))
          .write(InventoryMechanismStatesCompanion(
              currentStateId: Value(stateId)));
    }
  }

  Future<bool> clear() async {
    await db.doDelete(db.inventoryItems).go();
    await db.doDelete(db.inventoryTracks).go();
    await db.doDelete(db.inventoryMechanismStates).go();
    return true;
  }
}
