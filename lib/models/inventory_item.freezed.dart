// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inventory_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InventoryItem _$InventoryItemFromJson(Map<String, dynamic> json) {
  return _InventoryItem.fromJson(json);
}

/// @nodoc
class _$InventoryItemTearOff {
  const _$InventoryItemTearOff();

  _InventoryItem call(
      {required int id,
      required DateTime creationDate,
      required bool isPickedUp,
      bool used = false}) {
    return _InventoryItem(
      id: id,
      creationDate: creationDate,
      isPickedUp: isPickedUp,
      used: used,
    );
  }

  InventoryItem fromJson(Map<String, Object?> json) {
    return InventoryItem.fromJson(json);
  }
}

/// @nodoc
const $InventoryItem = _$InventoryItemTearOff();

/// @nodoc
mixin _$InventoryItem {
  int get id => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  bool get isPickedUp => throw _privateConstructorUsedError;
  bool get used => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryItemCopyWith<InventoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryItemCopyWith<$Res> {
  factory $InventoryItemCopyWith(
          InventoryItem value, $Res Function(InventoryItem) then) =
      _$InventoryItemCopyWithImpl<$Res>;
  $Res call({int id, DateTime creationDate, bool isPickedUp, bool used});
}

/// @nodoc
class _$InventoryItemCopyWithImpl<$Res>
    implements $InventoryItemCopyWith<$Res> {
  _$InventoryItemCopyWithImpl(this._value, this._then);

  final InventoryItem _value;
  // ignore: unused_field
  final $Res Function(InventoryItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? creationDate = freezed,
    Object? isPickedUp = freezed,
    Object? used = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creationDate: creationDate == freezed
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPickedUp: isPickedUp == freezed
          ? _value.isPickedUp
          : isPickedUp // ignore: cast_nullable_to_non_nullable
              as bool,
      used: used == freezed
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InventoryItemCopyWith<$Res>
    implements $InventoryItemCopyWith<$Res> {
  factory _$InventoryItemCopyWith(
          _InventoryItem value, $Res Function(_InventoryItem) then) =
      __$InventoryItemCopyWithImpl<$Res>;
  @override
  $Res call({int id, DateTime creationDate, bool isPickedUp, bool used});
}

/// @nodoc
class __$InventoryItemCopyWithImpl<$Res>
    extends _$InventoryItemCopyWithImpl<$Res>
    implements _$InventoryItemCopyWith<$Res> {
  __$InventoryItemCopyWithImpl(
      _InventoryItem _value, $Res Function(_InventoryItem) _then)
      : super(_value, (v) => _then(v as _InventoryItem));

  @override
  _InventoryItem get _value => super._value as _InventoryItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? creationDate = freezed,
    Object? isPickedUp = freezed,
    Object? used = freezed,
  }) {
    return _then(_InventoryItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creationDate: creationDate == freezed
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPickedUp: isPickedUp == freezed
          ? _value.isPickedUp
          : isPickedUp // ignore: cast_nullable_to_non_nullable
              as bool,
      used: used == freezed
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InventoryItem extends _InventoryItem with DiagnosticableTreeMixin {
  const _$_InventoryItem(
      {required this.id,
      required this.creationDate,
      required this.isPickedUp,
      this.used = false})
      : super._();

  factory _$_InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$$_InventoryItemFromJson(json);

  @override
  final int id;
  @override
  final DateTime creationDate;
  @override
  final bool isPickedUp;
  @JsonKey()
  @override
  final bool used;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InventoryItem(id: $id, creationDate: $creationDate, isPickedUp: $isPickedUp, used: $used)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InventoryItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('creationDate', creationDate))
      ..add(DiagnosticsProperty('isPickedUp', isPickedUp))
      ..add(DiagnosticsProperty('used', used));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.creationDate, creationDate) &&
            const DeepCollectionEquality()
                .equals(other.isPickedUp, isPickedUp) &&
            const DeepCollectionEquality().equals(other.used, used));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(creationDate),
      const DeepCollectionEquality().hash(isPickedUp),
      const DeepCollectionEquality().hash(used));

  @JsonKey(ignore: true)
  @override
  _$InventoryItemCopyWith<_InventoryItem> get copyWith =>
      __$InventoryItemCopyWithImpl<_InventoryItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InventoryItemToJson(this);
  }
}

abstract class _InventoryItem extends InventoryItem {
  const factory _InventoryItem(
      {required int id,
      required DateTime creationDate,
      required bool isPickedUp,
      bool used}) = _$_InventoryItem;
  const _InventoryItem._() : super._();

  factory _InventoryItem.fromJson(Map<String, dynamic> json) =
      _$_InventoryItem.fromJson;

  @override
  int get id;
  @override
  DateTime get creationDate;
  @override
  bool get isPickedUp;
  @override
  bool get used;
  @override
  @JsonKey(ignore: true)
  _$InventoryItemCopyWith<_InventoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}
