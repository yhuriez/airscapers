// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class InventoryTrack extends DataClass implements Insertable<InventoryTrack> {
  final int id;
  final DateTime creationDate;
  InventoryTrack({@required this.id, @required this.creationDate});
  factory InventoryTrack.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return InventoryTrack(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      creationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || creationDate != null) {
      map['creation_date'] = Variable<DateTime>(creationDate);
    }
    return map;
  }

  InventoryTracksCompanion toCompanion(bool nullToAbsent) {
    return InventoryTracksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      creationDate: creationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(creationDate),
    );
  }

  factory InventoryTrack.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return InventoryTrack(
      id: serializer.fromJson<int>(json['id']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'creationDate': serializer.toJson<DateTime>(creationDate),
    };
  }

  InventoryTrack copyWith({int id, DateTime creationDate}) => InventoryTrack(
        id: id ?? this.id,
        creationDate: creationDate ?? this.creationDate,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryTrack(')
          ..write('id: $id, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, creationDate.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is InventoryTrack &&
          other.id == this.id &&
          other.creationDate == this.creationDate);
}

class InventoryTracksCompanion extends UpdateCompanion<InventoryTrack> {
  final Value<int> id;
  final Value<DateTime> creationDate;
  const InventoryTracksCompanion({
    this.id = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  InventoryTracksCompanion.insert({
    @required int id,
    @required DateTime creationDate,
  })  : id = Value(id),
        creationDate = Value(creationDate);
  static Insertable<InventoryTrack> custom({
    Expression<int> id,
    Expression<DateTime> creationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (creationDate != null) 'creation_date': creationDate,
    });
  }

  InventoryTracksCompanion copyWith(
      {Value<int> id, Value<DateTime> creationDate}) {
    return InventoryTracksCompanion(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    return map;
  }
}

class $InventoryTracksTable extends InventoryTracks
    with TableInfo<$InventoryTracksTable, InventoryTrack> {
  final GeneratedDatabase _db;
  final String _alias;
  $InventoryTracksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        $customConstraints: 'PRIMARY KEY');
  }

  final VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  GeneratedDateTimeColumn _creationDate;
  @override
  GeneratedDateTimeColumn get creationDate =>
      _creationDate ??= _constructCreationDate();
  GeneratedDateTimeColumn _constructCreationDate() {
    return GeneratedDateTimeColumn(
      'creation_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, creationDate];
  @override
  $InventoryTracksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'inventory_tracks';
  @override
  final String actualTableName = 'inventory_tracks';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryTrack> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date'], _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  InventoryTrack map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return InventoryTrack.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $InventoryTracksTable createAlias(String alias) {
    return $InventoryTracksTable(_db, alias);
  }
}

class InventoryItem extends DataClass implements Insertable<InventoryItem> {
  final int id;
  final DateTime creationDate;
  final bool used;
  InventoryItem(
      {@required this.id, @required this.creationDate, @required this.used});
  factory InventoryItem.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return InventoryItem(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      creationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_date']),
      used: boolType.mapFromDatabaseResponse(data['${effectivePrefix}used']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || creationDate != null) {
      map['creation_date'] = Variable<DateTime>(creationDate);
    }
    if (!nullToAbsent || used != null) {
      map['used'] = Variable<bool>(used);
    }
    return map;
  }

  InventoryItemsCompanion toCompanion(bool nullToAbsent) {
    return InventoryItemsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      creationDate: creationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(creationDate),
      used: used == null && nullToAbsent ? const Value.absent() : Value(used),
    );
  }

  factory InventoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return InventoryItem(
      id: serializer.fromJson<int>(json['id']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      used: serializer.fromJson<bool>(json['used']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'used': serializer.toJson<bool>(used),
    };
  }

  InventoryItem copyWith({int id, DateTime creationDate, bool used}) =>
      InventoryItem(
        id: id ?? this.id,
        creationDate: creationDate ?? this.creationDate,
        used: used ?? this.used,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryItem(')
          ..write('id: $id, ')
          ..write('creationDate: $creationDate, ')
          ..write('used: $used')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(creationDate.hashCode, used.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is InventoryItem &&
          other.id == this.id &&
          other.creationDate == this.creationDate &&
          other.used == this.used);
}

class InventoryItemsCompanion extends UpdateCompanion<InventoryItem> {
  final Value<int> id;
  final Value<DateTime> creationDate;
  final Value<bool> used;
  const InventoryItemsCompanion({
    this.id = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.used = const Value.absent(),
  });
  InventoryItemsCompanion.insert({
    @required int id,
    @required DateTime creationDate,
    this.used = const Value.absent(),
  })  : id = Value(id),
        creationDate = Value(creationDate);
  static Insertable<InventoryItem> custom({
    Expression<int> id,
    Expression<DateTime> creationDate,
    Expression<bool> used,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (creationDate != null) 'creation_date': creationDate,
      if (used != null) 'used': used,
    });
  }

  InventoryItemsCompanion copyWith(
      {Value<int> id, Value<DateTime> creationDate, Value<bool> used}) {
    return InventoryItemsCompanion(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
      used: used ?? this.used,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (used.present) {
      map['used'] = Variable<bool>(used.value);
    }
    return map;
  }
}

class $InventoryItemsTable extends InventoryItems
    with TableInfo<$InventoryItemsTable, InventoryItem> {
  final GeneratedDatabase _db;
  final String _alias;
  $InventoryItemsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        $customConstraints: 'PRIMARY KEY');
  }

  final VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  GeneratedDateTimeColumn _creationDate;
  @override
  GeneratedDateTimeColumn get creationDate =>
      _creationDate ??= _constructCreationDate();
  GeneratedDateTimeColumn _constructCreationDate() {
    return GeneratedDateTimeColumn(
      'creation_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usedMeta = const VerificationMeta('used');
  GeneratedBoolColumn _used;
  @override
  GeneratedBoolColumn get used => _used ??= _constructUsed();
  GeneratedBoolColumn _constructUsed() {
    return GeneratedBoolColumn('used', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, creationDate, used];
  @override
  $InventoryItemsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'inventory_items';
  @override
  final String actualTableName = 'inventory_items';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date'], _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    if (data.containsKey('used')) {
      context.handle(
          _usedMeta, used.isAcceptableOrUnknown(data['used'], _usedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  InventoryItem map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return InventoryItem.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $InventoryItemsTable createAlias(String alias) {
    return $InventoryItemsTable(_db, alias);
  }
}

class InventoryMechanismState extends DataClass
    implements Insertable<InventoryMechanismState> {
  final int mechanismId;
  final int currentStateId;
  final DateTime creationDate;
  InventoryMechanismState(
      {@required this.mechanismId,
      @required this.currentStateId,
      @required this.creationDate});
  factory InventoryMechanismState.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return InventoryMechanismState(
      mechanismId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}mechanism_id']),
      currentStateId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}current_state_id']),
      creationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || mechanismId != null) {
      map['mechanism_id'] = Variable<int>(mechanismId);
    }
    if (!nullToAbsent || currentStateId != null) {
      map['current_state_id'] = Variable<int>(currentStateId);
    }
    if (!nullToAbsent || creationDate != null) {
      map['creation_date'] = Variable<DateTime>(creationDate);
    }
    return map;
  }

  InventoryMechanismStatesCompanion toCompanion(bool nullToAbsent) {
    return InventoryMechanismStatesCompanion(
      mechanismId: mechanismId == null && nullToAbsent
          ? const Value.absent()
          : Value(mechanismId),
      currentStateId: currentStateId == null && nullToAbsent
          ? const Value.absent()
          : Value(currentStateId),
      creationDate: creationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(creationDate),
    );
  }

  factory InventoryMechanismState.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return InventoryMechanismState(
      mechanismId: serializer.fromJson<int>(json['mechanismId']),
      currentStateId: serializer.fromJson<int>(json['currentStateId']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mechanismId': serializer.toJson<int>(mechanismId),
      'currentStateId': serializer.toJson<int>(currentStateId),
      'creationDate': serializer.toJson<DateTime>(creationDate),
    };
  }

  InventoryMechanismState copyWith(
          {int mechanismId, int currentStateId, DateTime creationDate}) =>
      InventoryMechanismState(
        mechanismId: mechanismId ?? this.mechanismId,
        currentStateId: currentStateId ?? this.currentStateId,
        creationDate: creationDate ?? this.creationDate,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryMechanismState(')
          ..write('mechanismId: $mechanismId, ')
          ..write('currentStateId: $currentStateId, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(mechanismId.hashCode,
      $mrjc(currentStateId.hashCode, creationDate.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is InventoryMechanismState &&
          other.mechanismId == this.mechanismId &&
          other.currentStateId == this.currentStateId &&
          other.creationDate == this.creationDate);
}

class InventoryMechanismStatesCompanion
    extends UpdateCompanion<InventoryMechanismState> {
  final Value<int> mechanismId;
  final Value<int> currentStateId;
  final Value<DateTime> creationDate;
  const InventoryMechanismStatesCompanion({
    this.mechanismId = const Value.absent(),
    this.currentStateId = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  InventoryMechanismStatesCompanion.insert({
    @required int mechanismId,
    @required int currentStateId,
    @required DateTime creationDate,
  })  : mechanismId = Value(mechanismId),
        currentStateId = Value(currentStateId),
        creationDate = Value(creationDate);
  static Insertable<InventoryMechanismState> custom({
    Expression<int> mechanismId,
    Expression<int> currentStateId,
    Expression<DateTime> creationDate,
  }) {
    return RawValuesInsertable({
      if (mechanismId != null) 'mechanism_id': mechanismId,
      if (currentStateId != null) 'current_state_id': currentStateId,
      if (creationDate != null) 'creation_date': creationDate,
    });
  }

  InventoryMechanismStatesCompanion copyWith(
      {Value<int> mechanismId,
      Value<int> currentStateId,
      Value<DateTime> creationDate}) {
    return InventoryMechanismStatesCompanion(
      mechanismId: mechanismId ?? this.mechanismId,
      currentStateId: currentStateId ?? this.currentStateId,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mechanismId.present) {
      map['mechanism_id'] = Variable<int>(mechanismId.value);
    }
    if (currentStateId.present) {
      map['current_state_id'] = Variable<int>(currentStateId.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    return map;
  }
}

class $InventoryMechanismStatesTable extends InventoryMechanismStates
    with TableInfo<$InventoryMechanismStatesTable, InventoryMechanismState> {
  final GeneratedDatabase _db;
  final String _alias;
  $InventoryMechanismStatesTable(this._db, [this._alias]);
  final VerificationMeta _mechanismIdMeta =
      const VerificationMeta('mechanismId');
  GeneratedIntColumn _mechanismId;
  @override
  GeneratedIntColumn get mechanismId =>
      _mechanismId ??= _constructMechanismId();
  GeneratedIntColumn _constructMechanismId() {
    return GeneratedIntColumn('mechanism_id', $tableName, false,
        $customConstraints: 'PRIMARY KEY');
  }

  final VerificationMeta _currentStateIdMeta =
      const VerificationMeta('currentStateId');
  GeneratedIntColumn _currentStateId;
  @override
  GeneratedIntColumn get currentStateId =>
      _currentStateId ??= _constructCurrentStateId();
  GeneratedIntColumn _constructCurrentStateId() {
    return GeneratedIntColumn(
      'current_state_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  GeneratedDateTimeColumn _creationDate;
  @override
  GeneratedDateTimeColumn get creationDate =>
      _creationDate ??= _constructCreationDate();
  GeneratedDateTimeColumn _constructCreationDate() {
    return GeneratedDateTimeColumn(
      'creation_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [mechanismId, currentStateId, creationDate];
  @override
  $InventoryMechanismStatesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'inventory_mechanism_states';
  @override
  final String actualTableName = 'inventory_mechanism_states';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryMechanismState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mechanism_id')) {
      context.handle(
          _mechanismIdMeta,
          mechanismId.isAcceptableOrUnknown(
              data['mechanism_id'], _mechanismIdMeta));
    } else if (isInserting) {
      context.missing(_mechanismIdMeta);
    }
    if (data.containsKey('current_state_id')) {
      context.handle(
          _currentStateIdMeta,
          currentStateId.isAcceptableOrUnknown(
              data['current_state_id'], _currentStateIdMeta));
    } else if (isInserting) {
      context.missing(_currentStateIdMeta);
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date'], _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  InventoryMechanismState map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return InventoryMechanismState.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $InventoryMechanismStatesTable createAlias(String alias) {
    return $InventoryMechanismStatesTable(_db, alias);
  }
}

class InventoryClue extends DataClass implements Insertable<InventoryClue> {
  final int clueId;
  final DateTime creationDate;
  InventoryClue({@required this.clueId, @required this.creationDate});
  factory InventoryClue.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return InventoryClue(
      clueId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}clue_id']),
      creationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || clueId != null) {
      map['clue_id'] = Variable<int>(clueId);
    }
    if (!nullToAbsent || creationDate != null) {
      map['creation_date'] = Variable<DateTime>(creationDate);
    }
    return map;
  }

  InventoryCluesCompanion toCompanion(bool nullToAbsent) {
    return InventoryCluesCompanion(
      clueId:
          clueId == null && nullToAbsent ? const Value.absent() : Value(clueId),
      creationDate: creationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(creationDate),
    );
  }

  factory InventoryClue.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return InventoryClue(
      clueId: serializer.fromJson<int>(json['clueId']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clueId': serializer.toJson<int>(clueId),
      'creationDate': serializer.toJson<DateTime>(creationDate),
    };
  }

  InventoryClue copyWith({int clueId, DateTime creationDate}) => InventoryClue(
        clueId: clueId ?? this.clueId,
        creationDate: creationDate ?? this.creationDate,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryClue(')
          ..write('clueId: $clueId, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(clueId.hashCode, creationDate.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is InventoryClue &&
          other.clueId == this.clueId &&
          other.creationDate == this.creationDate);
}

class InventoryCluesCompanion extends UpdateCompanion<InventoryClue> {
  final Value<int> clueId;
  final Value<DateTime> creationDate;
  const InventoryCluesCompanion({
    this.clueId = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  InventoryCluesCompanion.insert({
    @required int clueId,
    @required DateTime creationDate,
  })  : clueId = Value(clueId),
        creationDate = Value(creationDate);
  static Insertable<InventoryClue> custom({
    Expression<int> clueId,
    Expression<DateTime> creationDate,
  }) {
    return RawValuesInsertable({
      if (clueId != null) 'clue_id': clueId,
      if (creationDate != null) 'creation_date': creationDate,
    });
  }

  InventoryCluesCompanion copyWith(
      {Value<int> clueId, Value<DateTime> creationDate}) {
    return InventoryCluesCompanion(
      clueId: clueId ?? this.clueId,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clueId.present) {
      map['clue_id'] = Variable<int>(clueId.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    return map;
  }
}

class $InventoryCluesTable extends InventoryClues
    with TableInfo<$InventoryCluesTable, InventoryClue> {
  final GeneratedDatabase _db;
  final String _alias;
  $InventoryCluesTable(this._db, [this._alias]);
  final VerificationMeta _clueIdMeta = const VerificationMeta('clueId');
  GeneratedIntColumn _clueId;
  @override
  GeneratedIntColumn get clueId => _clueId ??= _constructClueId();
  GeneratedIntColumn _constructClueId() {
    return GeneratedIntColumn('clue_id', $tableName, false,
        $customConstraints: 'PRIMARY KEY');
  }

  final VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  GeneratedDateTimeColumn _creationDate;
  @override
  GeneratedDateTimeColumn get creationDate =>
      _creationDate ??= _constructCreationDate();
  GeneratedDateTimeColumn _constructCreationDate() {
    return GeneratedDateTimeColumn(
      'creation_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [clueId, creationDate];
  @override
  $InventoryCluesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'inventory_clues';
  @override
  final String actualTableName = 'inventory_clues';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryClue> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('clue_id')) {
      context.handle(_clueIdMeta,
          clueId.isAcceptableOrUnknown(data['clue_id'], _clueIdMeta));
    } else if (isInserting) {
      context.missing(_clueIdMeta);
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date'], _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  InventoryClue map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return InventoryClue.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $InventoryCluesTable createAlias(String alias) {
    return $InventoryCluesTable(_db, alias);
  }
}

abstract class _$InventoryDatabase extends GeneratedDatabase {
  _$InventoryDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $InventoryTracksTable _inventoryTracks;
  $InventoryTracksTable get inventoryTracks =>
      _inventoryTracks ??= $InventoryTracksTable(this);
  $InventoryItemsTable _inventoryItems;
  $InventoryItemsTable get inventoryItems =>
      _inventoryItems ??= $InventoryItemsTable(this);
  $InventoryMechanismStatesTable _inventoryMechanismStates;
  $InventoryMechanismStatesTable get inventoryMechanismStates =>
      _inventoryMechanismStates ??= $InventoryMechanismStatesTable(this);
  $InventoryCluesTable _inventoryClues;
  $InventoryCluesTable get inventoryClues =>
      _inventoryClues ??= $InventoryCluesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        inventoryTracks,
        inventoryItems,
        inventoryMechanismStates,
        inventoryClues
      ];
}
