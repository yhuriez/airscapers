import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

// To regenerate database : flutter packages pub run build_runner build

class InventoryItems extends Table {
  IntColumn get id => integer().customConstraint("PRIMARY KEY")();
  DateTimeColumn get creationDate => dateTime()();
  BoolColumn get used => boolean().withDefault(Constant(false))();
}

class InventoryTracks extends Table {
  IntColumn get id => integer().customConstraint("PRIMARY KEY")();
  DateTimeColumn get creationDate => dateTime()();
}

class InventoryMechanismStates extends Table {
  IntColumn get mechanismId => integer().customConstraint("PRIMARY KEY")();
  IntColumn get currentStateId => integer()();
  DateTimeColumn get creationDate => dateTime()();
}

class InventoryClues extends Table {
  IntColumn get clueId => integer().customConstraint("PRIMARY KEY")();
  DateTimeColumn get creationDate => dateTime()();
}


@UseMoor(tables: [InventoryTracks, InventoryItems, InventoryMechanismStates, InventoryClues])
class InventoryDatabase extends _$InventoryDatabase {
  InventoryDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'inventory_db.sqlite'));

  @override
  int get schemaVersion => 1;

  // region DELEGATE METHODS

  SimpleSelectStatement<T, R> doSelect<T extends Table, R extends DataClass>(
      TableInfo<T, R> table) {
    return select(table);
  }

  InsertStatement<T, R> doInsert<T extends Table, R extends DataClass>(
      TableInfo<T, R> table) {
    return into(table);
  }

  UpdateStatement<T, R> doUpdate<T extends Table, R extends DataClass>(
      TableInfo<T, R> table) {
    return update(table);
  }

  DeleteStatement<T, D> doDelete<T extends Table, D extends DataClass>(
      TableInfo<T, D> table) {
    return delete(table);
  }

// endregion
}
